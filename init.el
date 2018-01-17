;; init.el --- Emacs configuration

;; BASIC CUSTOMIZATION
;; --------------------------------------

;; put emacs in fullscreen
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; hide the startup message
(setq inhibit-startup-message t)

;; disable the menu-bar, tool-bar and scroll-bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; highlight matching pairs of parentheses and other characters
(show-paren-mode 1)
;; enable line numbers globally
(global-linum-mode 1)
;; insert matching delimiters
(electric-pair-mode 1)
;; line highlighting
(global-hl-line-mode 1)
;; word wrap is ugly
(global-visual-line-mode 1)

;; cursor type
(setq-default cursor-type '(bar . 2))
;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
;; remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; EXPERIMENTAL
;; -----------------------------------

;; auto revert if file changed externally
;; (global-auto-revert-mode 1)
(add-to-list 'load-path "~/.emacs.d/libs/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'solarized-dark t)

;; init.el ends here
