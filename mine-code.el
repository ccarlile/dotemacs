(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs '("~/emacs/snippets"))
  :config
  (yas-global-mode 1))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (smartparens-global-mode t))

(use-package company
  :ensure t
  :defer t
  :init (global-company-mode)
  :config
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0))


(global-linum-mode t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((scala . t)
   ;; (javascript . t)
   (python . t))
 )

(setq tab-width 4)

(setq org-src-fontify-natively t)

(provide 'mine-code)
