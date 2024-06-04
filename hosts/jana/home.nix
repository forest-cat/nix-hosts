{ config, pkgs, ... }:

{
  imports = [
    ../../common/home.nix
  ];
  
  home.stateVersion = "23.11";
  services.dunst.waylandDisplay = "DP-2";

  home.file = {
    # hyprland files
    ".config/hypr/hyprland.conf".source = ./home-modules/hyprland/hyprland.conf;
    ".config/hypr/start.sh".source = ./home-modules/hyprland/hyprland-start.sh;

    # MangoHud Config
    ".config/MangoHud/MangoHud.conf".source = ./home-modules/mangohud/MangoHud.conf;

    # Waybar files
    ".config/waybar/leftbar/config".source = ./home-modules/waybar/leftbar/config;
    ".config/waybar/leftbar/style.css".source = ./home-modules/waybar/leftbar/style.css;

    ".config/waybar/centerbar/config".source = ./home-modules/waybar/centerbar/config;
    ".config/waybar/centerbar/style.css".source = ./home-modules/waybar/centerbar/style.css;

    ".config/waybar/rightbar/config".source = ./home-modules/waybar/rightbar/config;
    ".config/waybar/rightbar/style.css".source = ./home-modules/waybar/rightbar/style.css;

  };
}
