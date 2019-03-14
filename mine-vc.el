
(use-package magit
  :commands (magit-status projectile-vc))

(defvar work-home-dir
  (concat (getenv "HOME") "/b/"))

;; Wrapper to clone a work repo
(defun mine-magit-clone-banno (reponame)
  "Clone REPO from github and put it in with the rest of the projects"
  (interactive "MName of project: ")
  (let ((repo-dir (concat work-home-dir reponame "/"))
        (remote-repo (concat "git@github.com:banno/" reponame)))
    (magit-clone remote-repo repo-dir)))

(use-package browse-at-remote)

(use-package ghub)

(use-package forge)

(provide 'mine-vc)
