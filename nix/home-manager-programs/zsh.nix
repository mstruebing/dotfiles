{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "jispwoso";
      plugins = [
        "git"
        "kubectl"
        "ssh-agent"
      ];
    };

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "dl" = "cd ~/Downloads";
      "p" = "cd ~/projects";
      "pw" = "cd ~/projects/work";
      "po" = "cd ~/projects/own";
      "pc" = "cd ~/projects/contrib";
      "pt" = "cd ~/projects/trying";
      "t" = "cd /tmp";
      "docs" = "cd ~/Documents";
      "dots" = "cd ~/projects/own/dotfiles/ && nvim";
      "notes" = "cd ~/projects/own/log/ && nvim";
      "g" = "git";
      "gpc" = "git push origin $(git_current_branch)";
      "gup" = "git pull origin $(git_current_branch)";
      "n" = "nvim";
      "mux" = "tmuxinator";
      "k" = "kubectl";
      "ls" = "ls -lah --color=auto";
      "tmux" = "tmux -2u";
    };
    initContent = ''
      # Editor and GPG
      export EDITOR="nvim"

      # Local bin dir
      export PATH="$HOME/bin:$PATH"
      export ZSH_THEME="jispwoso"

      # Automatically start or attach to an existing tmux session
      [ -z "$TMUX"  ] && { tmux -2u attach || exec tmux -2u new-session;}

      # Use colordiff if present
      if command -v colordiff > /dev/null; then
          alias diff='colordiff -u'
      else
          alias diff='diff -u'
      fi

      # Functions
      function cd() {
        builtin cd "$@" && ls -lah --color=auto && pwd
      }
      function mkd() {
        mkdir -p "$@" && cd "$@";
      }
      function cdg() {
        cd $(git rev-parse --show-toplevel)
      }
    '';
  };
}
