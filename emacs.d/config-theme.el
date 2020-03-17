;;;; package --- summary Contigugration des themes

					; Custom file
(setq custom-file "~/.elisp.d/emacs-custom.el")
(when (file-exists-p "~/.elisp.d/emacs-custom.el")
  (load custom-file))

(when (file-exists-p "~/.emacs.d/themes/")
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes"))

                                        ; Configuration de l'affichage
(if (display-graphic-p)
    (progn
      (set-default-font "Inconsolata 11")
      (menu-bar-mode -1)
      (tool-bar-mode -1)
      ;; (scroll-bar-mode -1)
      (setq-default frame-title-format '("%f [%m]"))
      (customize-set-variable 'solarized-termcolors 256)
      (set-terminal-coding-system 'iso-8859-1)
      ;;      (speedbar t)

      (use-package all-the-icons)
;;      (use-package doom-themes
;;        :config
;;        ;; Global settings (defaults)
;;        (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;              doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;        (load-theme 'doom-opera t)
;;
;;        ;; Enable flashing mode-line on errors
;;        (doom-themes-visual-bell-config)
;;        
;;        ;; Enable custom neotree theme (all-the-icons must be installed!)
;;        (doom-themes-neotree-config)
;;        ;; or for treemacs users
;;        (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
;;        (doom-themes-treemacs-config)
;;        
;;        ;; Corrects (and improves) org-mode's native fontification.
;;        (doom-themes-org-config))

      (use-package doom-modeline
        :ensure t
        :hook (after-init . doom-modeline-mode))

      (use-package centaur-tabs
        :demand
        :config
        (centaur-tabs-mode t)
        :bind
        ("C-<prior>" . centaur-tabs-backward)
        ("C-<next>" . centaur-tabs-forward))
      (cua-mode 0)
      (load-theme 'solarized-light))
  (progn
    (menu-bar-mode -1)
    ;;(tool-bar-mode -1)
    ;;(scroll-bar-mode -1)
    (set-terminal-coding-system 'utf-8)
    (load-theme 'gruvbox t)
    ;;(customize-set-variable 'solarized-termcolors 256)
    ;;(load-theme 'solarized-dark t)
    ))
