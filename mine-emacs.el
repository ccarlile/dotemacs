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

;; (use-package window-purpose
;;   :ensure t
;;   :config
;;   (add-to-list 'purpose-user-mode-purposes '(scala-mode . scala))
;;   (add-to-list 'purpose-user-mode-purposes '(sbt-mode . scala))
;; )

(provide 'mine-emacs)
