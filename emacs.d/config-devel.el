;;;; package --- summary

;;; Commentary:

;;; Code:

                                        ; Comportement global
;;(setq projectile-enable-caching t)
(setq-default indent-tabs-mode nil)
(setq show-paren-style 'mixed)
(put 'dired-find-alternate-file 'disabled nil)

                                        ; Gestion Projet
;; (use-package projectile
;;    :ensure t
;;    :config
;; ;;   (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;;    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;;    (projectile-mode +1))

                                        ; Explorer
;; (use-package neotree
;;   :ensure t
;;   :config
;;   ;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;;   (setq neo-vc-integration nil)
;;   :bind 
;;   ("<f8>" . neotree-toggle))

                                        ; Multiple cursors
(use-package multiple-cursor
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

                                        ; Hideshow
(use-package hideshow
  :bind (("C-c <left>" . hs-hide-block)
         ("C-c <right>" . hs-show-block)
         ("C-c <up>" . hs-hide-all)
         ("C-c <down>" . hs-show-all)))

(setq tab-width 2)
;;(use-package yasnippet)
;;(yas-reload-all)

                                        ; Perl
(fset 'perl-mode 'cperl-mode)

(setq cperl-indent-level 2
      cperl-close-paren-offset -2
      cperl-continued-statement-offset 2
      cperl-indent-parens-as-block t
      cperl-tab-always-indent t)

(setq cperl-highlight-variables-indiscriminately t)

(add-hook 'cperl-mode-hook
          (lambda()
            (local-set-key (kbd "C-c <right>") 'hs-show-block)
            (local-set-key (kbd "C-c <left>")  'hs-hide-block)
            (local-set-key (kbd "C-c <up>")    'hs-hide-all)
            (local-set-key (kbd "C-c <down>")  'hs-show-all)
            (local-set-key (kbd "C-c #")  'comment-region)
            (local-set-key (kbd "C-c \"")  'uncomment-region)
            (hs-minor-mode t)
            (yas-minor-mode t)
            (display-line-numbers-mode t)))


;; (add-hook 'cperl-mode-hook
;;           (lambda()
;;             (highlight-regexp "#FIXME:" "hi-red-b")
;;             (highlight-regexp "#TODO:" "hi-pink")
;;             (highlight-regexp "#TEST:" "hi-blue-b")
;;             (highlight-regexp "#OK:" "hi-green-b")))

;; (use-package lsp-mode
;;   :hook (js-mode . lsp-deferred)
;;   :commands (lsp lsp-deferred))

;; ;; optionally
;; (use-package lsp-ui :commands lsp-ui-mode)
;; (use-package company-lsp :commands company-lsp)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; A Dispatcher dans les bon fichier de configuration
(when (file-exists-p "~/quicklisp/slime-helper.el")
  (load (expand-file-name "~/quicklisp/slime-helper.el")))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")
(slime-setup '(slime-fancy slime-quicklisp slime-asdf))

