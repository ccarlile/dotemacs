;; project/navigation
(use-package helm
  :ensure t
  :diminish helm-mode
  :init
  (setq helm-display-header-line nil
        helm-mode-fuzzy-match t
        helm-completion-in-region-fuzzy-match t)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (helm-mode 1))

(use-package ag
  :ensure t
  :commands (ag ag-regexp ag-project))

(use-package helm-files
  :config
  (define-key helm-find-files-map "\t" 'helm-execute-persistent-action))

(defun sudo-find-file (file)
  "Open FILE as root."
  (interactive
   (list (read-file-name "Open as root: ")))
  (find-file (if (file-writable-p file)
                 file
               (concat "/sudo:root@localhost:" file))))

(use-package helm-swoop
  :ensure t)

(use-package helm-ag
  :ensure helm-ag
  :commands helm-ag helm-projectile-ag)

(use-package projectile
  :diminish
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

(use-package avy
  :ensure t
  )

(when (fboundp 'winner-mode)
  (winner-mode 1))

(diminish 'winner-mode)
(diminish 'eldoc-mode)


(provide 'mine-navigation)
