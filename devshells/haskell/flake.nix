{
  description = "Haskell dev shell";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { nixpkgs, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        ghc
        cabal-install
        haskell-language-server
        haskellPackages.fourmolu  # formatter
        haskellPackages.hlint
      ];
    };
  };
}
