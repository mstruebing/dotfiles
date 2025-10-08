{ pkgs, ... }:
{
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;

    config = {
      mouse_follows_focus = "off";
      window_placement = "second_child";
      window_topmost = "on";
      # Add more yabai config options here
    };
  };
}
