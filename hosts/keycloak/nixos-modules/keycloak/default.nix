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
      hostname-strict-backchannel = false;
      proxy = "edge";
    };
    initialAdminPassword = "changeme";  # change on first login
    # sslCertificate = "/home/nixuser/keys/forestcat.org_ssl_certificate.cer";
    # sslCertificateKey = "/home/nixuser/keys/forestcat.org_private_key.key";
    database.createLocally = true;
    database.username = "keycloak";
    database.passwordFile = "/home/nixuser/keys/keycloak-keyfile";
  };

}