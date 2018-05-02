;; langs
;; scala
(use-package scala-mode
  :ensure t
  :mode (("\\.scala\\'" . scala-mode)
         ("\\.sbt\\'" . scala-mode)
         ("\\.sc\\'" . scala-mode))
  :config
  (progn
    ;; give this guy a spin
    (add-hook 'scala-mode-hook 'c-subword-mode)
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



(provide 'mine-langs)
