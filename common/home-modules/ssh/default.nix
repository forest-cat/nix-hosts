{ config, pkgs, ... }:

{
  programs.ssh = {
    programs.ssh.enableDefaultConfig = false;
    extraConfig = "
          Host github
            HostName github.com
            User git
            IdentityFile ~/.ssh/github_readonly_deploykey";
    enable = true;

  };

}

