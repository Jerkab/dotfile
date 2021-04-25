;;;; package --- summary Contigugration des themes
;;;; commentary:

;;; Code:
					; Custom file
(setq custom-file "~/.elisp.d/emacs-custom.el")
(when (file-exists-p "~/.elisp.d/emacs-custom.el")
  (load custom-file))

(when (file-exists-p "~/.emacs.d/themes/")
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes"))

                                        ; Configuration de l'affichage
(if (display-graphic-p)
    (progn
      ;;(set-default-font "Inconsolata 11")
      (menu-bar-mode -1)
      (tool-bar-mode -1)
      ;; (scroll-bar-mode -1)
      (cua-mode 0)
      (setq-default frame-title-format '("%f [%m]"))
      ;;(customize-set-variable 'solarized-termcolors 256)
      ;;(set-terminal-coding-system 'iso-8859-1)
      ;;(speedbar t)

                                        ; Color Theme
      ;; (use-package solarized-theme)
      ;;   :config
      ;;   ;;(load-theme 'solarized-dark t)
      ;;   (let ((line (face-attribute 'mode-line :underline)))
      ;;     (set-face-attribute 'mode-line          nil :overline   line)
      ;;     (set-face-attribute 'mode-line-inactive nil :overline   line)
      ;;     (set-face-attribute 'mode-line-inactive nil :underline  line)
      ;;     (set-face-attribute 'mode-line          nil :box        nil)
      ;;     (set-face-attribute 'mode-line-inactive nil :box        nil)
      ;;     (set-face-attribute 'mode-line-inactive nil :background "#f9f2d9")))
      
      ;; (load-theme 'doom-solarized-light)
      
      (require 'all-the-icons)
                                        ; Modeline

      (global-anzu-mode +1)

      ;;; Simple modeline
      (require 'simple-modeline)
      (simple-modeline-mode)
      
      ;;; Redefine function
      ;; (defun simple-modeline-segment-major-mode ()
      ;;   "Displays the current major mode in the mode-line."
      ;;   (list (propertize (concat " " (all-the-icons-icon-for-mode major-mode))
      ;;                     'help-echo (format "Major-mode: `%s'" major-mode)
      ;;                     'display '(raise 0)
      ;;                     'face `(:height 1.1
      ;;                                     :family ,(all-the-icons-icon-family-for-mode major-mode)
      ;;                                     :inherit))
      ;;         (propertize
      ;;          (concat " "
      ;;                  (or (and (boundp 'delighted-modes)
      ;;                           (cadr (assq major-mode delighted-modes)))
      ;;                      (format-mode-line mode-name)))
      ;;          'face 'bold)))

                                        ; Tabs bar
      (use-package centaur-tabs
        :demand
        :config
        (centaur-tabs-mode t)
        :bind
        ("C-<prior>" . centaur-tabs-backward)
        ("C-<next>" . centaur-tabs-forward))
      )

                                        ; Non graphics
  (progn
    (menu-bar-mode -1)
    ;;(tool-bar-mode -1)
    ;;(scroll-bar-mode -1)
    (set-terminal-coding-system 'utf-8)
    (load-theme 'gruvbox t)
    ;;(customize-set-variable 'solarized-termcolors 256)
    ;;(load-theme 'solarized-dark t)
    ))


;(provide 'config-theme)
;;; config-theme.el ends here
