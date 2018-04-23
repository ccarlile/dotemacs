;; Rice
(use-package zenburn-theme
  :ensure t
  :init
  (load-theme 'zenburn t))

(use-package helm-themes
  :ensure t)

(use-package solarized-theme
  :ensure t)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; the best way I've found is to just call golden-ratio
(use-package golden-ratio
  :ensure t
  :diminish "🏆"
  :config
  (golden-ratio-mode 1))

(setq ring-bell-function 'ignore)

;; (use-package zoom
;;   :ensure t
;;   :config
;;   (custom-set-variables
;;    '(zoom-mode t)))

(set-face-attribute 'default nil :font  "Hasklig-9")
(set-frame-font "Hasklig-9" nil t)

(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

(use-package ranger
  :ensure t)

(use-package smart-mode-line
  :ensure t
  :config
  (sml/setup))

(diminish 'undo-tree-mode)

(provide 'mine-pretty)

