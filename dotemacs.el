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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (dumb-jump browse-at-remote evil-magit ensime linum-relative helm-projectile evil-collection magit smartparens evil-escape zenburn-theme evil use-package)))
 '(zoom-mode t nil (zoom)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
