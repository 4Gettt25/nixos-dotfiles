{ pkgs, ... }:
{
  imports = [
    ./browser.nix
    ./desktopEntries.nix
    ./hyprland.nix
    ./neofetch.nix
    ./nerdfonts.nix
    ./packages.nix
    ./sh.nix
    ./starship.nix
    ./theme.nix
  ];

  home.packages = [
    (import ./colorscript.nix { inherit pkgs; })
  ];

  targets.genericLinux.enable = true;

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  home = {
    sessionVariables = {
      QT_XCB_GL_INTEGRATION = "none"; # kde-connect
      EDITOR = "nvim";
      VISUAL = "code";
      TERMINAL = "nixGL wezterm";
      XCURSOR_THEME = "Qogir";
      NIXPKGS_ALLOW_UNFREE = "1";
      SHELL = "${pkgs.zsh}/bin/zsh";
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];

    stateVersion = "21.11";
  };

  gtk.gtk3.bookmarks = [
    "file:///home/felixg/Documents"
    "file:///home/felixg/Music"
    "file:///home/felixg/Pictures"
    "file:///home/felixg/Videos"
    "file:///home/felixg/Downloads"
    "file:///home/felixg/Projects Projects"
    "file:///home/felixg/School School"
  ];

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };

  programs = { home-manager.enable = true; };
}
