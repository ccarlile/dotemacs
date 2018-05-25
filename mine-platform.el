;; platform
;; (use-package linux
;;   :ensure nil
;;   :if (eq system-type 'gnu/linux))

(use-package xresources-theme
  :ensure t
  :if (eq system-type 'gnu/linux))

;; (use-package osx
;;   :ensure nil
;;   :if (eq system-type 'darwin))

(provide 'mine-platform)
