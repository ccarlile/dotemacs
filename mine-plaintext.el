(use-package markdown-mode
  
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package ox-gfm)

;; TODO: document this
(use-package htmlize)

;; Todo: visual-line-mode in org, md, txt, etc. and the associated evil j/k movement 

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


;; I took this out because the fixed colors for the faces pissed me off.
;; Will return to it when I figure out how faces work

;; (let* ((variable-tuple (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
;;                              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
;;                              ((x-list-fonts "Verdana")         '(:font "Verdana"))
;;                              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
;;                              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
;;        (base-font-color     (face-foreground 'default nil 'default))
;;        (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

;;   (custom-theme-set-faces 'user
;;                           `(org-level-8 ((t (,@headline ,@variable-tuple :height 1.1))))
;;                           `(org-level-7 ((t (,@headline ,@variable-tuple :height 1.1))))
;;                           `(org-level-6 ((t (,@headline ,@variable-tuple :height 1.1))))
;;                           `(org-level-5 ((t (,@headline ,@variable-tuple :height 1.1))))
;;                           `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
;;                           `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.2))))
;;                           `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.3))))
;;                           `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.4))))
;;                           `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil)))))
;;   )

(use-package writeroom-mode)

(use-package wc-mode)

(defun text-mode-hooks ()
  "Stuff to ensure a nice writing environment for plain text and similar formats."
  (visual-line-mode))

;;(add-hook text-mode-hook 'text-mode-hooks)
;;(add-hook org-mode-hook 'text-mode-hooks)
;;(add-hook markdown-mode-hook 'text-mode-hooks)

(setq org-hide-emphasis-markers t)

(use-package org-mind-map
  :init
  (require 'ox-org)
  
  ;; Uncomment the below if 'ensure-system-packages` is installed
  ;;:ensure-system-package (gvgen . graphviz)
  :config
  (setq org-mind-map-engine "dot")       ; Default. Directed Graph
  ;; (setq org-mind-map-engine "neato")  ; Undirected Spring Graph
  ;; (setq org-mind-map-engine "twopi")  ; Radial Layout
  ;; (setq org-mind-map-engine "fdp")    ; Undirected Spring Force-Directed
  ;; (setq org-mind-map-engine "sfdp")   ; Multiscale version of fdp for the layout of large graphs
  ;; (setq org-mind-map-engine "twopi")  ; Radial layouts
  ;; (setq org-mind-map-engine "circo")  ; Circular Layout
  )

(visual-line-mode 1)

(setq org-agenda-files (list "~/Dropbox/org/agenda/life.org"
                             "~/Dropbox/org/agenda/inbox.org"
                             "~/Dropbox/org/agenda/benntoo.org"
                             "~/b/org/banno.org"))

(setq org-default-notes-file "~/Dropbox/org/agenda/inbox.org")

(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 9)))

; Refile in a single go
(setq org-outline-path-complete-in-steps nil)


; Show full paths for refiling
(setq org-refile-use-outline-path t)

(setq org-capture-templates
      '(("j" "Journal" entry (file+olp+datetree "~/Dropbox/org/journal.org") "* %?\n")
        ("e" "Event" entry (file+headline "~/Dropbox/org/agenda/life.org" "Social Calendar")
         "* %?                :event:")
        ("t" "Todo" entry (file "~/Dropbox/org/agenda/inbox.org") "* TODO %?\n%U" :empty-lines 1)
        ;; ("m" "Tomorrow" entry (file "~/Dropbox/org/inbox") (paste))
        ))

;; GTD-style org keywords
(setq org-todo-keywords
  '((sequence "TODO" "NEXT" "WAITING" "|" "DONE" "INACTIVE" "CANCELLED")))

(setq org-src-tab-acts-natively t)

(setq org-html-validation-link nil)

(setq org-image-actual-width '(300))

(use-package ob-http)

(use-package pdf-tools
  :config
  (pdf-tools-install)
  (evil-set-initial-state 'pdf-view-mode 'normal))

(use-package emojify
  :config
  (setq emojify-emoji-styles "unicode")
  
  
  (add-hook 'after-init-hook #'global-emojify-mode))

(provide 'mine-plaintext)
