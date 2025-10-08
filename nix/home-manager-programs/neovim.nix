{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      vimPlugins.packer-nvim
      ripgrep
      fd
      tree-sitter
      lua-language-server
      nil
    ];
  };

  # Copy Neovim config files from ./dotfiles/nvim_lsp/.config/nvim to ~/.config/nvim
  xdg.configFile = {
    "nvim/init.lua".source = ./neovim/init.lua;
    "nvim/after/plugin/checklist.lua".source = ./neovim/after/plugin/checklist.lua;
    "nvim/after/plugin/copilot.lua".source = ./neovim/after/plugin/copilot.lua;
    "nvim/after/plugin/fzf.lua".source = ./neovim/after/plugin/fzf.lua;
    "nvim/after/plugin/lsp.lua".source = ./neovim/after/plugin/lsp.lua;
    "nvim/after/plugin/nerdtree.lua".source = ./neovim/after/plugin/nerdtree.lua;
    "nvim/after/plugin/treesitter.lua".source = ./neovim/after/plugin/treesitter.lua;
    "nvim/lua/config/init.lua".source = ./neovim/lua/config/init.lua;
    "nvim/lua/config/maps.lua".source = ./neovim/lua/config/maps.lua;
    "nvim/lua/config/opts.lua".source = ./neovim/lua/config/opts.lua;
    "nvim/lua/config/plugins.lua".source = ./neovim/lua/config/plugins.lua;
  };
}
