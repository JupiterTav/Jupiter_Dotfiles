{
   description = "A simple flake";

   inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/";
			inputs.nixpkgs.follows = "nixpkgs";
		};

	   hyprpanel = {
         url = "github:jas-singhfsu/hyprpanel";
         inputs.nixpkgs.follows = "nixpkgs";
      };

		nvf = {
			url = "github:notashelf/nvf";
			inputs.nixpkgs.follows = "nixpkgs";
		};
        };
	outputs = {self, nixpkgs, home-manager, nvf, ...}@inputs: {
	
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem { 
         system = "x86_64-linux";
         modules = [
            ./nixos/configuration.nix
            home-manager.nixosModules.home-manager {	
               home-manager.useGlobalPkgs = true;
               home-manager.useUserPackages = true;
               home-manager.users.euler = import ./home-manager/home.nix;
               home-manager.extraSpecialArgs = {inherit inputs;};
            }
         ];
      };
	};
}

