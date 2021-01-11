{ buildGoModule, fetchFromGitHub, lib
, tags ? [ "autopilotrpc" "signrpc" "walletrpc" "chainrpc" "invoicesrpc" "watchtowerrpc" ]
}:

buildGoModule rec {
  pname = "lnd";
  version = "f76ca30c231c1c97319401cdf1955461a8f710d3";

  src = fetchFromGitHub {
    owner = "coingaming";
    repo = "lnd";
    rev = "${version}";
    sha256 = "0gnghv4yjxz1n42icib1s26sq0bxzwa81530y5vimqysn4ahasxr";
  };

  vendorSha256 = "00q8dydskzg4rhxnnpzpbmmvc3q4wzm8z3dps2bv0nx3fk0fmrl3";

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
