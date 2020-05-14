# lnd-client

## LndGrpc upgrade

- download fresh lnd_grpc.proto to proto directory, example https://github.com/lightningnetwork/lnd/blob/2f84d1a819d000a561548f310a5eb250bfd81c77/lnrpc/rpc.proto
- remove `google.api.http` options from proto file, they are not supported atm https://github.com/awakesecurity/proto3-suite/issues/118
- remove `lnrpc` namespace from messages, example `lnrpc.RouteHint` -> `RouteHint`
- remove `extend` expressions from proto/google/api/annotations.proto (not supported atm)
- run `./script/generate-lnd-grpc-source.sh`
- add `import LndGrpc.Orphans` to generated LndGrpc.hs (related to https://github.com/awakesecurity/proto3-suite/issues/119#issuecomment-628117916)
- manually fix namespace bug in generated LndGrpc.hs https://github.com/awakesecurity/proto3-suite/issues/112
- add `{-# OPTIONS_GHC -Wno-missing-export-lists #-}` pragma to LndGrpc.hs
