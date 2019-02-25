;; project/navigation
(use-package helm
  :init
  (setq helm-display-header-line nil
        helm-mode-fuzzy-match t
        helm-completion-in-region-fuzzy-match t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (helm-mode 1))

(use-package ag
  :commands (ag ag-regexp ag-project))

(defun sudo-find-file (file)
  "Open FILE as root."
  (interactive
   (list (read-file-name "Open as root: ")))
  (find-file (if (file-writable-p file)
                 file
               (concat "/sudo:root@localhost:" file))))

(defun mine-do-ag-in-project ()
  "Prompt for a projectile project and search in there"
  (interactive)
  (helm-do-ag (completing-read "From which project?" 'projectile-known-projects)))

;; WIP
;; (defun mine-dumb-jump-in-project ()
;;   "Best guess of def of symbol under point in user-supplied project root"
;;   (interactive)
;;   (let* ((cur-file (buffer-file-name))
;;          (project-root (completing-read "From which project?" 'projectile-known-projects))
;;          (cur-lang (dumb-jump-get-language cur-file))
;;          (ctx-type (dumb ))
;;          )
;;     (dumb-jump-handle-results (dumb-jump-fetch-results cur-file project-root cur-lang nil) cur-file project-root)
;;     )
;;   )

(use-package helm-swoop)

(use-package helm-ag
  :ensure helm-ag
  :commands helm-ag helm-projectile-ag)

(use-package projectile
  :diminish
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(use-package helm-projectile
  :config
  (helm-projectile-on))

(use-package dumb-jump)

(use-package avy)

(when (fboundp 'winner-mode)
  (winner-mode 1))

(diminish 'winner-mode)
(diminish 'eldoc-mode)


(provide 'mine-navigation)
