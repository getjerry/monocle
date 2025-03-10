{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE NoGeneralisedNewtypeDeriving #-}
{-# OPTIONS_GHC -fno-warn-missing-export-lists #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- | Generated by Haskell protocol buffer compiler. DO NOT EDIT!
module Monocle.Protob.Auth where

import Control.Applicative ((<$>), (<*>), (<|>))
import Control.Applicative qualified as Hs
import Control.DeepSeq qualified as Hs
import Control.Monad qualified as Hs
import Data.ByteString qualified as Hs
import Data.Coerce qualified as Hs
import Data.Int qualified as Hs (Int16, Int32, Int64)
import Data.List.NonEmpty qualified as Hs (NonEmpty (..))
import Data.Map qualified as Hs (Map, mapKeysMonotonic)
import Data.Proxy qualified as Proxy
import Data.String qualified as Hs (fromString)
import Data.Text.Lazy qualified as Hs (Text)
import Data.Vector qualified as Hs (Vector)
import Data.Word qualified as Hs (Word16, Word32, Word64)
import GHC.Enum qualified as Hs
import GHC.Generics qualified as Hs
import Proto3.Suite.Class qualified as HsProtobuf
import Proto3.Suite.DotProto qualified as HsProtobuf
import Proto3.Suite.JSONPB ((.:), (.=))
import Proto3.Suite.JSONPB qualified as HsJSONPB
import Proto3.Suite.Types qualified as HsProtobuf
import Proto3.Wire qualified as HsProtobuf
import Unsafe.Coerce qualified as Hs
import Prelude qualified as Hs

newtype GetMagicJwtRequest = GetMagicJwtRequest
  { getMagicJwtRequestToken ::
      Hs.Text
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named GetMagicJwtRequest where
  nameOf _ = (Hs.fromString "GetMagicJwtRequest")

instance HsProtobuf.HasDefault GetMagicJwtRequest

instance HsProtobuf.Message GetMagicJwtRequest where
  encodeMessage
    _
    GetMagicJwtRequest
      { getMagicJwtRequestToken =
        getMagicJwtRequestToken
      } =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                getMagicJwtRequestToken
            )
          ]
      )
  decodeMessage _ =
    (Hs.pure GetMagicJwtRequest)
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 1)
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "token")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB GetMagicJwtRequest where
  toJSONPB (GetMagicJwtRequest f1) =
    (HsJSONPB.object ["token" .= f1])
  toEncodingPB (GetMagicJwtRequest f1) =
    (HsJSONPB.pairs ["token" .= f1])

instance HsJSONPB.FromJSONPB GetMagicJwtRequest where
  parseJSONPB =
    ( HsJSONPB.withObject
        "GetMagicJwtRequest"
        (\obj -> (Hs.pure GetMagicJwtRequest) <*> obj .: "token")
    )

instance HsJSONPB.ToJSON GetMagicJwtRequest where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON GetMagicJwtRequest where
  parseJSON = HsJSONPB.parseJSONPB

data GetMagicJwtError
  = GetMagicJwtErrorInvalidAdminToken
  | GetMagicJwtErrorMagicTokenDisabled
  | GetMagicJwtErrorMagicTokenCreateError
  deriving (Hs.Show, Hs.Eq, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named GetMagicJwtError where
  nameOf _ = (Hs.fromString "GetMagicJwtError")

instance HsProtobuf.HasDefault GetMagicJwtError

instance Hs.Bounded GetMagicJwtError where
  minBound = GetMagicJwtErrorInvalidAdminToken
  maxBound = GetMagicJwtErrorMagicTokenCreateError

instance Hs.Ord GetMagicJwtError where
  compare x y =
    Hs.compare
      (HsProtobuf.fromProtoEnum x)
      (HsProtobuf.fromProtoEnum y)

instance HsProtobuf.ProtoEnum GetMagicJwtError where
  toProtoEnumMay 0 = Hs.Just GetMagicJwtErrorInvalidAdminToken
  toProtoEnumMay 1 = Hs.Just GetMagicJwtErrorMagicTokenDisabled
  toProtoEnumMay 2 = Hs.Just GetMagicJwtErrorMagicTokenCreateError
  toProtoEnumMay _ = Hs.Nothing
  fromProtoEnum (GetMagicJwtErrorInvalidAdminToken) = 0
  fromProtoEnum (GetMagicJwtErrorMagicTokenDisabled) = 1
  fromProtoEnum (GetMagicJwtErrorMagicTokenCreateError) = 2

instance HsJSONPB.ToJSONPB GetMagicJwtError where
  toJSONPB x _ = HsJSONPB.enumFieldString x
  toEncodingPB x _ = HsJSONPB.enumFieldEncoding x

instance HsJSONPB.FromJSONPB GetMagicJwtError where
  parseJSONPB (HsJSONPB.String "InvalidAdminToken") =
    Hs.pure GetMagicJwtErrorInvalidAdminToken
  parseJSONPB (HsJSONPB.String "MagicTokenDisabled") =
    Hs.pure GetMagicJwtErrorMagicTokenDisabled
  parseJSONPB (HsJSONPB.String "MagicTokenCreateError") =
    Hs.pure GetMagicJwtErrorMagicTokenCreateError
  parseJSONPB v = (HsJSONPB.typeMismatch "GetMagicJwtError" v)

instance HsJSONPB.ToJSON GetMagicJwtError where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON GetMagicJwtError where
  parseJSON = HsJSONPB.parseJSONPB

instance HsProtobuf.Finite GetMagicJwtError

newtype GetMagicJwtResponse = GetMagicJwtResponse
  { getMagicJwtResponseResult ::
      Hs.Maybe GetMagicJwtResponseResult
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named GetMagicJwtResponse where
  nameOf _ = (Hs.fromString "GetMagicJwtResponse")

instance HsProtobuf.HasDefault GetMagicJwtResponse

instance HsProtobuf.Message GetMagicJwtResponse where
  encodeMessage
    _
    GetMagicJwtResponse
      { getMagicJwtResponseResult =
        getMagicJwtResponseResult
      } =
      ( Hs.mconcat
          [ case getMagicJwtResponseResult of
              Hs.Nothing -> Hs.mempty
              Hs.Just x ->
                case x of
                  GetMagicJwtResponseResultError y ->
                    ( HsProtobuf.encodeMessageField
                        (HsProtobuf.FieldNumber 1)
                        (HsProtobuf.ForceEmit y)
                    )
                  GetMagicJwtResponseResultJwt y ->
                    ( HsProtobuf.encodeMessageField
                        (HsProtobuf.FieldNumber 2)
                        (HsProtobuf.ForceEmit y)
                    )
          ]
      )
  decodeMessage _ =
    (Hs.pure GetMagicJwtResponse)
      <*> ( HsProtobuf.oneof
              Hs.Nothing
              [
                ( (HsProtobuf.FieldNumber 1)
                , (Hs.pure (Hs.Just Hs.. GetMagicJwtResponseResultError))
                    <*> HsProtobuf.decodeMessageField
                )
              ,
                ( (HsProtobuf.FieldNumber 2)
                , (Hs.pure (Hs.Just Hs.. GetMagicJwtResponseResultJwt))
                    <*> HsProtobuf.decodeMessageField
                )
              ]
          )
  dotProto _ = []

instance HsJSONPB.ToJSONPB GetMagicJwtResponse where
  toJSONPB (GetMagicJwtResponse f1_or_f2) =
    ( HsJSONPB.object
        [ ( let encodeResult =
                  ( case f1_or_f2 of
                      Hs.Just (GetMagicJwtResponseResultError f1) ->
                        (HsJSONPB.pair "error" f1)
                      Hs.Just (GetMagicJwtResponseResultJwt f2) ->
                        (HsJSONPB.pair "jwt" f2)
                      Hs.Nothing -> Hs.mempty
                  )
             in \options ->
                  if HsJSONPB.optEmitNamedOneof options
                    then
                      ("result" .= (HsJSONPB.objectOrNull [encodeResult] options))
                        options
                    else encodeResult options
          )
        ]
    )
  toEncodingPB (GetMagicJwtResponse f1_or_f2) =
    ( HsJSONPB.pairs
        [ ( let encodeResult =
                  ( case f1_or_f2 of
                      Hs.Just (GetMagicJwtResponseResultError f1) ->
                        (HsJSONPB.pair "error" f1)
                      Hs.Just (GetMagicJwtResponseResultJwt f2) ->
                        (HsJSONPB.pair "jwt" f2)
                      Hs.Nothing -> Hs.mempty
                  )
             in \options ->
                  if HsJSONPB.optEmitNamedOneof options
                    then ("result" .= (HsJSONPB.pairsOrNull [encodeResult] options)) options
                    else encodeResult options
          )
        ]
    )

instance HsJSONPB.FromJSONPB GetMagicJwtResponse where
  parseJSONPB =
    ( HsJSONPB.withObject
        "GetMagicJwtResponse"
        ( \obj ->
            (Hs.pure GetMagicJwtResponse)
              <*> ( let parseResult parseObj =
                          Hs.msum
                            [ Hs.Just Hs.. GetMagicJwtResponseResultError
                                <$> (HsJSONPB.parseField parseObj "error")
                            , Hs.Just Hs.. GetMagicJwtResponseResultJwt
                                <$> (HsJSONPB.parseField parseObj "jwt")
                            , Hs.pure Hs.Nothing
                            ]
                     in ( (obj .: "result")
                            Hs.>>= (HsJSONPB.withObject "result" parseResult)
                        )
                          <|> (parseResult obj)
                  )
        )
    )

instance HsJSONPB.ToJSON GetMagicJwtResponse where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON GetMagicJwtResponse where
  parseJSON = HsJSONPB.parseJSONPB

data GetMagicJwtResponseResult
  = GetMagicJwtResponseResultError
      ( HsProtobuf.Enumerated
          Monocle.Protob.Auth.GetMagicJwtError
      )
  | GetMagicJwtResponseResultJwt Hs.Text
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named GetMagicJwtResponseResult where
  nameOf _ = (Hs.fromString "GetMagicJwtResponseResult")

newtype WhoAmiRequest = WhoAmiRequest {whoAmiRequestVoid :: Hs.Text}
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named WhoAmiRequest where
  nameOf _ = (Hs.fromString "WhoAmiRequest")

instance HsProtobuf.HasDefault WhoAmiRequest

instance HsProtobuf.Message WhoAmiRequest where
  encodeMessage
    _
    WhoAmiRequest {whoAmiRequestVoid = whoAmiRequestVoid} =
      ( Hs.mconcat
          [ ( HsProtobuf.encodeMessageField
                (HsProtobuf.FieldNumber 1)
                whoAmiRequestVoid
            )
          ]
      )
  decodeMessage _ =
    (Hs.pure WhoAmiRequest)
      <*> ( HsProtobuf.at
              HsProtobuf.decodeMessageField
              (HsProtobuf.FieldNumber 1)
          )
  dotProto _ =
    [ ( HsProtobuf.DotProtoField
          (HsProtobuf.FieldNumber 1)
          (HsProtobuf.Prim HsProtobuf.String)
          (HsProtobuf.Single "void")
          []
          ""
      )
    ]

instance HsJSONPB.ToJSONPB WhoAmiRequest where
  toJSONPB (WhoAmiRequest f1) = (HsJSONPB.object ["void" .= f1])
  toEncodingPB (WhoAmiRequest f1) = (HsJSONPB.pairs ["void" .= f1])

instance HsJSONPB.FromJSONPB WhoAmiRequest where
  parseJSONPB =
    ( HsJSONPB.withObject
        "WhoAmiRequest"
        (\obj -> (Hs.pure WhoAmiRequest) <*> obj .: "void")
    )

instance HsJSONPB.ToJSON WhoAmiRequest where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON WhoAmiRequest where
  parseJSON = HsJSONPB.parseJSONPB

data WhoAmiError = WhoAmiErrorUnAuthorized
  deriving (Hs.Show, Hs.Eq, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named WhoAmiError where
  nameOf _ = (Hs.fromString "WhoAmiError")

instance HsProtobuf.HasDefault WhoAmiError

instance Hs.Bounded WhoAmiError where
  minBound = WhoAmiErrorUnAuthorized
  maxBound = WhoAmiErrorUnAuthorized

instance Hs.Ord WhoAmiError where
  compare x y =
    Hs.compare
      (HsProtobuf.fromProtoEnum x)
      (HsProtobuf.fromProtoEnum y)

instance HsProtobuf.ProtoEnum WhoAmiError where
  toProtoEnumMay 0 = Hs.Just WhoAmiErrorUnAuthorized
  toProtoEnumMay _ = Hs.Nothing
  fromProtoEnum (WhoAmiErrorUnAuthorized) = 0

instance HsJSONPB.ToJSONPB WhoAmiError where
  toJSONPB x _ = HsJSONPB.enumFieldString x
  toEncodingPB x _ = HsJSONPB.enumFieldEncoding x

instance HsJSONPB.FromJSONPB WhoAmiError where
  parseJSONPB (HsJSONPB.String "UnAuthorized") =
    Hs.pure WhoAmiErrorUnAuthorized
  parseJSONPB v = (HsJSONPB.typeMismatch "WhoAmiError" v)

instance HsJSONPB.ToJSON WhoAmiError where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON WhoAmiError where
  parseJSON = HsJSONPB.parseJSONPB

instance HsProtobuf.Finite WhoAmiError

newtype WhoAmiResponse = WhoAmiResponse
  { whoAmiResponseResult ::
      Hs.Maybe WhoAmiResponseResult
  }
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named WhoAmiResponse where
  nameOf _ = (Hs.fromString "WhoAmiResponse")

instance HsProtobuf.HasDefault WhoAmiResponse

instance HsProtobuf.Message WhoAmiResponse where
  encodeMessage
    _
    WhoAmiResponse {whoAmiResponseResult = whoAmiResponseResult} =
      ( Hs.mconcat
          [ case whoAmiResponseResult of
              Hs.Nothing -> Hs.mempty
              Hs.Just x ->
                case x of
                  WhoAmiResponseResultError y ->
                    ( HsProtobuf.encodeMessageField
                        (HsProtobuf.FieldNumber 1)
                        (HsProtobuf.ForceEmit y)
                    )
                  WhoAmiResponseResultUid y ->
                    ( HsProtobuf.encodeMessageField
                        (HsProtobuf.FieldNumber 2)
                        (HsProtobuf.ForceEmit y)
                    )
          ]
      )
  decodeMessage _ =
    (Hs.pure WhoAmiResponse)
      <*> ( HsProtobuf.oneof
              Hs.Nothing
              [
                ( (HsProtobuf.FieldNumber 1)
                , (Hs.pure (Hs.Just Hs.. WhoAmiResponseResultError))
                    <*> HsProtobuf.decodeMessageField
                )
              ,
                ( (HsProtobuf.FieldNumber 2)
                , (Hs.pure (Hs.Just Hs.. WhoAmiResponseResultUid))
                    <*> HsProtobuf.decodeMessageField
                )
              ]
          )
  dotProto _ = []

instance HsJSONPB.ToJSONPB WhoAmiResponse where
  toJSONPB (WhoAmiResponse f1_or_f2) =
    ( HsJSONPB.object
        [ ( let encodeResult =
                  ( case f1_or_f2 of
                      Hs.Just (WhoAmiResponseResultError f1) ->
                        (HsJSONPB.pair "error" f1)
                      Hs.Just (WhoAmiResponseResultUid f2) -> (HsJSONPB.pair "uid" f2)
                      Hs.Nothing -> Hs.mempty
                  )
             in \options ->
                  if HsJSONPB.optEmitNamedOneof options
                    then
                      ("result" .= (HsJSONPB.objectOrNull [encodeResult] options))
                        options
                    else encodeResult options
          )
        ]
    )
  toEncodingPB (WhoAmiResponse f1_or_f2) =
    ( HsJSONPB.pairs
        [ ( let encodeResult =
                  ( case f1_or_f2 of
                      Hs.Just (WhoAmiResponseResultError f1) ->
                        (HsJSONPB.pair "error" f1)
                      Hs.Just (WhoAmiResponseResultUid f2) -> (HsJSONPB.pair "uid" f2)
                      Hs.Nothing -> Hs.mempty
                  )
             in \options ->
                  if HsJSONPB.optEmitNamedOneof options
                    then ("result" .= (HsJSONPB.pairsOrNull [encodeResult] options)) options
                    else encodeResult options
          )
        ]
    )

instance HsJSONPB.FromJSONPB WhoAmiResponse where
  parseJSONPB =
    ( HsJSONPB.withObject
        "WhoAmiResponse"
        ( \obj ->
            (Hs.pure WhoAmiResponse)
              <*> ( let parseResult parseObj =
                          Hs.msum
                            [ Hs.Just Hs.. WhoAmiResponseResultError
                                <$> (HsJSONPB.parseField parseObj "error")
                            , Hs.Just Hs.. WhoAmiResponseResultUid
                                <$> (HsJSONPB.parseField parseObj "uid")
                            , Hs.pure Hs.Nothing
                            ]
                     in ( (obj .: "result")
                            Hs.>>= (HsJSONPB.withObject "result" parseResult)
                        )
                          <|> (parseResult obj)
                  )
        )
    )

instance HsJSONPB.ToJSON WhoAmiResponse where
  toJSON = HsJSONPB.toAesonValue
  toEncoding = HsJSONPB.toAesonEncoding

instance HsJSONPB.FromJSON WhoAmiResponse where
  parseJSON = HsJSONPB.parseJSONPB

data WhoAmiResponseResult
  = WhoAmiResponseResultError
      ( HsProtobuf.Enumerated
          Monocle.Protob.Auth.WhoAmiError
      )
  | WhoAmiResponseResultUid Hs.Text
  deriving (Hs.Show, Hs.Eq, Hs.Ord, Hs.Generic, Hs.NFData)

instance HsProtobuf.Named WhoAmiResponseResult where
  nameOf _ = (Hs.fromString "WhoAmiResponseResult")
