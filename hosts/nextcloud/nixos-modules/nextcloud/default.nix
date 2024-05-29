{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  services.nextcloud = {
    enable = true;
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
    caching.redis = true;
    # specify only if you want redis caching
    extraOptions = {
      redis = {
        host = "127.0.0.1";
        port = 31638;
        dbindex = 0;
        timeout = 1.5;
      };
    };
  };
  redis.servers.nextcloud = {
      enable = true;
      port = 31638;
      bind = "127.0.0.1";
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}