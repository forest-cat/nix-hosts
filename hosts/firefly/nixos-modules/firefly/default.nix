{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  services.firefly-iii = {
    enable = true;
    enableNginx = true;
    virtualHost = "firefly";
    package = pkgs.firefly-iii;
    settings = {
      APP_DEBUG = false;
      APP_ENV = "production";
      APP_URL = "https://firefly.forestcat.org";
      SITE_OWNER = "firefly@forestcat.org";
      APP_KEY_FILE = "/var/secrets/firefly-iii-app-key.txt";
      DB_CONNECTION = "sqlite";
      TRUSTED_PROXIES="**";
      MAIL_MAILER="smtp";
      MAIL_HOST="smtp.migadu.com";
      MAIL_PORT=465;
      MAIL_FROM="firefly@forestcat.org";
      MAIL_USERNAME="firefly@forestcat.org";
      MAIL_PASSWORD_FILE="/var/secrets/firefly-iii-smtp-password.txt";
      MAIL_ENCRYPTION="tls";

    };
  };
}