;; MELPA repository for packages
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; Emacs Customization file
(setq custom-file "~/.emacs.d/.emacs-custom.el")
(load "~/.emacs.d/emacs-custom.el")

;; Disable toolbar 
(tool-bar-mode -1)

;; Package and configuration
(require 'use-package)

;; autocomplete minibuffer
(use-package ivy
  :diminish ivy-mode
  :ensure f
  :init
  (ivy-mode)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  :bind
  ("C-c C-r" . ivy-resume)
;;  ("C-s" . swiper)
  ("s-f" . swiper)
  :config
  (bind-keys :map ivy-minibuffer-map
	     ("RET" . ivy-alt-done)))

(use-package counsel
  :requires ivy
  :bind
  ("C-x C-f" . counsel-find-file)
  ("s-g" . counsel-git-grep))

(use-package smex
 :config
 (smex-initialize)
 :bind
 ("M-x" . smex)
 ("M-X" . smex-major-mode-commands)
 ("C-c M-x" . execute-extended-command))

;;(use-package helm
;;  :config ((helm-mode 1)
;;	   (setq helm-mode-fuzzy-match t)
;;	   (setq helm-completion-in-region-fuzzy-match t))
;;  :ensure t
;;  :bind (("M-x" . helm-M-x)
;;	 ("M-<f5>" . helm-find-files)
;;	 ("<f10>" . helm-buffers-list)
;;	 ("S-<f10>" . helm-recentf)))

(use-package recentf
  :init
  (recentf-mode 1)

  :config
  ;; Increase limit
  (setq recentf-max-menu-items 100))


(load-theme 'solarized-light)
(setq inferior-lisp-program "sbcl")

;;(use-package powerline
;;  :config
;;  ((powerline-default-theme)))

(defalias 'perl-mode 'cperl-mode)

