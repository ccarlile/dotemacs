
(use-package xresources-theme
  
  :if (eq system-type 'gnu/linux))

(cond
 ((string-equal system-type "darwin")
  (progn
    (setq exec-path (append exec-path '("/usr/local/bin")))
    (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq moody-slant-function 'moody-slant-apple-rgb)
    (message "OSX")))
 ((string-equal system-type "gnu/linux")
  (progn
    (setq exec-path (append exec-path '("/usr/local/bin")))
    (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (message "Linucks"))))


(provide 'mine-platform)
