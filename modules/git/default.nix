{pkgs, lib, config, ...}: {
	programs.git = {
		enable = true;
		userName = "JupiterTav";
		userEmail = "wesleyTavaresDev@outlook.com";
		diff-highlight.enable = true;
	};
}


