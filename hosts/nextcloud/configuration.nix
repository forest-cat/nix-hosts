{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../common/configuration.nix
    ./nixos-modules/nextcloud
  ];
  
  #Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nextcloud"; # Define your hostname.
 
  services.openssh.settings = {
    PasswordAuthentication = false;
    PermitRootLogin = "no";
  };

  # add specific system packages here
  environment.systemPackages = with pkgs; [
    # php83Extensions.smbclient # smbclient for external storage application in nextcloud
    # php82Extensions.smbclient # smbclient for external storage application in nextcloud
    # php81Extensions.smbclient # smbclient for external storage application in nextcloud
    # samba4Full
  ];

  system.stateVersion = "23.05"; # Did you read the comment?
}
