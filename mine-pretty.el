;; Rice
(use-package zenburn-theme
  :ensure t
  :init
  (load-theme 'zenburn t))
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; (use-package golden-ratio
;;   :ensure t
;;   :config
;;   (golden-ratio-mode 1))
(use-package zoom
  :ensure t
  :config
  (custom-set-variables
   '(zoom-mode t)))

(set-face-attribute 'default nil :font  "Hasklig-9")
(set-frame-font "Hasklig-9" nil t)

(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

(use-package ranger
  :ensure t)

(provide 'mine-pretty)
