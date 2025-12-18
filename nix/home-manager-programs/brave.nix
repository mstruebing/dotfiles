{ config, pkgs, ... }:
{

  # Only on darwin
  programs.brave = pkgs.lib.mkIf pkgs.stdenv.isDarwin {
    enable = true;
    extensions = [
      { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # vimium
      { id = "fbpcaneckpeeinnachahnnpapdiaohei"; } # profile-peek
      { id = "mlomiejdfkolichcflejclcbmpeaniij"; } # ghostery
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden
      { id = "beakmhbijpdhipnjhnclmhgjlddhidpe"; } # linkding
    ];
  };
}
