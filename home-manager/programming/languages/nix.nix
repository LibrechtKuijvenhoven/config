{ pkgs, ... }:

{
  programs.nix = {
    enable = true;
    # Enables Nix command and sets up necessary user-level configurations.
    # This ensures tools like `nix develop`, `nix build`, `nix shell`, etc. work.

    # If you use Nix Flakes (highly recommended!), ensure this is set:
    package = pkgs.nix; # Use the default Nix package from pkgs.
    # Alternatively, you could try to pull a specific version if needed:
    # package = pkgs.nixFlakes; # If your Nixpkgs version requires this for flakes.
    # Note: Modern Nixpkgs usually have flakes enabled in pkgs.nix by default.

    # Enable Nix Flakes experimental feature if not already enabled system-wide
    # (though often better to enable system-wide in configuration.nix)
    # This adds 'experimental-features = nix-command flakes' to ~/.config/nix/nix.conf
    extraOptions = ''experimental-features = nix-command flakes'';
  };

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
