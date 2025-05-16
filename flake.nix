{
	description = "A simple flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
			nvf.url = "github:notashelf/nvf";
};

	outputs = {self, nixpkgs, home-manager, nvf, ...}@inputs: let 
	
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
			configModule = {
				config.vim.theme.enable = true;
			};

			customNeovim = nvf.lib.neovimConfiguration {
				inherit pkgs;
				modules = [configModule];
			};
			in {
			packages.${system}.my-neovim = customNeovim.neovim;
			nixosConfigurations.nixos = nixpkgs.lib.nixosSystem { 
			
			specialArgs = {inherit system;};
			
			modules = [
				./nixos/configuration.nix
				
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;

					home-manager.users.jupiter_euler = import ./home-manager/home.nix;
				}
			 ];
			};

			homeConfigurations = {
				"jupiter_euler@nixos" = home-manager.homeManagerConfiguration {
					modules = [ {home.packages = [customNeovim.neovim];}];
				};
			};
		};
	}

