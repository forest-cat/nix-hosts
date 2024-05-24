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
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "examplehost"; # Define your hostname.

  # add specific system packages here
  environment.systemPackages = with pkgs; [
  ];

  system.stateVersion = "23.05"; # Did you read the comment?
}
