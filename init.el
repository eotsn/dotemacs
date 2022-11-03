;;; init.el -*- lexical-binding: t; -*-

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

(use-package direnv
  :config
  (direnv-mode))

(use-package eglot)

(use-package embark
  :bind (("C-." . embark-act)
         ("M-." . embark-dwim)))

(use-package embark-consult
  :after (embark consult))

(use-package go-dlv
  :after go-mode)

(use-package go-mode
  :preface
  (defun project-find-go-module (dir)
    (when-let ((root (locate-dominating-file dir "go.mod")))
      (cons 'go-module root)))
  :init
  (cl-defmethod project-root ((project (head go-module)))
    (cdr project))
  :bind (:map go-mode-map
              ("C-c C-c C-f" . eglot-format-buffer)
              ("C-c C-c C-i" . eglot-code-action-organize-imports))
  :hook (project-find-functions . project-find-go-module))

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

(use-package plantuml-mode
  :mode ("\\.plantuml\\'" "\\.puml\\'")
  :config
  (setq plantuml-indent-level 2
        plantuml-jar-path (emacs-path "plantuml-1.2022.7.jar")
        plantuml-default-exec-mode 'jar))

(use-package vertico
  :init
  (vertico-mode))

(use-package which-key
  :init
  (which-key-mode))
