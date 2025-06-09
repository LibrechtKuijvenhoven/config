{ pkgs, ... }:

{
  programs.node = {
    enable = true;
    # Choose your desired Node.js version.
    # Check `nix search nixpkgs nodejs` for available versions (e.g., nodejs_20, nodejs_21, nodejs_lts)
    package = pkgs.nodejs_20; # Using Node.js 20 LTS as an example

    # Global npm packages you want available in your PATH
    npmPackages = [
      "yarn" # A common alternative package manager
      "prettier" # Code formatter
      "eslint" # JavaScript linter
      # Add any other global npm packages you need
      # e.g., "pnpm", "neovim", "webpack", "typescript" (if you want its CLI)
    ];
  };

  home.packages = with pkgs; [
    # TypeScript Language Server for editor integration
    nodePackages.typescript-language-server
    # A faster eslint daemon for better editor performance
    nodePackages.eslint_d
    # If you prefer to manage Bun via home-manager
    # bun
  ];
}
