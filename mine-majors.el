(defun mine-sbt-compile ()
  "I sure wish I knew how this works"
  (interactive)
  (sbt-command "compile"))

(defun org-archive-done-tasks ()
  "Archive all headings in a subtree"
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE|CANCELLED|INACTIVE" 'tree))

(evil-leader/set-key-for-mode 'scala-mode
  "m c" 'mine-sbt-compile
  "m s" 'mine-wrap-sbt-start
  "m t" 'sbt-send-eol
  "m x" 'sbt-command)

(evil-leader/set-key-for-mode 'elm-mode
  "m r" 'elm-repl-load)

(evil-leader/set-key-for-mode 'org-mode
  ;; "X"port
  "x h" 'org-html-export-to-html
  "x t" 'org-babel-tangle

  ;; general
  "m d" 'org-todo
  "m h" 'org-toggle-heading
  "m a" 'org-archive-subtree-default
  "m A" 'org-archive-done-tasks)

(evil-leader/set-key-for-mode 'clojure-mode
  "l s" 'cider-eval-last-sexp)

(provide 'mine-majors)
