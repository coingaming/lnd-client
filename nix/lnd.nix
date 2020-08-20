{ buildGoModule, fetchFromGitHub, lib
, tags ? [ "autopilotrpc" "signrpc" "walletrpc" "chainrpc" "invoicesrpc" "watchtowerrpc" ]
}:

buildGoModule rec {
  pname = "lnd";
  version = "9763cfbd038668dbca5b1d97f8e2000d7e6e06b5";

  src = fetchFromGitHub {
    owner = "coingaming";
    repo = "lnd";
    rev = "${version}";
    sha256 = "0klhri2p72m01p2zq4mn59fdl2m05knnix4w876wcr5pajblss66";
  };

  vendorSha256 = "090b9sxvdwh787w0rhrcbky9pbx64qgqx1pvk9ysk3886nxdhf7k";

  doCheck = false;

  subPackages = ["cmd/lncli" "cmd/lnd"];

  preBuild = let
    buildVars = {
      RawTags = lib.concatStringsSep "," tags;
      GoVersion = "$(go version | egrep -o 'go[0-9]+[.][^ ]*')";
    };
    buildVarsFlags = lib.concatStringsSep " " (lib.mapAttrsToList (k: v: "-X github.com/coingaming/lnd/build.${k}=${v}") buildVars);
  in
  lib.optionalString (tags != []) ''
    buildFlagsArray+=("-tags=${lib.concatStringsSep " " tags}")
    buildFlagsArray+=("-ldflags=${buildVarsFlags}")
  '';

  meta = with lib; {
    description = "Lightning Network Daemon";
    homepage = "https://github.com/coingaming/lnd";
    license = lib.licenses.mit;
    maintainers = with maintainers; [ cypherpunk2140 ];
  };
}
