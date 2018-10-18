;; platform
;; (use-package linux
;;   :ensure nil
;;   :if (eq system-type 'gnu/linux))

(use-package xresources-theme
  :ensure t
  :if (eq system-type 'gnu/linux))

(cond
 ((string-equal system-type "darwin")
  (progn
    (setq exec-path (append exec-path '("/usr/local/bin")))
    (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

    (message "OSX")))
 ((string-equal system-type "gnu/linux")
  (progn
    (setq exec-path (append exec-path '("/usr/local/bin")))
    (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (message "Linucks"))))

;; (use-package osx
;;   :ensure nil
;;   :if (eq system-type 'darwin))

(provide 'mine-platform)
