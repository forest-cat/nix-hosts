{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  services.keycloak = {
    package = pkgs-unstable.keycloak;
    enable = true;
    settings = {
      hostname = "id.forestcat.org";
      hostname-strict-backchannel = true;
    };
    initialAdminPassword = "e6Wcm0RrtegMEHl";  # change on first login
    sslCertificate = "/run/keys/ssl_cert";
    sslCertificateKey = "/run/keys/ssl_key";
    database.passwordFile = "/run/keys/db_password";
  };

}