(use-package diminish
  :ensure t)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;; Figure out a better way to manage PATH
(defun mine-make-path-home (relative)
  "Take a path relative to home and turn it into an absolute path"
  (concat (getenv "HOME") "/" relative)
  )

(setq mine-paths
      (list (mine-make-path-home "bin/stack")
            (mine-make-path-home ".local/bin")
            (mine-make-path-home "bin")))

(setq exec-path (append exec-path mine-paths))
(setenv "PATH" (concat (getenv "PATH") ":" (mapconcat 'identity mine-paths ":")))


;; (setq exec-path (append exec-path (concat (getenv "HOME") "/bin/stack")))
;; (setenv "PATH" (concat (getenv "PATH") ":" (getenv "HOME") "/bin/stack"))

;; (use-package window-purpose
;;   :ensure t
;;   :config
;;   (add-to-list 'purpose-user-mode-purposes '(scala-mode . scala))
;;   (add-to-list 'purpose-user-mode-purposes '(sbt-mode . scala))
;; )

(setq initial-major-mode 'org-mode)

(global-auto-revert-mode 1)

(add-hook 'dired-mode-hook 'auto-revert-mode)

(provide 'mine-emacs)
