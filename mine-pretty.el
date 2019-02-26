;; I spend a lot of time here and I want it to look good dangit

(defun mine-reset-modeline-faces ()
  "Set all face attributes to something moody can handle."
 (let ((line (face-attribute 'mode-line :underline)))
   (set-face-attribute 'mode-line          nil :overline   line)
   (set-face-attribute 'mode-line-inactive nil :overline   line)
   (set-face-attribute 'mode-line-inactive nil :underline  line)
   (set-face-attribute 'mode-line          nil :box        nil)
   (set-face-attribute 'mode-line-inactive nil :box        line)
   (set-face-attribute 'mode-line-inactive nil :background (face-attribute 'default :background))))

(defvar after-load-theme-hook nil
  "Hook run after a color theme is loaded using `load-theme'.")

(defadvice load-theme (after run-after-load-theme-hook activate)
  "Run `after-load-theme-hook'."
  (run-hooks 'after-load-theme-hook))

(add-hook 'after-load-theme-hook 'mine-reset-modeline-faces)

;; (use-package zenburn-theme)

(use-package helm-themes)

(use-package doom-themes)

;; (use-package solarized-theme)

;; (use-package color-theme-sanityinc-tomorrow)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark)) ;; assuming you are using a dark theme

(setq ring-bell-function 'ignore)

(set-face-attribute 'default nil :font  "Hasklig-14")
(set-frame-font "Hasklig-10" nil t)

(use-package ranger)

;; (use-package smart-mode-line
;;   
;;   :config
;;   (sml/setup)
;;   (setq mode-line-format
;;         (list mode-line-front-space mode-line-modified mode-line-buffer-identification sml/pos-id-separator mode-line-position vc-mode sml/pos-id-separator mode-line-modes mode-line-misc-info mode-line-end-spaces)))

(use-package moody
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

(use-package minions
  :config (minions-mode 1))

(diminish 'undo-tree-mode)
(diminish 'auto-revert-mode)
  
(use-package fontawesome
  :diminish)
  
(use-package octicons
  :diminish)
  
(use-package dashboard
  :config
  (setq dashboard-banner-logo-title "I believe in you!")
  (setq dashboard-startup-banner "~/emacs/lilbub.png")
  (setq dashboard-items '((recents . 10)
                          (projects . 10)
                          (agenda . 10)))
  (dashboard-setup-startup-hook))

;; LIGATURES BABY
(defun my-correct-symbol-bounds (pretty-alist)
  "Prepend a TAB character to each symbol in this alist,
this way compose-region called by prettify-symbols-mode
will use the correct width of the symbols
instead of the width measured by char-width."
  (mapcar (lambda (el)
            (setcdr el (string ?\t (cdr el)))
            el)
          pretty-alist))

(defun my-ligature-list (ligatures codepoint-start)
  "Create an alist of strings to replace with
codepoints starting from codepoint-start."
  (let ((codepoints (-iterate '1+ codepoint-start (length ligatures))))
    (-zip-pair ligatures codepoints)))

; list can be found at https://github.com/i-tu/Hasklig/blob/master/GlyphOrderAndAliasDB#L1588
(setq my-hasklig-ligatures
      (let* ((ligs '("&&" "***" "*>" "\\\\" "||" "|>" "::"
                     "==" "===" "==>" "=>" "=<<" "!!" ">>"
                     ">>=" ">>>" ">>-" ">-" "->" "-<" "-<<"
                     "<*" "<*>" "<|" "<|>" "<$>" "<>" "<-"
                     "<<" "<<<" "<+>" ".." "..." "++" "+++"
                     "/=" ":::" ">=>" "->>" "<=>" "<=<" "<->")))
        (my-correct-symbol-bounds (my-ligature-list ligs #Xe100))))

;; nice glyphs for haskell with hasklig
(defun my-set-hasklig-ligatures ()
  "Add hasklig ligatures for use with prettify-symbols-mode."
  (setq prettify-symbols-alist
        (append my-hasklig-ligatures prettify-symbols-alist))
  (prettify-symbols-mode))

(add-hook 'scala-mode-hook 'my-set-hasklig-ligatures)
(add-hook 'haskell-mode-hook 'my-set-hasklig-ligatures)

(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)
(use-package centered-window)


(provide 'mine-pretty)

