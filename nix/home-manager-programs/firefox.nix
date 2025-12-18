{ config, pkgs, ... }:
{

  # Only on darwin
  programs.firefox = pkgs.lib.mkIf pkgs.stdenv.isDarwin {
    enable = true;
  };
}
