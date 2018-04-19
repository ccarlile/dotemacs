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

(provide 'mine-code)
