{ ... }:
{
  plugins.lsp.servers.ocamllsp.enable = true;
  plugins.treesitter.grammarPackages = [ "ocaml" "ocaml_interface" ];
}
