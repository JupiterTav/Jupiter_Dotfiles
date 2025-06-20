{config, pkgs, lib, ...}: {
   wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
      settings = {

         monitor = ",preferred,auto,1";
         "$terminal" = "kitty";
         "$fileManager" = "dolphin";
         "$menu" = "wofi --show drun";

         exec-once = [ 
         "./wallpaper.sh"
         "nm-applet &"
         ];


         env = [ 
         "XCURSOR_SIZE,24"
         "HYPRCURSOR_SIZE,24"
         "XDG_CURRENT_DESKTOP, Hyprland"
         "XDG_SESSION_TYPE, wayland"
         ];


         general = {
             gaps_in = 5;
             gaps_out = 10;
             border_size = 2;
             "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
             "col.inactive_border" = "rgba(595959aa)";
             resize_on_border = false;
             allow_tearing = false;

             layout = "dwindle;";
         };

         decoration = {
             rounding = 5;

             active_opacity = 1.0;
             inactive_opacity = 1.0;

             shadow = {
                 enabled = true;
                 range = 4;
                 render_power = 3;
                 color = "rgba(1a1a1aee)";
             };

             blur = {
                 enabled = true;
                 size = 3;
                 passes = 1;
                 vibrancy = 0.1696;
             };
         };

         animations = {
             enabled = "yes, please :)";

         bezier = [ 
         "easeOutQuint,0.23,1,0.32,1"
         "easeInOutCubic,0.65,0.05,0.36,1"
         "linear,0,0,1,1"
         "almostLinear,0.5,0.5,0.75,1.0"
         "quick,0.15,0,0.1,1"
         ];

         animation = [ 
         "global, 1, 10, default"
         "border, 1, 5.39, easeOutQuint"
         "windows, 1, 4.79, easeOutQuint"
         "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
         "windowsOut, 1, 1.49, linear, popin 87%"
         "fadeIn, 1, 1.73, almostLinear"
         "fadeOut, 1, 1.46, almostLinear"
         "fade, 1, 3.03, quick"
         "layers, 1, 3.81, easeOutQuint"
         "layersIn, 1, 4, easeOutQuint, fade"
         "layersOut, 1, 1.5, linear, fade"
         "fadeLayersIn, 1, 1.79, almostLinear"
         "fadeLayersOut, 1, 1.39, almostLinear"
         "workspaces, 1, 1.94, almostLinear, fade"
         "workspacesIn, 1, 1.21, almostLinear, fade"
         "workspacesOut, 1, 1.94, almostLinear, fade"
         ];

         };

         dwindle = {
             pseudotile = true;
             preserve_split = true;
         };
         master = {
             new_status = "master";
         };
         misc = {
             force_default_wallpaper = 0;
             disable_hyprland_logo = false;
         };
         input = {
             kb_layout = "br";
             follow_mouse = 1;

             sensitivity = 0;

             touchpad = {
                 natural_scroll = false;
             };
         };
         gestures = {
             workspace_swipe = false;
         };
         device = {
             name = "epic-mouse-v1";
             sensitivity = -0.5;
         };
         "$Mod" = "SUPER";

         bind = [ 
         "$Mod, Q, exec, $terminal"
         "$Mod, C, killactive,"
         "$Mod, B, exec, firefox"
         "$Mod, E, exec, $fileManager"
         "$Mod, V, togglefloating,"
         "$Mod, R, exec, $menu"
         "$Mod, P, pseudo, # dwindle"
         "$Mod, J, togglesplit, # dwindle"
         "$Mod, N, exec, obsidian"
         "$Mod, left, movefocus, l"
         "$Mod, right, movefocus, r"
         "$Mod, up, movefocus, u"
         "$Mod, down, movefocus, d"
         "$Mod, 1, workspace, 1"
         "$Mod, 2, workspace, 2"
         "$Mod, 3, workspace, 3"
         "$Mod, 4, workspace, 4"
         "$Mod, 5, workspace, 5"
         "$Mod, 6, workspace, 6"
         "$Mod, 7, workspace, 7"
         "$Mod, 8, workspace, 8"
         "$Mod, 9, workspace, 9"
         "$Mod, 0, workspace, 10"
         "$Mod SHIFT, 1, movetoworkspace, 1"
         "$Mod SHIFT, 2, movetoworkspace, 2"
         "$Mod SHIFT, 3, movetoworkspace, 3"
         "$Mod SHIFT, 4, movetoworkspace, 4"
         "$Mod SHIFT, 5, movetoworkspace, 5"
         "$Mod SHIFT, 6, movetoworkspace, 6"
         "$Mod SHIFT, 7, movetoworkspace, 7"
         "$Mod SHIFT, 8, movetoworkspace, 8"
         "$Mod SHIFT, 9, movetoworkspace, 9"
         "$Mod SHIFT, 0, movetoworkspace, 10"
         "$Mod, S, togglespecialworkspace, magic"
         "$Mod SHIFT, S, movetoworkspace, special:magic"
         "$Mod, mouse_down, workspace, e+1"
         "$Mod, mouse_up, workspace, e-1"
                  ];

         bindm = [ 
         "$Mod, mouse:272, movewindow"
         "$Mod, mouse:273, resizewindow"
                  ];

         bindel = [ 
         ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
         ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
         ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
         ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
         ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
         ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
                  ];

         bindl = [ 
         ", XF86AudioNext, exec, playerctl next"
         ", XF86AudioPause, exec, playerctl play-pause"
         ", XF86AudioPlay, exec, playerctl play-pause"
         ", XF86AudioPrev, exec, playerctl previous"
                  ];
            };
            };
         }
