{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-orphans #-}
{-# OPTIONS_GHC -Wno-partial-fields #-}

module Lentille.GitHub.Watching where

import Data.Morpheus.Client qualified
import Lentille.GitHub.RateLimit qualified
import Lentille.GraphQL qualified
import Monocle.Prelude
import Monocle.Protob.Crawler qualified

newtype DateTime = DateTime Text
  deriving (Show, Eq, Data.Morpheus.Client.EncodeScalar, Data.Morpheus.Client.DecodeScalar)

newtype URI = URI {unURI :: Text}
  deriving (Show, Eq, Data.Morpheus.Client.EncodeScalar, Data.Morpheus.Client.DecodeScalar)

-- https://docs.github.com/en/graphql/reference/objects#user
Data.Morpheus.Client.defineByDocumentFile
  Lentille.GraphQL.ghSchemaLocation
  [Data.Morpheus.Client.gql|
    query GetWatched ($login: String!, $cursor: String)  {
      rateLimit {
        used
        remaining
        resetAt
      }
      user(login: $login) {
        watching(last: 100, after: $cursor) {
          totalCount
          pageInfo {hasNextPage endCursor}
          nodes {
            url
          }
        }
      }
    }
  |]

transformResponse :: GetWatched -> Lentille.GraphQL.GraphResponse [Monocle.Protob.Crawler.Project]
transformResponse result = do
  case result of
    GetWatched
      (Just (RateLimitRateLimit used remaining (DateTime resetAtText)))
      ( Just
          ( UserUser
              ( UserWatchingRepositoryConnection
                  totalCount
                  (UserWatchingPageInfoPageInfo hasNextPage endCursor)
                  (Just watchedRepositories)
                )
            )
        ) ->
        let rateLimit = case parseDateValue $ from resetAtText of
              Just resetAt -> Lentille.GraphQL.RateLimit {..}
              Nothing -> error $ "Unable to parse the resetAt date string: " <> resetAtText
         in ( Lentille.GraphQL.PageInfo hasNextPage endCursor (Just totalCount)
            , Just rateLimit
            , []
            , getRepos watchedRepositories
            )
    _anyOtherResponse ->
      ( Lentille.GraphQL.PageInfo False Nothing Nothing
      , Nothing
      , ["Unknown GetWatched response: " <> show result]
      , []
      )
 where
  getRepos :: [Maybe UserWatchingNodesRepository] -> [Monocle.Protob.Crawler.Project]
  getRepos r = Monocle.Protob.Crawler.Project . from . unURI . url <$> catMaybes r

streamWatchedProjects ::
  Lentille.GraphQL.GraphEffects es =>
  Lentille.GraphQL.GraphClient ->
  Text ->
  Lentille.GraphQL.LentilleStream es Monocle.Protob.Crawler.Project
streamWatchedProjects client login =
  Lentille.GraphQL.streamFetch client mkArgs optParams transformResponse
 where
  mkArgs _ = GetWatchedArgs login
  optParams =
    Lentille.GraphQL.defaultStreamFetchOptParams
      { Lentille.GraphQL.fpRetryCheck = Lentille.GitHub.RateLimit.retryCheck
      , Lentille.GraphQL.fpGetRatelimit = Just Lentille.GitHub.RateLimit.getRateLimit
      }
