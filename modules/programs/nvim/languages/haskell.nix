{ pkgs, ... }:
{
  plugins.lsp.servers.hls.enable = true;
  plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter-parsers; [ haskell ];
}
