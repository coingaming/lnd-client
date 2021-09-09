{ pkgs } :
let
  callPackage = pkgs.callPackage;
  lndnix = "${pkgs.path}/pkgs/applications/blockchains/lnd.nix";
  version = "0.13.1-beta.rc2";
  src = pkgs.fetchFromGitHub {
    owner = "lightningnetwork";
    repo = "lnd";
    rev = "v${version}";
    sha256 = "0rwsq1q2fb5g9fzn7i63k611pliz9csc4py9fbmnyd830d3k1bjj";
  };
in (callPackage lndnix {
      buildGoModule = args : pkgs.buildGoModule (args // {
        vendorSha256 = "1ihxl6014hxs0my0wn012vlxs0y5gfhr0z9irwii0pa3zwaarjca";
        inherit src version;
      });
    })

