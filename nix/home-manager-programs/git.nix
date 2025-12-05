{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    signing = {
      signByDefault = true;
      key = builtins.getEnv "SIGNING_KEY";
    };
    ignores = [
      "*.swp"
      "*.swo"
      ".DS_Store"
      "._*"
      "Thumbs.db"
      "desktop.ini"
      "npm-debug.log*"
      "yarn-debug.log*"
      "yarn-error.log*"
      ".env"
      ".env.local"
      ".env.*.local"
      ".vscode/"
      ".idea/"
      "dist/"
      "build/"
      "node_modules/"
      ".cache/"
      ".next/"
      ".nuxt/"
      "node_modules"
      ".nvimrc"
      ".nvim.lua"
      "NOTES.md"
    ];

    settings = {
      user = {
        name = "Max Strübing";
        email = "mxstrbng@gmail.com";
      };

      alias = {
        p = "push";
        pm = "push origin master";
        a = "add";
        c = "commit";
        d = "diff";
        co = "checkout";
        b = "branch";
        lg = "log --oneline --decorate";
        s = "status --branch --short";
        branches = "branch -a";
        remotes = "remote -v";
        undo = "reset --soft HEAD^";
      };

      extraConfig = {
        commit.verbose = true;
        rebase.autoStash = true;
        pull.rebase = true;
        init.defaultBranch = "main";
        gpg.program = "gpg2";
        # url."git@github.com:".insteadOf = "https://github.com/";
        diff.renameLimit = 16384;
        diff.algorithm = "histogram";
        diff.colorMoved = "plain";
        diff.mnemonicPrefix = true;
        diff.renames = true;
        column.ui = "auto";
        branch.sort = "-committerdate";
        tag.sort = "version:refname";
        push.default = "simple";
        push.autoSetupRemote = true;
        push.followTags = true;
        fetch.prune = true;
        fetch.pruneTags = true;
        fetch.all = true;
      };
    };
  };
}
