{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userName = "Forestcat";
        userEmail = "forest_cat@dismail.de";
        signing = {
            signByDefault = true;
            key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAQfrndMYrgxY6shAy+L1q/rvcLs3/VRAsUqp594OXrr forest_cat@dismail.de";
        };
        extraConfig = {
            gpg = {
                format = "ssh";
            };
        };
    };
}