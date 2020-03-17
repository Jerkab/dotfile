;;;; package --- summary

;;; Commentary:

;;; Code:

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

;; (use-package dired-sidebar
;;   :bind ("<f8>" . dired-sidebar-toggle-sidebar)
;;   :ensure t
;;   :commands (dired-sidebar-toggle-sidebar)
;;   :init
;;   (add-hook 'dired-sidebar-mode-hook
;;             (lambda ()
;;               (unless (file-remote-p default-directory)
;;                 (auto-revert-mode))))
;;   :config
;;   (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
;;   (push 'rotate-windows dired-sidebar-toggle-hidden-commands)
;;   (setq dired-sidebar-subtree-line-prefix "__")
;;   (setq dired-sidebar-theme 'vscode)
;;   (setq dired-sidebar-use-term-integration t)
;;   (setq dired-sidebar-use-custom-font t))


;; Comportement global
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
(use-package yasnippet)
(yas-reload-all)

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

;;; Other stuff
;;(setq projectile-enable-caching t)
(setq-default indent-tabs-mode nil)
(setq show-paren-style 'mixed)
(put 'dired-find-alternate-file 'disabled nil)

                                        ; treemacs
;; (use-package treemacs
;;   :ensure t
;;   :defer t
;;   :init
;;   (with-eval-after-load 'winum
;;     (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
;;   :config
;;   (progn
;;     (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
;;           treemacs-deferred-git-apply-delay      0.5
;;           treemacs-display-in-side-window        t
;;           treemacs-eldoc-display                 t
;;           treemacs-file-event-delay              5000
;;           treemacs-file-follow-delay             0.2
;;           treemacs-follow-after-init             t
;;           treemacs-git-command-pipe              ""
;;           treemacs-goto-tag-strategy             'refetch-index
;;           treemacs-indentation                   2
;;           treemacs-indentation-string            " "
;;           treemacs-is-never-other-window         nil
;;           treemacs-max-git-entries               5000
;;           treemacs-missing-project-action        'ask
;;           treemacs-no-png-images                 nil
;;           treemacs-no-delete-other-windows       t
;;           treemacs-project-follow-cleanup        nil
;;           treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
;;           treemacs-position                      'left
;;           treemacs-recenter-distance             0.1
;;           treemacs-recenter-after-file-follow    nil
;;           treemacs-recenter-after-tag-follow     nil
;;           treemacs-recenter-after-project-jump   'always
;;           treemacs-recenter-after-project-expand 'on-distance
;;           treemacs-show-cursor                   nil
;;           treemacs-show-hidden-files             t
;;           treemacs-silent-filewatch              nil
;;           treemacs-silent-refresh                nil
;;           treemacs-sorting                       'alphabetic-desc
;;           treemacs-space-between-root-nodes      t
;;           treemacs-tag-follow-cleanup            t
;;           treemacs-tag-follow-delay              1.5
;;           treemacs-width                         35)

;;     ;; The default width and height of the icons is 22 pixels. If you are
;;     ;; using a Hi-DPI display, uncomment this to double the icon size.
;;     ;;(treemacs-resize-icons 44)

;;     (treemacs-follow-mode t)
;;     (treemacs-filewatch-mode t)
;;     (treemacs-fringe-indicator-mode t)
;;     (pcase (cons (not (null (executable-find "git")))
;;                  (not (null treemacs-python-executable)))
;;       (`(t . t)
;;        (treemacs-git-mode 'deferred))
;;       (`(t . _)
;;        (treemacs-git-mode 'simple))))
;;   :bind
;;   (:map global-map
;;         ("M-0"       . treemacs-select-window)
;;         ("C-x t 1"   . treemacs-delete-other-windows)
;;         ("C-x t t"   . treemacs)
;;         ("C-x t B"   . treemacs-bookmark)
;;         ("C-x t C-t" . treemacs-find-file)
;;         ("C-x t M-t" . treemacs-find-tag)))


;; (use-package treemacs-projectile
;;   :after treemacs projectile
;;   :ensure t)

;; (use-package treemacs-icons-dired
;;   :after treemacs dired
;;   :ensure t
;;   :config (treemacs-icons-dired-mode))

;; (use-package treemacs-magit
;;   :after treemacs magit
;;   :ensure t)


;; (use-package lsp-mode
;;   :hook (js-mode . lsp-deferred)
;;   :commands (lsp lsp-deferred))

;; ;; optionally
;; (use-package lsp-ui :commands lsp-ui-mode)
;; (use-package company-lsp :commands company-lsp)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)


(use-package ssh-deploy
  :ensure t
  :demand
  :after hydra
  :hook ((after-save . ssh-deploy-after-save)
         (find-file . ssh-deploy-find-file))
  :config
  (ssh-deploy-line-mode) ;; If you want mode-line feature
  (ssh-deploy-add-menu) ;; If you want menu-bar feature
  (ssh-deploy-hydra "C-c C-z") ;; If you want the hydra feature
  )
