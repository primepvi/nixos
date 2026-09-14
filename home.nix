{ config, pkgs, ... }:

{
  home.username = "pedro";
  home.homeDirectory = "/home/pedro";
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
    zig
    discord
    git
    gh
    vscodium
    nixd
    nixpkgs-fmt
  ];

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

    extraPackages = epkgs: with epkgs; [
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

      kanagawa-themes
    ];
  };

  home.file.".emacs".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/emacs/init.el";
  home.file.".emacs.d".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/emacs";
}
