{pkgs, config, lib, ...}:{

	programs.kitty = {
		enable = true;
		font = {
			size  = 10;
			name = "Fira Code Nerd Font";
		};
		environment = {
			"LS_COLORS" = "1";
		};
		
			themeFile = "GruvboxMaterialDarkSoft";
		settings = {

			#keyboard latency
			input_delay = 0;
			repaint_delay = 2;
			sync_to_monitor = "no";
			wayland_enable_ime = "no";

			enable_audio_bell = false;
			confirm_os_window_close = 0;
	
			background_opacity = "1.0";
			tab_bar_style = "separator";
		};
		shellIntegration.enableZshIntegration = true;
	};
}
