(defun emacs-path (path)
  (expand-file-name path user-emacs-directory))

(load (emacs-path "settings"))

(eval-when-compile
  (require 'use-package))

(use-package emacs
  :bind ("C-;" . comment-or-uncomment-region))

;;; Packages

(use-package avy
  :bind ("C-'" . avy-goto-char-timer)
  :config
  (avy-setup-default))

(use-package consult
  :bind (("C-x b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)))

(use-package company
  :init
  (global-company-mode 1))

(use-package embark
  :bind (("C-." . embark-act)
         ("M-." . embark-dwim)))

(use-package embark-consult
  :after (embark consult))

(use-package helpful
  :bind (("C-h f" . helpful-callable)
         ("C-h v" . helpful-variable)
         ("C-h x" . helpful-command)
         ("C-h k" . helpful-key)
         ("C-c C-d" . helpful-at-point)))

(use-package magit)

(use-package marginalia
  :init
  (marginalia-mode))

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package orderless)

(use-package org)

(use-package vertico
  :init
  (vertico-mode))

(use-package which-key
  :init
  (which-key-mode))
