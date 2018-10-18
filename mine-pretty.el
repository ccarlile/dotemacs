;; Rice
(use-package zenburn-theme
  :ensure t
  :init
  ;; (load-theme 'zenburn t)
  )

(use-package helm-themes
  :ensure t)

(use-package solarized-theme
  :ensure t)

(use-package color-theme-sanityinc-tomorrow
  :ensure t)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark)) ;; assuming you are using a dark theme
;; (setq ns-use-proxy-icon nil)
;; (setq frame-title-format nil)

;; the best way I've found is to just call golden-ratio
;; (use-package golden-ratio
;;   :ensure t
;;   :diminish "🏆"
;;   :init
;;   (golden-ratio-mode 1))

(setq ring-bell-function 'ignore)

;; (use-package zoom
;;   :ensure t
;;   :config
;;   (custom-set-variables
;;    '(zoom-mode t)))

(set-face-attribute 'default nil :font  "Hasklig-12")
(set-frame-font "Hasklig-10" nil t)

(use-package ranger
  :ensure t)


(use-package smart-mode-line
  :ensure t
  :config
  (sml/setup)
  (setq mode-line-format
        (list mode-line-front-space mode-line-modified mode-line-buffer-identification sml/pos-id-separator mode-line-position vc-mode sml/pos-id-separator mode-line-modes mode-line-misc-info mode-line-end-spaces)))

;; My modeline

(diminish 'undo-tree-mode)
(diminish 'auto-revert-mode)

(use-package fontawesome
  :ensure t
  :diminish)

(use-package octicons
  :ensure t
  :diminish)

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "I believe in you!")
  (setq dashboard-startup-banner "~/emacs/lilbub.png")
  (setq dashboard-items '((recents . 10)
                          (projects . 10)))
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

(use-package centered-window
  :ensure t)


(provide 'mine-pretty)

