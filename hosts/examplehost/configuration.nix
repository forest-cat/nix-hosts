{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../common/configuration.nix
  ];
  
  #Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "examplehost"; # Define your hostname.
 
  services.openssh.extraConfig = "
    PasswordAuthentication no;
    PermitRootLogin no;
    PubkeyAuthentification yes";

  # add specific system packages here
  environment.systemPackages = with pkgs; [
  ];

  system.stateVersion = "23.05"; # Did you read the comment?
}
