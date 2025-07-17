{pkgs, lib, config, ...}:{
  programs.lutris = {
    #    enable = true;
    extraPackages = with pkgs; [
      gamescope
      nspr
    ];
  };
}
