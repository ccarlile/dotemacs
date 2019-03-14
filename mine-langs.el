;; langs
;; scala
(use-package scala-mode
  :mode (("\\.scala\\'" . scala-mode)
         ("\\.sbt\\'" . scala-mode)
         ("\\.sc\\'" . scala-mode))
  :config
  (progn
    (setq scala-indent:align-parameters t)
    (setq scala-indent:align-forms t)))

(use-package ob-ammonite)

(use-package sbt-mode
  :config
  (add-hook 'sbt-mode-hook '(lambda ()
                              (setq compilation-skip-threshold 2)))
                              ;;(local-set-key (kbd "C-a") 'comint-bol)
                              ;;(local-set-key (kbd "M-RET") 'comint-accumulate)))
  (add-hook 'scala-mode-hook '(lambda ()
				(progn
				 (setq tab-width 2)
				 (if (and buffer-file-name
					  (string= (file-name-extension buffer-file-name) "sbt"))
				     (flycheck-mode -1))))))
(use-package json-mode
  :config
  (add-hook 'json-mode-hook (lambda ()
                               (make-local-variable 'js-indent-level)
                               (setq js-indent-level 2)
                               (setq tab-width 2))))

(use-package haskell-mode
  :config
  (setq
   ghc-ghc-options '("-fno-warn-missing-signatures")
   haskell-compile-cabal-build-command "cd %s && stack build"
   haskell-process-type 'stack-ghci
   haskell-interactive-popup-errors nil
   haskell-process-args-stack-ghci '("--ghc-options=-ferror-spans" "--with-ghc=ghci-ng")
   haskell-process-path-ghci "stack"))

;; (use-package intero
;;   
;;   :config
;;   (add-hook 'haskell-mode-hook 'intero-mode))

(defun mine-wrap-sbt-start ()
  "Check if a file is a .scala file before attempting to launch sbt from it"
  (interactive)
  (if (eq major-mode 'scala-mode) (sbt-start) (print "Must start sbt from a scala project")))

(use-package fsharp-mode)

(use-package elm-mode)

(use-package yaml-mode)

(use-package ess)

(use-package lispy
  :config
  (setq lispy-compat '(edebug cider))

  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
  (add-hook 'clojure-mode-hook (lambda () (lispy-mode 1))))

;; (use-package lispyville
;;   
;;   :config
;;   (add-hook 'lispy-mode-hook #'lispyville-mode))

(use-package clojure-mode)

(use-package cider)

(use-package nix-mode)

(use-package terraform-mode)

(provide 'mine-langs)
