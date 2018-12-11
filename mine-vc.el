
(use-package magit
  :ensure t
  :commands (magit-status projectile-vc))

(use-package browse-at-remote
  :ensure t)

(use-package ghub
  :ensure t)

(use-package magithub
  :after magit
  :ensure t
  :config
  (magithub-feature-autoinject t))


(provide 'mine-vc)
