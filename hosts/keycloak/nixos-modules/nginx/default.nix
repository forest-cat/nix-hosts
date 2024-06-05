{ ... }:
{
  services.nginx = {
    enable = true;
    virtualHosts = {
      "id.forestcat.org" = {
        forceSSL = true;
        enableACME = true;
        locations = {
          # Redirect a user opening any not set location on id.forestcat.org to the account management page.
          "^~ /" = {
            return = "307 https://id.forestcat.org/realms/nekoverse/account/";
          };
          "/js/" = {
            proxyPass = "http://127.0.0.1:8080/js/";
          };
          "/realms/" = {
            proxyPass = "http://127.0.0.1:8080/realms/";
          };
          "/resources/" = {
            proxyPass = "http://127.0.0.1:8080/resources/";
          };
          "/robots.txt" = {
            proxyPass = "http://127.0.0.1:8080/robots.txt";
          };
        };
        extraConfig = ''
          listen 0.0.0.0:8443 http2 ssl proxy_protocol;

          set_real_ip_from 10.202.41.100;
          real_ip_header proxy_protocol;

          add_header Strict-Transport-Security "max-age=63072000" always;

          # To not have 502s sometimes when logging through PVE use bigger buffer_sizes.
          # The error seemed to occur after logging in and out and in. Maybe related
          # to Keycloak logout settings, but probably not.
          # See:
          # https://stackoverflow.com/questions/56126864/why-do-i-get-502-when-trying-to-authenticate
          # https://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_buffer_size
          proxy_buffer_size 128k;
          proxy_buffers 8 128k;

          # Hide the X-Forwarded header.
          proxy_hide_header X-Forwarded;
          # Assume we are the only Reverse Proxy (well using Proxy Protocol, but that
          # is transparent).
          # Also provide "_hidden" for by, since it's not relevant.
          proxy_set_header Forwarded "for=$remote_addr;proto=https;host=$host;by=_hidden";
        '';
      };
      "id-admin.forestcat.org" = {
        forceSSL = true;
        enableACME = true;
        listen = [
          {
            addr = "0.0.0.0";
            port = 80;
          }
          {
            addr = "0.0.0.0";
            port = 443;
            ssl = true;
          }
        ];
        locations = {
          # Redirect a user opening any not set location on id.forestcat.org to the account management page.
          "^~ /" = {
            return = "307 https://id-admin.forestcat.org/admin/master/console/";
          };
          "/js/" = {
            proxyPass = "http://127.0.0.1:8080/js/";
          };
          "/realms/" = {
            proxyPass = "http://127.0.0.1:8080/realms/";
          };
          "/resources/" = {
            proxyPass = "http://127.0.0.1:8080/resources/";
          };
          "/robots.txt" = {
            proxyPass = "http://127.0.0.1:8080/robots.txt";
          };
          "/admin/" = {
            proxyPass = "http://127.0.0.1:8080/admin/";
          };
        };
        extraConfig = ''
          add_header Strict-Transport-Security "max-age=63072000" always;

          # To not have 502s sometimes when logging through PVE use bigger buffer_sizes.
          # The error seemed to occur after logging in and out and in. Maybe related
          # to Keycloak logout settings, but probably not.
          # See:
          # https://stackoverflow.com/questions/56126864/why-do-i-get-502-when-trying-to-authenticate
          # https://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_buffer_size
          proxy_buffer_size 128k;
          proxy_buffers 8 128k;

          # Hide the X-Forwarded header.
          proxy_hide_header X-Forwarded;
          # Assume we are the only Reverse Proxy (well using Proxy Protocol, but that
          # is transparent).
          # Also provide "_hidden" for by, since it's not relevant.
          proxy_set_header Forwarded "for=$remote_addr;proto=https;host=$host;by=_hidden";
        '';
      };
    };
  };
}
