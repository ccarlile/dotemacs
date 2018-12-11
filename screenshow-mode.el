;;; screenshow-mode.el --- Display a visualization of the current buffer in another frame

;; Copyright (c) 2017 Jatan Patel
;;
;; Author: Jatan Patel <j@jatan.me>
;; URL: https://github.com/jjpatel/screenshow-mode
;; Package-Requires: ((dash "2.13.0") (emacs "24.4"))
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A global minor mode to display a visualization of the active buffer
;; in another frame.
;;
;; Enable screenshow-mode to create a frame.
;; This frame will always mimic the active buffer and point position of
;; other frames.

;;; Code:

(require 'dash)

(defgroup screenshow nil
  "Display a visualization of the current buffer in another frame."
  :group 'convenience)

(defvar screenshow-frame-hook '()
  "Hook run when the screenshow frame is created.
The functions are run with a single argument, the new frame created.")

(defvar screenshow-frame-no-minibuffer t
  "Whether to hide the minibuffer in the newly created frame.")

(defvar screenshow-ignore-buffer-list-regexp
  '("\\*Echo Area"
    "\\*Minibuf"
    "\\*Help\\*"
    "\\*helm"
    "\\*helm-mode")
  "A list of regexps matching buffers that will not be switched to in the
slave frame.")

(defvar screenshow--last-buffer nil
  "The last buffer of the master frame.")

(defvar screenshow--slave-frame nil
  "The frame that mimics all buffer movements of the master frame.")

(defvar screenshow--modified-variables '()
  "List of modified variables in the current buffer to pretend like the slave
frame is actually selected.")

(defun screenshow--restore-modified-variables ()
  (when (buffer-live-p screenshow--last-buffer)
    (with-current-buffer screenshow--last-buffer
      (dolist (var screenshow--modified-variables)
        (set (car var) (cdr var))))))

(defun screenshow--set-slave-window-buffer (master-buffer slave-window)
  (when (and (buffer-live-p master-buffer)
             (not (eq master-buffer screenshow--last-buffer)))
    (let ((modified-vars
           `((cursor-in-non-selected-windows . ,(if (eq cursor-type t)
                                                    (frame-parameter nil 'cursor-type)
                                                  cursor-type)))))
      (screenshow--restore-modified-variables)
      (setq screenshow--modified-variables
            (--map `(,(car it) . ,(symbol-value (car it))) modified-vars))
      (with-current-buffer master-buffer
        (dolist (var modified-vars)
          (set (car var) (cdr var))))
      (set-window-buffer slave-window master-buffer)
      (setq screenshow--last-buffer master-buffer))))

(defun screenshow--mimic-point ()
  "Attempt to mimic the current buffer and point position in the slave frame."
  (when (frame-live-p screenshow--slave-frame)
    (pcase real-this-command
      ('screenshow-mode nil)
      (_ (let ((slave-window (frame-first-window screenshow--slave-frame))
               (this-buffer (current-buffer)))
           (unless (string-match-p (mapconcat 'identity screenshow-ignore-buffer-list-regexp "\\|")
                                   (buffer-name this-buffer))
             (screenshow--set-slave-window-buffer this-buffer slave-window)
             (set-window-point slave-window (window-point))))))))

(defun screenshow--run-frame-hooks (frame)
  (when (frame-parameter frame 'screenshow-slave)
    (dolist (func screenshow-frame-hook)
      (funcall func frame))))

(defun screenshow--setup ()
  (add-hook 'after-make-frame-functions #'screenshow--run-frame-hooks)
  (setq screenshow--last-buffer nil)
  (setq screenshow--slave-frame (make-frame `((screenshow-slave . t)
                                               ,(when screenshow-frame-no-minibuffer
                                                  '(minibuffer . nil))
                                               (unsplittable . t))))
  (add-hook 'post-command-hook #'screenshow--mimic-point))

(defun screenshow--teardown ()
  (remove-hook 'after-make-frame-functions #'screenshow--run-frame-hooks)
  (remove-hook 'post-command-hook #'screenshow--mimic-point nil)
  (screenshow--restore-modified-variables)
  (when (frame-live-p screenshow--slave-frame)
    (delete-frame screenshow--slave-frame t)
    (setq screenshow--slave-frame nil))
  (setq screenshow--last-buffer nil))

(define-minor-mode screenshow-mode
  :init-value nil
  :keymap (make-sparse-keymap)
  :group 'screenshow
  :lighter " Screenshow"
  :global t
  (if (bound-and-true-p screenshow-mode)
      (screenshow--setup)
    (screenshow--teardown)))

(provide 'screenshow-mode)

;;; screenshow-mode.el ends here
