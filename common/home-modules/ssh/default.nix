{ config, pkgs, ... }:

{
  programs.ssh = {
    extraConfig = "
          Host mxserver
            HostName iciclefurry.de
            User minecraft
            Port 106  
            IdentityFile ~/.ssh/ssh_key
          Host mc-create
            HostName mc-create.fritz.box
            User xuser
            Port 22
            IdentityFile ~/.ssh/ssh_key
          Host jxserver
            HostName iciclefurry.de
            User josua
            Port 106
            IdentityFile ~/.ssh/ssh_key
          Host fnuc
            HostName nuc.fritz.box
            User forestcat
            Port 22
          Host github
            HostName github.com
            User git
            IdentityFile ~/.ssh/git_key";
    enable = true;

  };

}

