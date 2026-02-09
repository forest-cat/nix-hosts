{ config, pkgs, ... }:

{
  programs.ssh = {
    enableDefaultConfig = false;
    matchBlocks."*" = {
      forwardAgent = false;
      addKeysToAgent = "no";
      compression = false;
      serverAliveInterval = 0;
      serverAliveCountMax = 3;
      hashKnownHosts = false;
      userKnownHostsFile = "~/.ssh/known_hosts";
      controlMaster = "no";
      controlPath = "~/.ssh/master-%r@%n:%p";
      controlPersist = "no";
    };
    extraConfig = "
          Host github
            HostName github.com
            User git
            IdentityFile ~/.ssh/github_readonly_deploykey";
    enable = true;

  };

}

