;;; init.el --- Fichier d'initialisation
;;; Commentary:
;;; Emacs users configuration file

;;; Code:

;; STARTING
(setq inhibit-startup-message t)        ; Disable startup message

                                        ; Configuration encoding
(set-language-environment "Latin-1")
;;(prefer-coding-system 'iso-8859-1)
(set-default-coding-systems 'iso-8859-1)
;;(set-terminal-coding-system 'iso-8859-1)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Configuration des paquets builtin

;;(global-linum-mode 1)
;;(setq linum-format "%5d ")
(setq column-number-mode t)
(delete-selection-mode 1)

                                        ; BACKUP strategy
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))
(setq auto-save-default t)
(setq auto-save-file-name-transforms
      '(("\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'" "/home/jsa/.emacs.d/autosave/\\2" t)
        ("\\`/?\\([^/]*/\\)*\\([^/]*\\)\\'" "/home/jsa/.emacs.d/autosave/\\2" t)))

                                        ; NAVIGATION
(global-set-key (kbd "C-<right>")    'forward-word)      ; Ctrl+right   => forward word
(global-set-key (kbd "C-<left>")    'backward-word)     ; Ctrl+left    => backward word

                                        ; Recent file
(require 'recentf)
(setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
(recentf-mode 1)
(setq-default recent-save-file "~/.emacs.d/recentf")
(run-at-time nil (* 5 60) 'recentf-save-list)


;; PACKAGE DEFINITION
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://stable.melpa.org/packages/"))
;;(add-to-list 'package-archives '("all" . "https://melpa.org/packages/"))
(package-initialize)

;; PACKAGE CONFIGURATION
                                        ; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

                                        ; Page de garde
;; (use-package dashboard
;;   :diminish
;;   (dashboard-mode page-break-lines-mode)
;;   :custom
;; ;;  (dashboard-center-content t)
;;   (dashboard-startup-banner 'logo)
;;   (dashboard-items '((recents . 15)
;;                      (projects . 5)
;;                      (bookmarks . 5)))
;; ;;  :custom-face
;; ;;  (dashboard-heading ((t (:foreground "#f1fa8c" :weight bold))))

;;   :hook
;;   (after-init . dashboard-setup-startup-hook))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (set-fontset-font "fontset-default"
                    (cons page-break-lines-char page-break-lines-char)
                    (face-attribute 'default :family))
  )

					; Dired
(use-package dired
  :config
  (setq dired-dwim-target t)
  (setq dired-use-ls-dired nil))

                                        ; Ivy
(load "~/.emacs.d/config-ivy.el")
                                        ; Which-key
(use-package which-key
  :ensure t
  :init
  (which-key-mode))

                                        ; Configuration pour le dev
(load "~/.emacs.d/config-devel.el")
                                        ; Configuration du theme
(load "~/.emacs.d/config-theme.el")

                                        ; Autre configuration hors melpa
(when (file-exists-p "~/.elisp.d/")
  (add-to-list 'load-path "~/.elisp.d/")
  (when (file-exists-p "~/.elisp.d/elisp.el")
    (load "~/.elisp.d/elisp.el")))

;;; init.el

