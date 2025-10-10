{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.home-manager.enable = true;
  programs.zoxide.enable = true;

  imports = [
    ./home-manager-programs/neovim.nix
    ./home-manager-programs/zsh.nix
    ./home-manager-programs/tmux.nix
    ./home-manager-programs/git.nix
    ./home-manager-programs/alacritty.nix
    ./home-manager-programs/brave.nix
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
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

}
