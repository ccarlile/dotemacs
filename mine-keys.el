;; Set major mode keys
(require 'evil-leader)

(defun mine-lisp-keys ()
  "Major mode bindings for .el."
      (evil-leader/set-key
	;; git prefix
	"m f" 'load-file
	"m s" 'eval-last-sexp))

(add-hook 'emacs-list-mode-hook 'mine-lisp-keys)

(provide 'mine-keys)
