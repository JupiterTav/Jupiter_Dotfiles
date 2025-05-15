{pkgs, lib, config, ...}:{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		history.ignorePatterns = ["rm *" "pkill *" "cp *"];

		antidote = {
    			enable = true;
    			plugins = [''
      				zsh-users/zsh-autosuggestions
    				jeffreytse/zsh-vi-mode
				mattmc3/ez-compinit
				zdharma-continuum/fast-syntax-highlighting kind:defer
				sindresorhus/pure     kind:fpath
				''];
			useFriendlyNames = true;
		};
		initExtra = ''
			autoload -Uz promptinit && promptinit 
			zstyle :prompt:pure:git:stash show yes
			prompt pure
		'';
	};	
}
