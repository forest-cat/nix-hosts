{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../common/configuration.nix
  ];

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    # efiInstallAsRemovable = true;
    enableCryptodisk = true;
    extraEntries = ''
      menuentry "Windows" {
        insmod part_gpt
        insmod fat
        insmod search_fs_uuid
        insmod chain
        search --fs-uuid --set=root C295-6CCB
        chainloader /EFI/Microsoft/Boot/bootmgfw.efi
      }
    '';
  };
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable steam
  programs.steam.enable = true;
  programs.gamemode.enable = true;
  programs.steam.gamescopeSession.enable = true; # use the gamescope compositor, which enables features such as resolution upscaling and stretched aspect ratios
  hardware = {
    opengl = {
      # both options for gaming with nixos
      driSupport = true;
      driSupport32Bit = true;
    };
    xone.enable = true; # Enable xbox controller support
  };
  services.xserver.videoDrivers = [ "amdgpu" ];

  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-9b2691fc-dd68-4ca1-918e-2bbb4880551c".device = "/dev/disk/by-uuid/9b2691fc-dd68-4ca1-918e-2bbb4880551c";
  networking.hostName = "jana"; # Define your hostname.

  # add specific system packages here
  environment.systemPackages = with pkgs; [
    os-prober
    steam
    lutris
    wine
    mangohud
  ];

  system.stateVersion = "23.11"; # Did you read the comment?
}
