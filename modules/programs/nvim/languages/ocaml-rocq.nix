{ pkgs, ... }:
{
  plugins.lsp.servers.ocamllsp.enable = true;
  plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter-parsers; [ 
		ocaml
  ];
}
