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
(load-theme 'sol)
