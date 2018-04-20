;; load package manager, add the Melpa package registry
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
      (package-install 'use-package))
(require 'use-package)

(add-to-list 'load-path (concat (getenv "HOME") "/emacs"))

(require 'mine-langs)
(require 'mine-code)
(require 'mine-navigation)
(require 'mine-platform)
(require 'mine-pretty)
(require 'mine-vc)
(require 'mine-evil)

(use-package diminish
  :ensure t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(golden-ratio-mode t)
 '(package-selected-packages
   (quote
    (evil-iedit iedit evil-avy avy smart-mode-line helm-themes golden-ratio evil-matchit evil-commentary solarized-theme dumb-jump browse-at-remote evil-magit ensime linum-relative helm-projectile evil-collection magit smartparens evil-escape zenburn-theme evil use-package)))
 '(zoom-mode nil nil (zoom)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
