;; project/navigation
(use-package helm
  :ensure t
  :diminish helm-mode
  :init
  (setq helm-display-header-line nil))

(use-package ag
  :ensure t
  :commands (ag ag-regexp ag-project))

(use-package helm-files
  :config
  (define-key helm-find-files-map "\t" 'helm-execute-persistent-action))

(use-package helm-swoop
  :ensure t)

(use-package helm-ag
  :ensure helm-ag
  :commands helm-ag helm-projectile-ag)

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

(use-package dumb-jump
  :ensure t
  )

(provide 'mine-navigation)
