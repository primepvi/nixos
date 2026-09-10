{ config, pkgs, ... }:

{	
  home.username = "pedro";
  home.homeDirectory = "/home/pedro";
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
     discord
     git
     gh
     vscodium
  ];

  programs.git = {
     enable = true;

     settings = {
	     user = {
	       name = "primepvi";
	       email = "pedrobernardesv@gmail.com";
       };

       init.defaultBranch = "main";	
     };
  };
  
  programs.emacs = {
    enable = true;

    extraPackages = epkgs: with epkgs; [
    	magit
	    which-key
	    vertico
	    orderless
	    marginalia
	    corfu
	    
	    lsp-mode
	    nix-mode
	    zig-mode
    ];
  };
}
