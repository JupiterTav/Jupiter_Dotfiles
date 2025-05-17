{ config, pkgs, inputs, ... }:

{
  home.username = "jupiter_euler";
  home.homeDirectory = "/home/jupiter_euler";
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };
	imports = [
		../modules/default.nix

    inputs.nvf.homeManagerModules.default
];
  home.packages = with pkgs; [

    neofetch
    nnn # terminal file manager

    obsidian
    zip
    unzip 

    # utils
    ripgrep # recursively searches directories for a regex pattern
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    bat
    # misc
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    nix-output-monitor
    
    vim
    btop  # replacement of htop/nmon
    #Fonts
    fira-code
  ];
 # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
