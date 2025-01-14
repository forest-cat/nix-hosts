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
    signal.relayHosts = [ "localhost" ];
 };
}