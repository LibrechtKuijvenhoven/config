{ pkgs, ... }:

{

  home.packages = with pkgs; [
    # Nix Language Server for editor integration (e.g., Neovim, VS Code)
    nil # The Nix Language Server (NIL)
    # nixd # An alternative Nix Language Server (often used in VS Code)

    # Nix formatting tools
    nixpkgs-fmt # Nix code formatter

    # A useful tool for exploring Nixpkgs options
    nix-index # For `nix-index` command to find missing executables
    nix-tree # For visualizing dependency trees
  ];

  # You might also want to set up direnv integration here if you use it for project environments:
  # programs.direnv.enable = true;
  # programs.direnv.enableNix = true;
  # programs.direnv.nixAllowSymlink = true;
}
