{ pkgs, ... }:

{
  imports = [
    ./node.nix
    ./rust.nix
    ./go.nix
    ./nix.nix
    # Add any other language configuration files here
  ];
}
