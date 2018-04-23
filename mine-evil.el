;; load evil
(setq evil-want-integration nil)
(use-package evil
    :ensure t ;; install the evil package if not installed
    :diminish "😈"
    :init ;; tweak evil's configuration before loading it
    (setq evil-search-module 'evil-search)
    (setq evil-ex-complete-emacs-commands nil)
    (setq evil-vsplit-window-right t)
    (setq evil-split-window-below t)
    (setq evil-shift-round nil)
    (setq evil-want-C-u-scroll t)

    (use-package evil-leader
      :ensure t
      :init
      ;;:after magit
      (global-evil-leader-mode)
      :config
      (setq evil-leader/in-all-states t)
      (evil-leader/set-leader "<SPC>")
      (evil-leader/set-key
	;; git prefix
	"g s" 'magit-status
	"g r" 'browse-at-remote

	;; buffer prefix
	"b b" 'helm-mini
	"b s" 'switch-to-scratch-buffer

	;; files prefix
	"f f" 'helm-find-files
	"f j" 'dired-jump
	"f r" 'ranger

	;; help prefix
	"h k" 'describe-key
	"h f" 'describe-function

	;; comment/code prefix
	"c l" 'evil-commentary-line
	"c d" 'comment-dwim

	;; jump prefix
	"j j" 'avy-goto-char

	;; lisp prefix
	"l f" 'load-file

	;; projectile prefix
	"p f" 'helm-projectile-find-file
	"p p" 'helm-projectile-switch-project

	;; search prefix
	"s f" 'helm-do-ag
	"s p" 'helm-do-ag-project-root
	"s b" 'helm-do-ag-buffers
	"s s" 'helm-swoop

	;; general toggles
	"t z" 'zoom-mode
	"t t" 'helm-themes
	
	;; general prefix
	"SPC" 'helm-M-x))

    :config ;; tweak evil after loading it
    (evil-mode)

    ;; muh speshul keybinds
    (define-key evil-normal-state-map (kbd ";") 'evil-ex)
    (define-key evil-normal-state-map (kbd ":") 'evil-repeat-find-char)
    (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
    ;; uncomment on widescreen
    ;; (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
    ;; (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
    (define-key evil-normal-state-map (kbd "C-c l") 'winner-redo)
    (define-key evil-normal-state-map (kbd "C-c h") 'winner-undo)
    (define-key evil-normal-state-map (kbd "C-c n") 'next-error)
    (define-key evil-normal-state-map (kbd "C-c n") 'next-error)
    (define-key evil-normal-state-map (kbd "C-]") 'dumb-jump-go)
    (define-key evil-normal-state-map (kbd "C-'") 'dumb-jump-go)
    (define-key evil-normal-state-map (kbd "C-t") 'dumb-jump-back)
    (define-key evil-visual-state-map (kbd "s") 'evil-surround-reion)
    (define-key evil-normal-state-map (kbd "SPC g r") 'browse-at-remote)
    (define-key evil-normal-state-map [backspace] 'evil-switch-to-windows-last-buffer)
    (define-key evil-insert-state-map ["C-w"] 'backward-kill-word)
    (define-key evil-insert-state-map (kbd "C-\\") 'yas-expand)
    (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)


    (use-package evil-escape
      :diminish
      :ensure t
      :config
      (setq-default evil-escape-key-sequence "jk")
      (setq-default evil-escape-unordered-key-sequence t)
      (evil-escape-mode))

    (use-package evil-surround
      :ensure t
      :config
      (global-evil-surround-mode))

    (use-package evil-commentary
      :diminish "💬"
      :ensure t
      :after evil
      :config (evil-commentary-mode))

    ;; (use-package evil-matchit
    ;;   :ensure t
    ;;   :after evil
    ;;   :config (global-evil-matchit-mode))

    (use-package evil-collection
      :after evil
      :ensure t
      :config
      (evil-collection-init))

    (use-package evil-avy
      :after evil
      :ensure t
      :config (evil-avy-mode))

    (use-package evil-multiedit
      :after evil
      :ensure t
      :config (evil-multiedit-default-keybinds)
      )
    ;; (use-package evil-iedit
    ;;   :after (evil iedit)
    ;;   :ensure t)

    (use-package evil-magit
      :ensure t
      :after (evil magit)))


(provide 'mine-evil)
