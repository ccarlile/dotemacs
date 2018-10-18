(defun mine-sbt-compile ()
  "I sure wish I knew how this works"
  (interactive)
  (sbt-command "compile"))

(evil-leader/set-key-for-mode 'scala-mode
  "m c" 'mine-sbt-compile
  "m s" 'sbt-start)

(evil-leader/set-key-for-mode 'elm-mode
  "m r" 'elm-repl-load)

(evil-leader/set-key-for-mode 'org-mode
  "m h" 'org-html-export-to-html
  "m t" 'org-babel-tangle)


(provide 'mine-majors)
