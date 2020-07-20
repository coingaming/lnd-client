# lnd-client

## gRPC schema upgrade

- we are using this lnd version https://github.com/lightningnetwork/lnd/tree/v0.10.3-beta
- download fresh grpc files to proto directory, example https://github.com/lightningnetwork/lnd/blob/v0.10.3-beta/lnrpc/rpc.proto
- remove `google.api.http` options from proto files, they are not supported atm https://github.com/awakesecurity/proto3-suite/issues/118
- remove `lnrpc` namespace from messages if needed, example `lnrpc.RouteHint` -> `RouteHint`
- remove `extend` expressions from file if needed (not supported atm)
- run `./script/generate-lnd-grpc-source.sh $PROTO_FILE_NAME`
- add `import LndGrpc.Orphans` to generated file if needed (related to https://github.com/awakesecurity/proto3-suite/issues/119#issuecomment-628117916)
- manually fix namespace bug in generated file if needed https://github.com/awakesecurity/proto3-suite/issues/112
- add `{-# OPTIONS_GHC -Wno-missing-export-lists #-}` pragma to file if needed
