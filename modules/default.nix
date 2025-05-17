{pkgs, lib, config, ...}: {
	
	home.stateVersion = "24.11";
	imports = [
		./git
		./kitty
		./shell
                ./nvf
	];
}
