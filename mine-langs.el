;; langs
;; scala
(use-package scala-mode
  :ensure t
  :mode (("\\.scala\\'" . scala-mode)
         ("\\.sbt\\'" . scala-mode)
         ("\\.sc\\'" . scala-mode))
  :config
  (progn
    (setq scala-indent:align-parameters t)
    (setq scala-indent:align-forms t)))

(use-package ensime
  :ensure t)

(use-package sbt-mode
  :ensure t
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
				     (flycheck-mode -1)))))
  )
(use-package json-mode
  :ensure t
  :config
  (add-hook 'json-mode-hook (lambda ()
                               (make-local-variable 'js-indent-level)
                               (setq js-indent-level 2)
                               (setq tab-width 2))))

(use-package haskell-mode
  :ensure t
  :config
  (setq
   ghc-ghc-options '("-fno-warn-missing-signatures")
   haskell-compile-cabal-build-command "cd %s && stack build"
   haskell-process-type 'stack-ghci
   haskell-interactive-popup-errors nil
   haskell-process-args-stack-ghci '("--ghc-options=-ferror-spans" "--with-ghc=ghci-ng")
   haskell-process-path-ghci "stack"))

;; (use-package intero
;;   :ensure t
;;   :config
;;   (add-hook 'haskell-mode-hook 'intero-mode))

(use-package fsharp-mode
  :ensure t)

(use-package elm-mode
  :ensure t
  :config)

(use-package yaml-mode
  :ensure t)


(provide 'mine-langs)
