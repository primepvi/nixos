;;; -*- lexical-binding: t; -*-

(setq inhibit-startup-message t)
(setq custom-safe-themes t)
(setq make-backup-files nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq window-divider-default-right-width 2)
(setq window-divider-default-bottom-width 2)
(window-divider-mode 1)

(set-language-environment "UTF-8")

(set-face-attribute 'default nil
                    :family "JetBrainsMono Nerd Font"
                    :height 110)

(add-to-list 'custom-theme-load-path ".emacs.d/themes")
(add-to-list 'load-path ".emacs.d/modes")
(load-theme 'kanagawa-dragon)
(require 'bee-mode)

(global-display-line-numbers-mode 1)

(require 'use-package)
(use-package marginalia
  :custom
  (marginalia-align 'right)
  :init
  (marginalia-mode))
  
(use-package all-the-icons)
(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))

(use-package vertico
  :custom
  (vertico-count 12)
  (vertico-resize t)
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless))
  (completion-category-defaults nil)
  (completion-category-overrides
   '((file (styles orderless)))))

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-auto-prefix 2)
  (corfu-cycle t)
  (corfu-preselect 'first)
  (corfu-preview-current nil)
  :bind
  (:map corfu-map
	("RET" . corfu-insert))
  :init
  (global-corfu-mode))

(use-package kind-icon
  :after corfu
  :custom
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
               '(nix-mode . ("nixd")))
  
  (add-to-list 'eglot-server-programs
	       '(qml-mode . ("qmlls" "-E")))
  
  (add-to-list 'eglot-server-programs
               '((typescript-mode typescript-ts-mode tsx-ts-mode)
                 . ("typescript-language-server" "--stdio")))

  :hook ((zig-mode . eglot-ensure)
         (nix-mode . eglot-ensure)
         (c-mode . eglot-ensure)
         (c++-mode . eglot-ensure)
         (typescript-ts-mode . eglot-ensure)
         (tsx-ts-mode . eglot-ensure)
	 (qml-mode . eglot-ensure)))

(use-package typescript-ts-mode
  :hook
  (typescript-ts-mode . (lambda ()
                          (setq-local indent-tabs-mode nil)
                          (setq-local tab-width 2)
                          (setq-local typescript-ts-mode-indent-offset 2))))

(use-package nixpkgs-fmt
  :hook (nix-mode . nixpkgs-fmt-on-save-mode))
