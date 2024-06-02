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
    hostName = "cloud.forestcat.org";
    autoUpdateApps.enable = true;
    database.createLocally = true;
    https = true;
    config = {
      dbtype = "pgsql";
      dbname = "nextcloud";
      dbuser = "nextcloud";
      adminuser = "admin";
      adminpassFile = "/home/nextcloud/db_passfile";
      defaultPhoneRegion = "DE";
      # extraTrustedDomains = [ "nextcloud.fritz.box" ];
    };
    phpOptions = {
      "opcache.interned_strings_buffer" = "16";
    };
    configureRedis = true;
    extraAppsEnable = true;
    extraApps = with config.services.nextcloud.package.packages.apps; {
      inherit contacts calendar notes user_oidc;
    };
    # turn to nextlcoud.settings after version 24.05
    services.nextcloud.extraOptions = {
      'hide_login_form' = true;
    };


  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}