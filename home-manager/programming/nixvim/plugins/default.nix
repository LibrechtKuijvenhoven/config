{ pkgs, ... }:

{
  imports = [
    ./telescope.nix
    ./lsp.nix
    ./web-devicons.nix
    ./neo-tree.nix
    ./tree-sitter.nix # Assuming you'll create this for syntax highlighting
    # Add any other plugin configuration files here
    # ./which-key.nix
    # ./gitsigns.nix
    # ./cmp.nix
  ];
}
