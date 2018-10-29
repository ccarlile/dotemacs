(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package htmlize
  :ensure t)


;; Todo: visual-line-mode in org, md, txt, etc. and the associated evil j/k movement 

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(let* ((variable-tuple (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                             ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                             ((x-list-fonts "Verdana")         '(:font "Verdana"))
                             ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                             (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces 'user
                          `(org-level-8 ((t (,@headline ,@variable-tuple))))
                          `(org-level-7 ((t (,@headline ,@variable-tuple))))
                          `(org-level-6 ((t (,@headline ,@variable-tuple))))
                          `(org-level-5 ((t (,@headline ,@variable-tuple))))
                          `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
                          `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.2))))
                          `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.3))))
                          `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.4))))
                          `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))

(use-package writeroom-mode
  :ensure t)


(use-package wc-mode
  :ensure t)

(defun text-mode-hooks ()
  "Stuff to ensure a nice writing environment for plain text and similar formats."
  (visual-line-mode))

;;(add-hook text-mode-hook 'text-mode-hooks)
;;(add-hook org-mode-hook 'text-mode-hooks)
;;(add-hook markdown-mode-hook 'text-mode-hooks)

(setq org-hide-emphasis-markers t)

(visual-line-mode 1)

(setq org-agenda-files (list "~/Dropbox/org/agenda/life.org"
                             "~/Dropbox/org/agenda/inbox.org"
                             "~/Dropbox/org/agenda/benntoo.org"))

(setq org-default-notes-file "~/Dropbox/org/agenda/inbox.org")

(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 9)))

; Refile in a single go
(setq org-outline-path-complete-in-steps nil)


; Show full paths for refiling
(setq org-refile-use-outline-path t)

(setq org-capture-templates
      '(("j" "Journal" entry (file+olp+datetree "~/Dropbox/org/journal.org") "* %?\n")
        ("t" "Todo" entry (file "~/Dropbox/org/agenda/inbox.org") "* TODO %?\n%U" :empty-lines 1)))


(provide 'mine-plaintext)

