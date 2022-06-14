let
  header = (import ./header.nix);
  proto-lens-src = fetchGit {
    url = "git@github.com:coingaming/proto-lens.git";
    ref = "master";
    rev = "7e75e2c95d9bf608965ff8335ee618978181034a";
  };
  proto-lens-protoc = header.pkgs.haskell-nix.project {
    src = "${proto-lens-src}/proto-lens-protoc";
    compiler-nix-name = "ghc902";
  };
in
  proto-lens-protoc.hsPkgs.proto-lens-protoc.components.exes.proto-lens-protoc

