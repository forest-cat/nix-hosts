{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableAutosuggestions = true;
    

    dotDir = ".config/zsh";

    history = {
      extended = true;
      share = false; # Do not share history between shells.
    };

    localVariables = {
      # Enable Oh My Zsh history timestamp output.
      # See: https://github.com/ohmyzsh/ohmyzsh/wiki/Settings#hist_stamps
      HIST_STAMPS = "yyyy-mm-dd";
    };

    # Make use of Oh My Zsh
    # See the projects sites:
    # https://ohmyz.sh/
    # https://github.com/ohmyzsh/ohmyzsh/
    # See the projects documentation:
    # https://github.com/ohmyzsh/ohmyzsh/wiki
    oh-my-zsh = {
      enable = true;
      theme = "clean";
      custom = "/home/nixuser/.config/oh-my-zsh-custom";
      plugins = [
        "history-substring-search"
        "timer"
        "pass"
      ];
      extraConfig = ''
        # Only show the command execution timer, if the command ran for at least 15 seconds.
        TIMER_THRESHOLD=15
      '';
    };

    initExtra = ''
      nx() {
        nix shell nixpkgs/nixos-23.11#$@
      }

      # history-substring-search configuration
      # See: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/history-substring-search#configuration
      # Ensure unique search results in history-substring-search.
      # Needs to be set here instead of in oh-my-zsh.extraConfig to work apparently.
      HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
      eval "$(zoxide init zsh)"
    '';

    shellAliases = {
      # Others.
      miau = "echo miau";
      ll = "ls -l";
      cheetah = 'curl -d "$(hostname): Done ✓" https://ntfy.forestcat.org/cheetah';
      rebuild = "sudo nixos-rebuild switch --flake ~/nix-configs/ --show-trace";
      clean-gen = "sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system";
      clean-gc = "sudo nix-collect-garbage -d";
      list-gen = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      gd="git diff";
      gds="git diff --staged";
      gic="git commit";
      gis="git status";
      ga="git add *";
      gps="git push";
      gpl="git pull";
      ac = "sudo tlp ac";
      auto = "sudo tlp auto";
      bat = "sudo tlp bat";
      neofetch = "neowofetch";
      powermode="cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor";
      ssh="TERM=xterm-256color ssh";
    };
  };
}

