{ pkgs, ... }:
{
  plugins.lsp.servers.zls.enable = true;
  plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter-parsers; [
		zig
	];
}
