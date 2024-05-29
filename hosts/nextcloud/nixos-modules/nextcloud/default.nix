{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud29;
    hostName = "cloud.forestcat.org";
    autoUpdateApps.enable = true;
    database.createLocally = true;
    config = {
      dbtype = "pgsql";
      dbname = "nextcloud";
      dbuser = "nextcloud";
      adminuser = "admin";
      adminpassFile = "/home/nextcloud/db_passfile";
      extraTrustedDomains = [ "nextcloud.fritz.box" ];
    };
    configureRedis = true;
  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}