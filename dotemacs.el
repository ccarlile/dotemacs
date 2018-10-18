;; load package manager, add the Melpa package registry
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
      (package-install 'use-package))
(require 'use-package)


(setq mine-emacs-root-directory "/emacs")

(add-to-list 'load-path (concat (getenv "HOME") mine-emacs-root-directory))

(require 'mine-emacs)
(require 'mine-langs)
(require 'mine-code)
(require 'mine-navigation)
(require 'mine-pretty)
(require 'mine-platform)
(require 'mine-vc)
(require 'mine-extras)
(require 'mine-plaintext)
(require 'mine-evil)
(require 'mine-majors)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
