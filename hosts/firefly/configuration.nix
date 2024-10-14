{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../common/configuration.nix
    ./nixos-modules/firefly
    # ./nixos-modules/postgres
  ];
  
  #Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "firefly"; # Define your hostname.

  networking.firewall.allowedTCPPorts = [ 80 443 ]; # allow http and https for firefly
 
  services.openssh.settings = {
    PasswordAuthentication = false;
    PermitRootLogin = "no";
  };

  # add specific system packages here
  environment.systemPackages = with pkgs; [
    php83
  ];

  system.stateVersion = "23.05"; # Did you read the comment?
}
