{ config, pkgs, ... }:

{
  programs.ssh = {
    extraConfig = "
          Host github
            HostName github.com
            User git
            IdentityFile ~/.ssh/github_readonly_deploykey";
    enable = true;

  };

}

