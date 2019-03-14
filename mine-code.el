(use-package yasnippet
  :init
  (setq yas-snippet-dirs '("~/emacs/snippets"))
  :config
  (yas-global-mode 1))

(use-package smartparens
  :config
  (smartparens-global-mode t))

(use-package company
  :defer t
  :init (global-company-mode)
  :config
  (add-to-list 'company-backends 'company-elm)
  (setq company-dabbrev-downcase nil)
  (setq company-idle-delay 0))

(use-package flycheck
  :init (global-flycheck-mode))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((scala . t)
   ;; (javascript . t)
   (python . t)
   (shell . t)
   (http . t)
   (ammonite . t)))

(setq tab-width 4)

(setq org-src-fontify-natively t)

(use-package iedit)

;; Tabs are bad, mkay?
(setq-default indent-tabs-mode nil)

(use-package string-inflection)

(provide 'mine-code)
