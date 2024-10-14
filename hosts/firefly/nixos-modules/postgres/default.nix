{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql;
    ensureDatabases = [
      "firefly"
    ];
    ensureUsers = [
      {
        name = "firefly";
        ensureDBOwnership = true;
      }
    ];
    settings = {
      port = 5432;
    };
  };
}