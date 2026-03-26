{
  description = "OCaml + Rocq dev shell";
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
        ocaml
        opam
        ocamlPackages.ocaml-lsp
        ocamlPackages.ocamlformat
        ocamlPackages.utop       # OCaml REPL
        coq                      # Rocq/Coq proof assistant
        coqPackages.coq-lsp      # Rocq LSP
      ];
    };
  };
}
