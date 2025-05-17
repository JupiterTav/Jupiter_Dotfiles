{
	description = "A simple flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		

		nvf = {
			url = "github:notashelf/nvf";
			inputs.nixpkgs.follows = "nixpkgs";
		};
        };
	outputs = {self, nixpkgs, home-manager, nvf, ...}@inputs: {
	
#			packages."x86_64-linux".default = (nvf.lib.neovimConfiguration {
 #                       pkgs = nixpkgs.legacyPackages."x86_64-linux";
  #                      modules = [ ./modules/nvf/default.nix];
   #             }).neovim;	
                nixosConfigurations.nixos = nixpkgs.lib.nixosSystem { 
                
                        system = "x86_64-linux";
                        modules = [
                                ./nixos/configuration.nix
                                home-manager.nixosModules.home-manager {	
                                        	home-manager.useGlobalPkgs = true;
                                        	home-manager.useUserPackages = true;
                                        	home-manager.users.jupiter_euler = import ./home-manager/home.nix;
						home-manager.extraSpecialArgs = {inherit inputs;};
                                	}
                        ];
                };
	};
}

