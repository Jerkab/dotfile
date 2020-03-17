;;;; Package --- summary
;;;; Configuration IVY
;;;;

;;; Commentary:
;;; Configuration des modules ivy counsel et smes

;;; Code:
                                        ; Ivy
(use-package ivy
  :diminish ivy-mode
  :ensure f
  :init (ivy-mode)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :bind  ("C-c C-r" . ivy-resume)
  ;;  ("C-s" . swiper)
  ("C-M-f" . swiper)
  :config
  (bind-keys :map ivy-minibuffer-map
             ("RET" . ivy-alt-done)))

;;(use-package ivy-rich
;;  :ensure t
;;  :init (ivy-rich-mode 1))
                                        ; counsel
(use-package counsel
  :requires ivy
  :bind ("C-x C-f" . counsel-find-file)
  ("C-M-g" . counsel-git-grep)
  ("<f1> f" . counsel-describe-function)
  ("<f1> v" . counsel-describe-variable)
  ("<f1> l" . counsel-find-library)
  ("<f2> i" . counsel-info-lookup-symbol)
  ("<f2> u" . counsel-unicode-char))
                                        ; smex
(use-package smex
  :config (smex-initialize)
  :bind ("M-x" . smex)
  ("M-X" . smex-major-mode-commands)
  ("C-c M-x" . execute-extended-command))

;;(require 'ivy)
;;(require 'counsel)
;;(ivy-mode 1)
;;(setq ivy-use-virtual-buffers t)
;;(setq ivy-count-format "(%d/%d) ")
;;(setq ivy-re-builders-alist
;;      '((t . ivy--regex-fuzzy)))
;;(global-set-key (kbd "C-s") 'swiper)
;;(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;(global-set-key (kbd "<f1> f") 'counsel-describe-function)
;;(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;;(global-set-key (kbd "<f1> l") 'counsel-find-library)
;;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;;(global-set-key (kbd "C-c C-r") 'ivy-resume)

;;; config-ivy.el ends here
