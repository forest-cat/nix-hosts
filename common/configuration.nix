{
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {

  imports = [
    ./nixos-modules/localization
  ];


  users.users.nixuser = {
    isNormalUser = true;
    description = "nixuser";
    # extraGroups = [ "wheel" "audio" "video" "input" "networkmanager" "adbusers" ];
    shell = pkgs.zsh;
  };


  # Enable ntfs support at boot
  boot.supportedFilesystems = [ "ntfs" ];

  # Enable networking
  networking.networkmanager = {
    enable = true;
    # unmanaged = ["type:wireguard"];
    };

  # Enable polkit to allow users to use sudo authentication
  security.polkit.enable = true;

  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # fonts.packages = with pkgs; [
  #   font-awesome
  #   font-awesome_5
  #   nerdfonts
  #   nerdfix
  #   material-symbols
  #   terminus-nerdfont
  #   inconsolata-nerdfont
  #   fira-code-nerdfont
  # ];

  environment.systemPackages = 
  (with pkgs; [
    # System Packages go here
    alejandra
    btop
    python3
    htop
    tree
    lf
    wget
    helix
    unzip
    tldr
    git
    speedtest-cli
    hyfetch
    nfs-utils # utils for nfs shares
    cifs-utils # support for samba shares
    traceroute
    nil # language server for nix
    python311Packages.pip
    wireguard-tools
    zoxide
  ])

  ++

  (with pkgs-unstable; [
    # unstable system packages here
  ]);



  programs.gnupg.agent = {
    enable = true;
    # enableSSHSupport = true;
  };
  # use external ssh agent instead of gnupg ssh agent
  programs.ssh.startAgent = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.openssh.enable = true;

  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };

  # Automatic Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
