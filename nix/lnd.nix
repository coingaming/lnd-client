{ pkgs } :
let
  callPackage = pkgs.callPackage;
  lndnix = "${pkgs.path}/pkgs/applications/blockchains/lnd/default.nix";
  version = "0.15.4-beta";
  src = pkgs.fetchFromGitHub {
    owner = "lightningnetwork";
    repo = "lnd";
    rev = "v${version}";
    sha256 = "sha256-/PKW2Y6+PlWk88pC4DHFi1ZRqMfQzoO9MVLYZrB2UNc=";
  };
in (callPackage lndnix {
      buildGoModule = args : pkgs.buildGoModule (args // {
        vendorSha256 = "sha256-bUo0PhtOFhsZfhAXtRJMjfaLrAsOv3ksxsrPOlMNv48=";
        inherit src version;
      });
    })

