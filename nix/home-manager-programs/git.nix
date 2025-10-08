{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Max Strübing";
    userEmail = "mxstrbng@gmail.com";
    signing = {
      key = "87EE19B0";
      signByDefault = true;
    };
    extraConfig = {
      core.excludesFile = "~/.gitignore";
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
    aliases = {
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
  };
}
