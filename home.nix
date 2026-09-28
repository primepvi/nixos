{ config, pkgs, ... }:

{
  home.username = "pedro";
  home.homeDirectory = "/home/pedro";
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
    gcc
    clang-tools
    zig
    vesktop
    git
    gh
    vscodium
    nixd
    nixpkgs-fmt
    quickshell
    nodejs

    typescript
    typescript-language-server

    swaybg
    rofi

    quickshell
    qt6.qtdeclarative
    qt6.qtsvg
    qt6.qtimageformats
    qt6.qtmultimedia
    qt6.qt5compat
  ];

  home.sessionVariables = {
    QML_IMPORT_PATH = pkgs.lib.makeSearchPath "lib/qt-6/qml" [
      pkgs.quickshell
      pkgs.qt6.qtdeclarative
      pkgs.qt6.qtsvg
      pkgs.qt6.qtimageformats
      pkgs.qt6.qtmultimedia
      pkgs.qt6.qt5compat
    ];
  };

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "primepvi";
        email = "pedrobernardesv@gmail.com";
      };

      init.defaultBranch = "main";
      credential.helper = "!gh auth git-credential";
    };
  };

  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs;
      [
        use-package
        magit
        which-key
        vertico
        orderless
        marginalia
        corfu
        kind-icon
        all-the-icons
        all-the-icons-completion

        lsp-mode
        nix-mode
        nixpkgs-fmt
        zig-mode
        qml-mode

        kanagawa-themes
        catppuccin-theme
      ];
  };

  home.file.".emacs".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/emacs/init.el";
  home.file.".emacs.d".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/emacs";
  home.file.".config/niri".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/niri";
  home.file.".config/quickshell".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/quickshell";
}
