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
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGMqbXz+ZsvhwDrCzypYYZmHxzjFn2KP2KzvtnZuY51e forestcat"
    ];
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
    screen
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
  shellAliases = {
	miau = "echo miau";
	ll = "ls -l";
	cheetah = "curl -d \"$(hostname): Done ✓\" https://ntfy.forestcat.org/cheetah";
	rebuild = "sudo nixos-rebuild switch --flake ~/nix-configs/ --show-trace";
	home-rebuild = "home-manager switch --flake ~/nix-configs#$(hostname)";
	clean-gen = "sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system";
	clean-gc = "sudo nix-collect-garbage -d";
	list-gen = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
	gd="git diff";
	gds="git diff --staged";
	gic="git commit";
	gis="git status";
	ga="git add *";
	gps="git push";
	gpl="git pull";
	gl="git log";
	ac = "sudo tlp ac";
	auto = "sudo tlp auto";
	bat = "sudo tlp bat";
	neofetch = "neowofetch";
	powermode="cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor";
	bluetuith="bluetuith --receive-dir /home/tessa/Downloads";
	ssh="TERM=xterm-256color ssh";
	getnewgtalobby="pkill -STOP GTA5 && sleep 8 && pkill -CONT GTA5";
	pacman= "sudo pacman";
};



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
    nssmdns4 = true;
    openFirewall = true;
  };

  # Automatic Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
