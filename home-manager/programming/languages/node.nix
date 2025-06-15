{ pkgs, ... }:

{

  home.packages = with pkgs; [
    nodejs_24
    # TypeScript Language Server for editor integration
    typescript-language-server
    # A faster eslint daemon for better editor performance
    eslint_d

    yarn
    nodePackages.prettier

    # If you prefer to manage Bun via home-manager
    # bun
  ];
}
