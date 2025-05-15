{ config, pkgs, ... }:

{
  home.username = "jupiter_euler";
  home.homeDirectory = "/home/jupiter_euler";
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };
	imports = [
		../modules/default.nix
	];
  home.packages = with pkgs; [

    neofetch
    nnn # terminal file manager

    obsidian
    # archives
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

    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring


    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    #Fonts
    fira-code
  ];

   # starship - an customizable prompt for any shell
  programs.fish = {
    enable = true;
    generateCompletions = true;
  };

  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
