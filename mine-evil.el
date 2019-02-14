;; a couple of helpers

(defun switch-to-scratch-buffer ()
    "Switch to the scratch buffer"
    (interactive)
    (switch-to-buffer "*scratch*"))

(defun switch-to-dashboard-buffer ()
    "Switch to the dashboard buffer"
    (interactive)
    (switch-to-buffer "*dashboard*"))

;; load evil
(setq evil-want-integration nil)
(use-package evil
    :ensure t ;; install the evil package if not installed
    :diminish
    :init ;; tweak evil's configuration before loading it
    (setq evil-search-module 'evil-search)
    (setq evil-ex-complete-emacs-commands nil)
    (setq evil-vsplit-window-right t)
    (setq evil-split-window-below t)
    (setq evil-shift-round nil)
    (setq evil-want-C-u-scroll t)
    (setq evil-want-Y-yank-to-eol t)

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
        "g b" 'magit-blame

	;; buffer prefix
	"b b" 'helm-mini
	"b s" 'switch-to-scratch-buffer
        "b k" 'kill-buffer

	;; files prefix
	"f f" 'helm-find-files
	"f j" 'dired-jump
	"f r" 'ranger

	;; help prefix
	"h k" 'describe-key
	"h f" 'describe-function
        "h v" 'describe-variable
        "h i" 'info
        "h b" 'describe-bindings
        "h a" 'apropos
        "h m" 'describe-mode

	;; comment/code/compile prefix
	"c l" 'evil-commentary-line
	"c d" 'comment-dwim
        "c n" 'next-error
        "c p" 'previous-error

	;; jump prefix
	"j j" 'avy-goto-char
	"j t" 'avy-goto-char-timer

	;; lisp prefix
	"l f" 'load-file
        "l s" 'eval-last-sexp
        "l e" 'eval-expression
        "l d" 'eval-defun

        ;; global org prefix (capture and friends)
        "o c" 'org-capture
        "o a" 'org-agenda
        "o s" 'org-schedule

	;; projectile prefix
	"p f" 'helm-projectile-find-file
	"p p" 'helm-projectile-switch-project
	"p i" 'projectile-invalidate-cache

	;; search prefix
	"s f" 'helm-do-ag
	"s p" 'helm-do-ag-project-root
	"s b" 'helm-do-ag-buffers
	"s s" 'helm-swoop
        "s m" 'helm-multi-swoop-projectile

	;; general toggles
	"t t" 'helm-themes
        "t n" 'global-linum-mode
        "t g" 'golden-ratio

        ;; variable prefix
        "v k" 'string-inflection-kebab-case
        "v j" 'string-inflection-camelcase
        "v c" 'string-inflection-lower-camelcase
        "v p" 'string-inflection-underscore

        ;; window prefix
        "w l" 'evil-window-right
        "w L" 'evil-window-move-far-right
        "w h" 'evil-window-left
        "w H" 'evil-window-move-far-left
        "w s" 'evil-split-buffer
        "w v" 'evil-window-vsplit
	
	;; general prefix
	"SPC" 'helm-M-x
        "\\" 'switch-to-dashboard-buffer
        ":" 'eval-expression
        ))

    :config ;; tweak evil after loading it
    (evil-mode)

    (defun evil-window-up-and-resize ()
      "Calls evil-window-up and subsuquently golden-ratio"
      (interactive)
      (evil-window-up 1)
      (golden-ratio))
    
    (defun evil-window-down-and-resize ()
      "Calls evil-window-down and subsuquently golden-ratio"
      (interactive)
      (evil-window-down 1)
      (golden-ratio))

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
    (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)


    (define-key evil-motion-state-map "\t" nil)


    (use-package evil-escape
      :ensure t
      :diminish
      :config
      (setq-default evil-escape-key-sequence "jk")
      (setq-default evil-escape-unordered-key-sequence t)
      (evil-escape-mode))

    (use-package evil-surround
      :ensure t
      :config
      (global-evil-surround-mode))

    (use-package evil-commentary
      :diminish
      :ensure t
      :after evil
      :config (evil-commentary-mode))

    (use-package evil-matchit
      :ensure t
      :after evil
      :config (global-evil-matchit-mode))

    (use-package evil-collection
      :after evil
      :ensure t
      :config
      (setq evil-want-keybinding nil)
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
      :after (evil magit))

    (use-package evil-org
      :ensure t
      :after org
      :config
      (add-hook 'org-mode-hook 'evil-org-mode
                (lambda () evil-org-set-key-theme))
      (require 'evil-org-agenda)
      (evil-org-agenda-set-keys)))


(provide 'mine-evil)
