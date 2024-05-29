{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    hostName = "nextcloud.forestcat.org";
    autoUpdateApps.enable = true;
    database.createLocally = true;
    config = {
      dbtype = "pgsql";
      dbname = "nextcloud";
      dbuser = "nextcloud";
      adminuser = "admin";
      adminpassFile = "/home/nextcloud/db_passfile";
    };
    configureRedis = true;
  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}