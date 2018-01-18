;; init.el --- Emacs configuration

;; BASIC CUSTOMIZATION
;; --------------------------------------

;; Put emacs in fullscreen
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; Hide the startup message
(setq inhibit-startup-message t)

;; Disable the menu-bar, tool-bar and scroll-bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Highlight matching pairs of parentheses and other characters
(show-paren-mode 1)
;; Enable line numbers globally
(global-linum-mode 1)
;; Insert matching delimiters
(electric-pair-mode 1)
;; Line highlighting
(global-hl-line-mode 1)
;; Word wrap is ugly
(global-visual-line-mode 1)

;; Cursor type
(setq-default cursor-type '(bar . 2))
;; Don't blink the cursor
(blink-cursor-mode -1)
;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
;; Remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Start emacs with text-mode
(setq initial-major-mode 'org-mode)

;; Empty *scratch* buffer
(setq initial-scratch-message nil)

;; Auto fill in text mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; M-q should fill at 80 chars
(setq-default fill-column 80)

;; use custom font
(set-frame-font "Source Code Pro-12")

;; ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Delete selected region on inserting text
(delete-selection-mode 1)

;; Automatically reload files when they change on disk
(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)

;; Move custom configuration variables set by Emacs, to a seperate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Use y/n instead of full yes/no for confirmation messages
(fset 'yes-or-no-p 'y-or-n-p)

;; Show full file path in the title bar
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Disable audio bell
(setq ring-bell-function 'ignore)

;; Scroll one line at a time
(setq scroll-conservatively 10)

;; EXPERIMENTAL
;; -----------------------------------

;; remove once installed through package manager
(add-to-list 'load-path "~/.emacs.d/libs/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'solarized-dark t)

(require 'org-bullets)
(add-hook 'org-mode-hook 'org-bullets-mode)
(setq org-bullets-bullet-list '("➔"))
;;(setq org-ellipsis "⤵")
(setq org-ellipsis " •••")
;; syntax highlighting in source blocks
(setq org-src-fontify-natively t)
;; TAB acts wrt language’s major mode
(setq org-src-tab-acts-natively t)
;;(setq
;; org-bullets-bullet-list
;; '("☯" "☢" "➔" "☀" "♻" "✈" "⚡" "➫" "✪" "✿" "❀" "♥" "●" "◆" "♠" "♣" "♦" "◇" "✚" "✜" "▶"))
(add-hook 'org-mode-hook (lambda () (linum-mode -1)))

;;(global-unset-key (kbd "<left>"))
;;(galobal-unset-key (kbd "<right>"))
;;(global-unset-key (kbd "<up>"))
;;(global-unset-key (kbd "<down>"))
;;(global-unset-key (kbd "<C-left>"))
;;(global-unset-key (kbd "<C-right>"))
;;(global-unset-key (kbd "<C-up>"))
;;(global-unset-key (kbd "<C-down>"))
;;(global-unset-key (kbd "<M-left>"))
;;(global-unset-key (kbd "<M-right>"))
;;(global-unset-key (kbd "<M-up>"))
;;(global-unset-key (kbd "<M-down>"))

;; init.el ends here
