{ ... }:
{
  plugins.lsp.servers.gopls.enable = true;
  plugins.treesitter.grammarPackages = [ "go" "gomod" ];
}
