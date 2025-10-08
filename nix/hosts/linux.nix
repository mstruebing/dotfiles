{ pkgs, ... }:
{
  imports = [
    ../modules/shared.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  system.primaryUser = "maex";
  system.stateVersion = 1;

  home-manager.users.maex = import ../home-manager.nix;

  users.users.maex = {
    isNormalUser = true;
    home = "/home/maex";
    shell = pkgs.zsh;
  };
  # Add more linux-specific configuration here
}
