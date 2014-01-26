
;; Prevent the cursor from blinking
(blink-cursor-mode 0)

;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; Don't let Emacs hurt your ears
(setq visible-bell t)

;; Who use the bar to scroll?
(scroll-bar-mode 0)

;; Hide toolbar
(tool-bar-mode 0)

;; Mac Key Mode
(load-file "~/.emacs.d/vendors/redo+.el")
(load-file "~/.emacs.d/vendors/mac-key-mode.el")
(require 'mac-key-mode)
(mac-key-mode 1)

;; Custom color scheme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'spolsky t)

;; Custom font
;; default Latin font (e.g. Consolas)
(set-face-attribute 'default nil :family "Menlo")
;; default font size (point * 10)
(set-face-attribute 'default nil :height 130)
; (set-fontset-font t 'arabic (font-spec :name "DejaVu Sans Mono"))

; ------------------------
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'graphene)

(defun zc-farsi (&optional arg)
  "Switch to farsi input.
   Without arg does RTL/LTR determination automatically (e.g. - via the rules
   of the Unicode Bidirectional Algorithm). With arg forces RTL. Calling
   again toggles off bidi and farsi input."
  (interactive "P")
  (if bidi-display-reordering
          (progn
                (setq bidi-display-reordering nil)
                (inactivate-input-method))
        (setq bidi-display-reordering t)
        (if arg
                (setq bidi-paragraph-direction 'right-to-left)
          (setq bidi-paragraph-direction nil))
        (set-input-method 'farsi-isiri-9147)))

(global-set-key [(control c) (f)] 'zc-farsi)
(setq-default bidi-display-reordering t)

;; (require 'package)
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (package-initialize)
;; (require 'graphene)

;; You need to set `inhibit-startup-echo-area-message' from the
;; customization interface:
;; M-x customize-variable RET inhibit-startup-echo-area-message RET
;; then enter your username
;; (setq inhibit-startup-echo-area-message "guerry")

