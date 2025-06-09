{ pkgs, ... }:

{
  programs.go = {
    enable = true;
    # Uses the default Go package from your Nixpkgs channel/flake.
    package = pkgs.go;
  };

  home.packages = with pkgs; [
    # Go Language Server for editor integration
    gopls
    # Other common Go tools
    delve # Go debugger
    # Add any other Go-specific tools you use regularly
  ];
}
