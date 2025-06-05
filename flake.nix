{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";

 #    home-manager = {
 #      url = "github:nix-community/home-manager";
 #      inputs.nixpkgs.follows = "nixpkgs";
 #    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # use "nixos", or your hostname as the name of the configuration
    # it's a better practice than "default" shown in the video
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/default/configuration.nix
#        home-manager.nixosModules.default 
#	home-manager.nixosModules.home-manager {
#	  home-manager.useGlobalPkgs = true;
#	  home-manager.useUserPackages = true;
#	  home-manager.extraSpecialArgs = specialArgs;
#	}
      ];
    };
  };
}
