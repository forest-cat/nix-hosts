{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
 services.rustdesk-server = {
    enable = true;
    openFirewall = true;
    relayIP = "localhost";
 };
}