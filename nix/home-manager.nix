{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.home-manager.enable = true;
  programs.zoxide.enable = true;

  home.stateVersion = "24.05";

  imports = [
    ./home-manager-programs/neovim.nix
    ./home-manager-programs/zsh.nix
    ./home-manager-programs/tmux.nix
    ./home-manager-programs/git.nix
    ./home-manager-programs/alacritty.nix
    ./home-manager-programs/brave.nix
    ./home-manager-programs/firefox.nix
    ./home-manager-programs/obisidian.nix
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep 5";
    };
  };

  systemd.user.services.nh-clean = {
    Service = {
      Environment = "PATH=/nix/var/nix/profiles/default/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # programs.fzf.enable = true;

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 34560000;
    maxCacheTtl = 34560000;
    enableScDaemon = false;

    pinentry = {
      package = if pkgs.stdenv.isLinux then pkgs.pinentry-curses else pkgs.pinentry_mac;
      program = if pkgs.stdenv.isLinux then "pinentry-curses" else "pinentry-mac";
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      # All hosts
      "*" = {
        addKeysToAgent = "12h";
        compression = true;
      };
    };

    includes = [
      # non-Nix managed configs
      "conf"
    ];
  };

  xdg.configFile = {
    "tmuxinator" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/projects/own/dotfiles/nix/modules/tmuxinator";
      recursive = true;
    };
  };

  home.file = {
    "bin" = {
      source = ./bin;
      recursive = true;
    };
  };

}
