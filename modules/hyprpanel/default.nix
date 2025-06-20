{inputs, ...}: {
   imports = [inputs.hyprpanel.homeManagerModules.hyprpanel];

   programs.hyprpanel = {
      enable = true;
      systemd.enable = true;
      hyprland.enable = true;
      settings = {
        theme.name= "gruvbox_split";

        layout = {
           "bar.layouts" = {
              "0" = {
                 left = [ "dashboard" "workspaces"];
                 middle = [ "media" ];
                 right = [ "volume" "battery" "clock" "network" ];
              };
           };
        };
           bar.launcher.autoDetectIcon = true;
           bar.workspaces.show_icons = true;

           menus.clock = {
             time = {
               military = false;
               hideSeconds = true;
             };
           };

          menus.dashboard.stats.enable_gpu = true;
          theme.font = {
            name = "FiraCode Nerd Font";
            size = "12px";
          };
        };
   };
}
