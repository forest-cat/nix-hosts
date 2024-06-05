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
      hostname-admin = "id-admin.forestcat.org";
      hostname-strict-backchannel = false;
      proxy = "edge";
      http-enabled = true;
    };
    initialAdminPassword = "changeme";  # change on first login
    # sslCertificate = "/home/nixuser/keys/fc_org_certificate.pem";
    # sslCertificateKey = "/home/nixuser/keys/fc_org_key.pem";
    database.createLocally = true;
    database.username = "keycloak";
    database.passwordFile = "/home/nixuser/keys/keycloak-keyfile";
  };

}
