;; load package manager, add the Melpa package registry
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
      (package-install 'use-package))
(require 'use-package)
(require 'use-package-ensure)

(setq use-package-always-ensure t)


;; Dont commit this part
(setq mine-emacs-root-directory (concat (getenv "HOME") "/emacs"))

;; (org-babel-load-file (expand-file-name "emacs.org" user-emacs-directory))
(org-babel-load-file (expand-file-name "emacs.org" mine-emacs-root-directory))


(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
(put 'narrow-to-region 'disabled nil)
