# let
#   pkgs = (import ./nix/header.nix).pkgs;
#   lnd = import ./nix/lnd.nix { inherit pkgs; };
#
#   inherit (pkgs.haskell-nix) haskellLib;
#
#   project = haskellLib.project {
#     src = pkgs.haskell-nix.haskellLib.cleanGit {
#       name = "lnd-client";
#       src = ./.;
#     };
#     compiler-nix-name = "ghc865";
#
#     modules = [{
#       packages.lnd-client.components.library.doCoverage = true;
#     }];
#   };
#
#   customCoverageReport = haskellLib.coverageReport rec {
#     name = "lnd-client-unit-tests-only";
# #inherit (project.lnd-client.components) library;
#     checks = [project.lnd-client.components.checks.unit-test];
#     # Note that this is the default value of the "mixLibraries"
#     # argument and so this line isn't really necessary.
#     mixLibraries = [project.lnd-client.components.library];
#   };
#   allUnitTestsProjectCoverageReport = haskellLib.projectCoverageReport [customCoverageReport];
# in {
#   inherit project customCoverageReport allUnitTestsProjectCoverageReport;
# }


let
  pkgs = (import ./nix/header.nix).pkgs;
  lnd = import ./nix/lnd.nix { inherit pkgs; };
in pkgs.haskell-nix.project {
  projectFileName = "cabal.project";
  src = pkgs.haskell-nix.haskellLib.cleanGit {
    name = "lnd-client";
    src = ./.;
  };
  compiler-nix-name = "ghc865";
#configureArgs = "--hpc-options='--exclude=Proto.InvoiceGrpc --exclude=Proto.InvoiceGrpc_Fields --exclude=Proto.LndGrpc --exclude=Proto.LndGrpc_Fields --exclude=Proto.RouterGrpc --exclude=Proto.RouterGrpc_Fields --exclude=Proto.WalletUnlockerGrpc --exclude=Proto.WalletUnlockerGrpc_Fields'";
  modules = [{
    packages.lnd-client.components.library.doCoverage = true;
    packages.lnd-client.components.library.configureFlags = [
      "--hpc-option=--exclude=Proto.InvoiceGrpc"
    ];
    packages.lnd-client.components.library.testFlags = [
      "--hpc-option=--exclude=Proto.InvoiceGrpc"
    ];
#    packages.lnd-client.components.library.appendConfigureFlag = "--hpc-options='--exclude=Proto.InvoiceGrpc --exclude=Proto.InvoiceGrpc_Fields --exclude=Proto.LndGrpc --exclude=Proto.LndGrpc_Fields --exclude=Proto.RouterGrpc --exclude=Proto.RouterGrpc_Fields --exclude=Proto.WalletUnlockerGrpc --exclude=Proto.WalletUnlockerGrpc_Fields'";

    packages.lnd-client.components.tests.lnd-client-test.preCheck = ''
      ./script/unstack.sh prepare
      . ./script/export-test-envs.sh
    '';
    packages.lnd-client.components.tests.lnd-client-test.build-tools = [
      pkgs.haskellPackages.hspec-discover
      pkgs.bitcoin
      pkgs.openssl
      pkgs.expect
      pkgs.jq
      lnd
    ];
    packages.lnd-client.components.tests.lnd-client-test.postCheck = ''
      ./script/unstack.sh clean
    '';
  }];
}
