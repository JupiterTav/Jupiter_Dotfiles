{pkgs, lib, config, ...}: {
	
	home.stateVersion = "24.11";
	import = [
		./git
	];
}
