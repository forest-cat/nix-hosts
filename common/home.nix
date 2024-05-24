{ config, pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./home-modules/zsh
    ./home-modules/ssh
    # ./home-modules/git
  ];

  home.username = "nixuser";
  home.homeDirectory = "/home/nixuser";

  home.file = {


    # Hyfetch config
    ".config/hyfetch.json".source = ./home-modules/hyfetch/hyfetch.json;

    # git config
    ".gitconfig".source = ./home-modules/git/gitconfig;

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    #".config/hypr/hyprland.conf".source = ./home-modules/hyprland/hyprland.conf;
  };

  home.sessionVariables = {
    EDITOR = "hx";
  };
   
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


  home.packages = 
  (with pkgs; [
    # stable home packages here
  ])
  
  ++

  (with pkgs-unstable; [
    # unstable home packages here
  ]);



}
