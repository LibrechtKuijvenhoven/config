{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
    };

    nyx.url = "github:/LibrechtKuijvenhoven/nixvim";
  };

  outputs = { self, nixpkgs, home-manager,nyx, ... }@inputs: {
    # use "nixos", or your hostname as the name of the configuration
    # it's a better practice than "default" shown in the video
    nixosConfigurations = {
    # Desktop config
    atlas = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [
        ./hosts/atlas/configuration.nix
	home-manager.nixosModules.home-manager {
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.librechtk = {
	    imports = [ 
	    	./home-manager/atlas-librecht.nix
		nyx.homeModules.nixvim
	    ];
	  };
	}
      ];
    };
  };
  };
}
