{ pkgs, inputs, ... }:
{
  imports = [
    ../modules/yabai.nix
    ../modules/skhd.nix
    inputs.home-manager.darwinModules.home-manager
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";

  nix = {
    package = pkgs.nix;
    settings = {
      "extra-experimental-features" = [
        "nix-command"
        "flakes"
      ];
    };
    optimise = {
      automatic = true;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };

  system.primaryUser = "maex";
  system.stateVersion = 6;

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  system.defaults = {
    controlcenter = {
      BatteryShowPercentage = true;
      Bluetooth = true;
      FocusModes = true;
      NowPlaying = false;
    };

    dock = {
      autohide = true;
      mru-spaces = false;
    };
    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      FXEnableExtensionChangeWarning = false;
      CreateDesktop = false;
      ShowPathbar = true;
      ShowStatusBar = true;
      _FXShowPosixPathInTitle = true;
    };
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
  };

  # vscode
  nixpkgs.config.allowUnfree = true;

  programs = {
    zsh = {
      # Create /etc/zshrc that loads the nix-darwin environment.
      # Very important. Only once this is activated do you get a shell with everything set up.
      enable = true;
    };

    fish = {
      # Hook fish into global config as well, else might run into problems like
      # https://wiki.nixos.org/wiki/Fish#Running_fish_interactively_with_zsh_as_system_shell_on_darwin
      # and
      # https://discourse.nixos.org/t/using-fish-interactively-with-zsh-as-the-default-shell-on-macos/48402
      enable = true;
    };

    bash = {
      # Some tools might have `/bin/bash` hard-coded, so help get Nix into those.
      enable = true;
    };
  };

  environment.systemPackages = [
    pkgs.brave
    pkgs.vscode
    pkgs.alacritty
    pkgs.pinentry_mac
  ]
  ++ (import ../modules/common-packages.nix { inherit pkgs; });

  fonts = {
    packages = [
      pkgs.nerd-fonts.symbols-only
      pkgs.nerd-fonts.space-mono
    ];
  };

  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap";
    };

    taps = [
      "homebrew/cask"
    ];

    casks = [
      "portfolioperformance"
      "zoom"
      "spotify"
      "slack"
      "bitwarden"
    ];
  };

  home-manager.users.maex = import ../home-manager.nix;

  users.users.maex = {
    home = "/Users/maex";
    shell = pkgs.zsh;
  };
}
