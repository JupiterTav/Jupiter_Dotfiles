{pkgs, lib, ...}: {
        
programs.nvf = {
    enable =  true;
        settings = {
            vim = {
                options = {
                    shiftwidth = 2;
                    tabstop = 2;
                };
                
                theme = {
                    enable = true;
                    name = "gruvbox";
                    style = "dark";
                };

                statusline.lualine.enable = true;
                autopairs.nvim-autopairs.enable = false;
                telescope.enable = true;
                autocomplete.blink-cmp.enable = true;
                snippets.luasnip.enable = true;
                languages = {
                    enableTreesitter = true;
                    enableFormat = true;

                    nix.enable = true;
                    clang.enable = true;
                    rust.enable = true;
                };
                lsp = {
                    enable = true;
                    lspsaga.enable = true;
                    lspkind.enable = true;
                    trouble.enable = true;
                    otter-nvim.enable = true;
                };
                debugger = {
                  nvim-dap = {
                     enable = true;
                     ui.enable = true;
                  };
                };
                visuals = {
                    nvim-web-devicons.enable = true;
                    cinnamon-nvim.enable = true;
                    indent-blankline.enable = true;
                };

                ui = {
                    borders.enable = true;
                    colorizer.enable = true;
                    modes-nvim.enable = true;
                    fastaction.enable = true;
                };

                binds = {
                    whichKey.enable = true;
                    cheatsheet.enable = true;
                    hardtime-nvim.enable = true;
                };

                git = {
                    enable = true;
                    gitsigns.enable = true;
                    gitsigns.codeActions.enable = false; 
                };
                utility = {
                       diffview-nvim.enable = true;
            };
        };
    };
   };}
