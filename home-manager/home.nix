{ config, pkgs, inputs, ... }:

{
  home.username = "euler";
  home.homeDirectory = "/home/euler";
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };
	imports = [
		../modules/default.nix
      inputs.nvf.homeManagerModules.default
];
  home.packages = with pkgs; [

    nnn # terminal file manager

    obsidian
    zip
    unzip 
    nitch

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
    brightnessctl

    nix-output-monitor
    clang
    clang-tools
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
