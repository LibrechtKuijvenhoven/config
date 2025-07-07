{ pkgs, ... }:

{
  imports = [
    ./telescope.nix
    ./lsp.nix
    ./web-dev-icons.nix
    ./neo-tree.nix
    ./treesitter.nix # Assuming you'll create this for syntax highlighting
    # Add any other plugin configuration files here
    # ./which-key.nix
    # ./gitsigns.nix
    # ./cmp.nix
  ];
}
