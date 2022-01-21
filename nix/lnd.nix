{ pkgs } :
let
  callPackage = pkgs.callPackage;
  lndnix = "${pkgs.path}/pkgs/applications/blockchains/lnd.nix";
  version = "0.14.0-beta";
  src = pkgs.fetchFromGitHub {
    owner = "lightningnetwork";
    repo = "lnd";
    rev = "v${version}";
    sha256 = "0pf84l46cfhbmbzjdkpmqp494wqix8715zawm537mm94k3q25bis";
  };
in (callPackage lndnix {
      buildGoModule = args : pkgs.buildGoModule (args // {
        vendorSha256 = "1481zscd9lrnzxsaxkpaaa8fjazmfynhim13f8lj2yd9d21j5d31";
        inherit src version;
      });
    })

