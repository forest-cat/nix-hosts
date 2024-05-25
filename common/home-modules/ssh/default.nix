{ config, pkgs, ... }:

{
  programs.ssh = {
    extraConfig = "
          Host github
            HostName github.com
            User git
            IdentityFile ~/.ssh/id";
    enable = true;

  };

}

