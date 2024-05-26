{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../common/configuration.nix
    ./nixos-modules/keycloak
  ];
  
  #Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "keycloak"; # Define your hostname.

  networking.firewall.allowedTCPPorts = [ 80 443 ]; # allow http and https for keycloak

  services.openssh.extraConfig = "
    PasswordAuthentication = no;
    PermitRootLogin = no;
    PubkeyAuthentification = yes";

  # add specific system packages here
  environment.systemPackages = with pkgs; [
  ];

  system.stateVersion = "23.05"; # Did you read the comment?
}
