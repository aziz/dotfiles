;;; mac-key-mode.el --- provide mac-style key bindings on Carbon Emacs

;; Copyright (C) 2004-2010  Seiji Zenitani

;; Author: Seiji Zenitani <zenitani@mac.com>
;; $Id$
;; Keywords: tools, mac
;; Created: 2004-12-27
;; Compatibility: Mac OS X 10.5 (Carbon Emacs)
;; URL(jp): http://macwiki.sourceforge.jp/wiki/index.php/MacKeyMode
;; URL(en): http://www.emacswiki.org/cgi-bin/emacs-en/MacKeyMode

;; Contributors: Tetsuro Kurita, Nozomu Ando, Dave Peck

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; This package provides mac-key-mode, a minor mode that provides
;; mac-like key bindings and relevant elisp functions.
;;
;; To use this package, add these lines to your .emacs file:
;;
;; ;;    (require 'redo+)
;;     (require 'mac-key-mode)
;;     (mac-key-mode 1)
;;
;; Note that mac-key-mode requires redo+.el.
;; In order to set additional key bindings,
;; modify mac-key-mode-map in your .emacs file:
;;
;;     (require 'mac-key-mode)
;;     (define-key mac-key-mode-map [(alt l)] 'goto-line)
;;
;; When mac-key-mode is on, command key is recognized as 'alt' key,
;; but option (alt) key is also recognized as 'alt' key.
;; If you would like to use option (alt) key as meta key,
;; add the below line to your .emacs.el.
;;
;; (add-hook 'mac-key-mode-hook
;;        (lambda()
;;          (interactive)
;;          (if mac-key-mode
;;              (setq mac-option-modifier 'meta)
;;              (setq mac-option-modifier nil)
;;              )))
;;
;; Mac-key-mode takes advantage of additional functions, provided by
;; the mac-functions.patch <http://homepage.mac.com/zenitani/comp-e.html>.
;; (e.g. mac-spotlight-search, mac-spotlight-search etc.)


;;; Code:

;; requires redo+
(require 'redo+)

(defgroup mac-key-mode nil
  "Mac-style key-binding mode."
  :group 'mac
  :version "22.3")
(defconst mac-key-mode-lighter
  (char-to-string 343416) ;; the command mark
;;  (char-to-string 323935) ;; the Apple mark
;;  (char-to-string (ucs-to-char 63743)) ;; the Apple mark
  "A lighter string which is displayed in the modeline
when `mac-key-mode' is on.")

(defcustom mac-key-mode-hook nil
  "The hook to run when mac-key-mode is toggled."
  :type 'hook
  :group 'mac-key-mode)

(defcustom mac-key-advanced-setting t
  "If non-nil, `mac-key-mode' activates addional settings:
1) menu items are added to the File menu and the Edit menu, and
2) the SPC key invokes Quick Look information in dired-mode."
  :group 'mac-key-mode
  :type 'boolean)

(defvar mac-key-backup-command-modifier nil
  "Internal variable.  Do not use this.")


;; process objects
(defvar mac-key-speech-process nil
  "The process object for text-to-speech subprocess.")
(defvar mac-key-ql-process nil
  "The process object for Quick Look subprocess.")


(defvar mac-key-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map [(alt o)] (lambda()(interactive)(let(last-nonmenu-event)(menu-find-file-existing))))
    (define-key map [(alt w)] 'mac-key-close-window)
    (define-key map [(alt s)] 'save-buffer)
    (define-key map [(alt shift s)] 'mac-key-save-as)
    (define-key map [(alt i)] 'mac-key-show-in-finder)
    (define-key map [(alt p)] 'print-buffer)
    (define-key map [(alt q)] 'save-buffers-kill-emacs)
    (define-key map [(alt z)] 'undo)
    (define-key map [(alt shift z)] 'redo) ; requires redo+
    (define-key map [(alt x)] 'clipboard-kill-region)
    (define-key map [(alt c)] 'clipboard-kill-ring-save)
    (define-key map [(alt v)] 'clipboard-yank)
    (define-key map [(alt a)] 'mark-whole-buffer)
    (define-key map [(alt f)] 'isearch-forward)
    (define-key map [(alt meta f)] 'occur)
    (define-key map [(alt g)] 'isearch-repeat-forward)
    (define-key map [(alt shift g)] 'isearch-repeat-backward)
    (define-key map [(alt l)] 'goto-line)
    (define-key map [(alt t)] 'mac-font-panel-mode)
    (define-key map [(alt m)] 'iconify-frame)
    (define-key map [(alt \`)] 'other-frame)
    (define-key map [(alt shift n)] 'make-frame-command)
    (define-key map [(alt shift w)] 'delete-frame)
    (define-key map [(alt \?)] 'info)
    (define-key map [(alt /)] 'info)
    (define-key map [(alt .)] 'keyboard-quit)
    (define-key map [(alt up)] 'beginning-of-buffer)
    (define-key map [(alt down)] 'end-of-buffer)
    (define-key map [(alt left)] 'beginning-of-line)
    (define-key map [(alt right)] 'end-of-line)
    (define-key map [A-mouse-1] 'browse-url-at-mouse)
    (define-key map [C-down-mouse-1] 'mac-key-context-menu)
    (define-key map [mouse-3] 'mac-key-context-menu)
;;    (define-key map [C-mouse-1] 'mac-key-context-menu)
    (define-key map [A-S-mouse-1] 'mouse-buffer-menu)
    (define-key map [S-down-mouse-1] 'mac-key-shift-mouse-select)

    map)
  "Keymap for `mac-key-mode'.")

;; mode-line menu
(define-key-after mode-line-mode-menu [mac-key-mode]
  `(menu-item ,(purecopy
                (concat "Mac Key (" mac-key-mode-lighter ")"))
              mac-key-mode :button (:toggle . mac-key-mode))
  'highlight-changes-mode)

;;;###autoload
(define-minor-mode mac-key-mode
  "Toggle Mac Key mode.
With arg, turn Mac Key mode on if arg is positive.
When Mac Key mode is enabled, mac-style key bindings are provided."
  :global t
  :group 'mac-key-mode
  :lighter (" " mac-key-mode-lighter)
  :keymap 'mac-key-mode-map
  (if mac-key-mode
      (progn

        (setq mac-key-backup-command-modifier mac-command-modifier)
        (setq mac-command-modifier 'alt)
        (if (boundp 'mac-key-mode-internal)
            (setq mac-key-mode-internal t))

        ;; turn on advanced settings
        (when mac-key-advanced-setting

          ;; menu items
          (define-key-after menu-bar-file-menu [mac-key-file-separator]
            '("--" . nil) 'recover-session)
          (define-key-after menu-bar-file-menu [mac-key-show-in-finder]
            '(menu-item "Show In Finder" mac-key-show-in-finder
              :help "Display current file/directory in a Finder window"
              :enable (or (and (boundp 'buffer-file-name) buffer-file-name)
                          (and (boundp 'dired-directory) dired-directory)))
            'mac-key-file-separator)
          (define-key-after menu-bar-file-menu [mac-key-open-terminal]
            '(menu-item "Open Terminal" mac-key-open-terminal
              :help "Launch Terminal.app and go to the relevant directory")
            'mac-key-show-in-finder)
          (define-key-after menu-bar-edit-menu [redo]
            '(menu-item "Redo" redo
            :help "Redo the most recent undo"
            :enable (not (or (eq buffer-undo-list t)
                             (eq last-buffer-undo-list nil)
                             ;; ** one more thing here **
                             (eq buffer-undo-list pending-undo-list)
                             (eq (cdr buffer-undo-list) pending-undo-list)
                             )))
            'undo)
          (define-key-after menu-bar-edit-menu [mac-key-edit-separator]
            '("--" . nil) 'redo)

          ;; assign mac-key-quick-look to the SPC key
          (if (boundp 'dired-mode-map)
              (define-key dired-mode-map " " 'mac-key-quick-look)
            (add-hook 'dired-mode-hook
                      (lambda () (interactive)
                        (define-key dired-mode-map " " 'mac-key-quick-look)))
            )

          ))
    (progn

      (setq mac-command-modifier mac-key-backup-command-modifier)
      (if (boundp 'mac-key-mode-internal)
          (setq mac-key-mode-internal nil))

      ;; turn off advanced settings
      (when mac-key-advanced-setting

        ;; menu items
        (global-unset-key [menu-bar file mac-key-file-separator])
        (global-unset-key [menu-bar file mac-key-show-in-finder])
        (global-unset-key [menu-bar file mac-key-open-terminal])
        (global-unset-key [menu-bar edit redo])
        (global-unset-key [menu-bar edit mac-key-edit-separator])

        ;; restore SPC to dired-next-line (a bad way to deal with it)
        (if (boundp 'dired-mode-map)
            (define-key dired-mode-map " " 'dired-next-line))
        (remove-hook 'dired-mode-hook
                     (lambda () (interactive)
                       (define-key dired-mode-map " " 'mac-key-quick-look)))

        ))
    ))


;; close window (command + W)
(defun mac-key-close-window ()
  "Close the Quick Look window or kill the current buffer."
  (interactive)
  (let ((mybuffer (and mac-key-ql-process
                       (process-buffer mac-key-ql-process))))
    (if (buffer-live-p mybuffer)
        (kill-buffer mybuffer)
      (kill-this-buffer))
    ))

;; save as.. dialog (shift + command + S)
(defun mac-key-save-as (filename &optional wildcards)
  "Write current buffer to another file using standard file open dialog."
  (interactive
   (let (last-nonmenu-event)
     (find-file-read-args "Write file: " nil)))
   (write-file filename))


;; utf8 code by Ando-san
(defun mac-key-applescript-utf8data (str)
  (let ((len (length str))
        (len1 31) ;XXX: 254/2/4. utf-8 is 4byte per code point at most.
        (reslist '(")"))
        pos epos)
    (setq pos len)
    (while (> pos 0)
      (setq epos pos)
      (setq pos (max (- pos len1) 0))
      (setq reslist (cons " & (\307data utf8"
                          (cons (mapconcat (lambda (ch) (format "%02X" ch))
                                           (encode-coding-string
                                            (substring str pos epos)
                                            'utf-8) "")
                                (cons "\310 as Unicode text)"
                                      reslist)))))
    (apply 'concat "(\"\"" reslist)))


;; Show In Finder (command + I)

(defun mac-key-show-in-finder (&optional path)
  "Display current file/directory in a Finder window"
  (interactive)
  (let ((item (or path
                  (and (boundp 'buffer-file-name) buffer-file-name)
                  (and (eq major-mode 'dired-mode) default-directory)) ))

    (cond
     ((not (stringp item)))
     ((file-remote-p item)
      (error "This item is located on a remote system."))
     (t
      (setq item (expand-file-name item))
      (condition-case err
          (progn
            (do-applescript
             (concat
              "tell application \"Finder\" to select ("
              (mac-key-applescript-utf8data item)
              " as POSIX file)"))
            (if (fboundp 'mac-process-activate)
                (mac-process-activate "com.apple.finder")
              (do-applescript "tell application \"Finder\" to activate"))
            )
        (error err)))

     )))


;; Open Terminal.app

(defun mac-key-open-terminal (&optional path)
  "Launch Terminal and go to the relevant directory"
  (interactive)
  (let ((item (or path default-directory)))

    (cond
     ((not (stringp item)))
     ((file-remote-p item)
      (error "This item is located on a remote system."))
     ((file-directory-p item)
      (setq item (expand-file-name item))
      (condition-case err
          (progn
            (do-applescript
             (concat "tell application \"Terminal\" to do script"
                     " with command \"cd \" & quoted form of "
                     (mac-key-applescript-utf8data item)))
            (if (fboundp 'mac-process-activate)
                (mac-process-activate "com.apple.Terminal")
              (do-applescript "tell application \"Terminal\" to activate"))
            )
        (error err))
      )
     (t (error "An error occured"))
     )))


;; Text-to-Speech functions

(defun mac-key-speak-buffer ()
  "Speak buffer contents."
  (interactive)
  (mac-key-speak-region (point-min)(point-max)))

(defun mac-key-speak-region (beg end)
  "Speak the region contents."
  (interactive "r")
  (mac-key-stop-speaking)
  (let ((buffer-file-coding-system 'utf-8-unix)
        (tmp-file (make-temp-file "emacs-speech-" nil ".txt")))
    (write-region beg end tmp-file nil)
    (message "Invoking text-to-speech...")
    (setq mac-key-speech-process
          (start-process "text-to-speech" "*Text-to-Speech Output*"
                         "/usr/bin/say" "-f" tmp-file))
    ))

(defun mac-key-stop-speaking ()
  "Terminate the text-to-speech subprocess, if it is running."
  (interactive)
  (let ((mybuffer (and mac-key-speech-process
                       (process-buffer mac-key-speech-process))))
    (when (buffer-live-p mybuffer)
      (kill-buffer mybuffer)
      (beep))
    ))


;; Quick Look
;; inspired by http://journal.mycom.co.jp/column/osx/263/index.html

(defun mac-key-quick-look ()
  "Display the Quick Look information for the current line's file.
You might use dired-mode-hook to use this function in dired mode,
like this:

    \(add-hook 'dired-mode-hook
       (lambda() (local-set-key \" \" 'mac-key-quick-look)))
"
  (interactive)
  
  (let ((mybuffer (and mac-key-ql-process
                       (process-buffer mac-key-ql-process)))
        (item default-directory))
    (cond
     ((buffer-live-p mybuffer)
      (kill-buffer mybuffer))
;;       (eq (process-status mac-key-ql-process) 'run)
;;       (kill-process mac-key-ql-process))
     ((file-remote-p item)
      (error "This item is located on a remote system."))
     (t
      (setq item (expand-file-name item))
      (condition-case err
          (setq item (dired-get-file-for-visit))
        (error err))
      (condition-case err
          (setq mac-key-ql-process
                (start-process "quicklook" "*QuickLook Output*"
                               "/usr/bin/qlmanage" "-p"
                               (shell-quote-argument item)))
        (error err)))
     )))

;; shift+click
;; Contributed by Dave Peck

(defun mac-key-shift-mouse-select (event)
  "Set the mark and then move point to the position clicked on with
the mouse.  This should be bound to a mouse click event type."
  (interactive "e")
  (mouse-minibuffer-check event)
  (if mark-active (exchange-point-and-mark))
  (set-mark-command nil)
  ;; Use event-end in case called from mouse-drag-region.
  ;; If EVENT is a click, event-end and event-start give same value.
  (posn-set-point (event-end event)))


;; Contextual menu

(defun mac-key-context-menu (event)
  "Pop up a contextual menu."
  (interactive "e")

  (let ((editable (not buffer-read-only))
        (pt (save-excursion (mouse-set-point last-nonmenu-event)))
        beg end
        )

    ;; getting word boundaries
    (if (and mark-active
             (<= (region-beginning) pt) (<= pt (region-end)) )
        (setq beg (region-beginning)
              end (region-end))
      (save-excursion
        (goto-char pt)
        (setq end (progn (forward-word) (point)))
        (setq beg (progn (backward-word) (point)))
        ))

    ;; popup menu
    (popup-menu
     '(nil
       ["Search in Spotlight"
        (mac-spotlight-search (buffer-substring-no-properties beg end))
        :active (fboundp 'mac-spotlight-search)
        :help "Do a Spotlight search of word at cursor"]
       ["Search in Google"
        (browse-url
         (concat "http://www.google.com/search?q="
                 (url-hexify-string (buffer-substring-no-properties beg end))))
        :help "Ask a WWW browser to do a Google search"]
     ["--" nil]
     ["Look Up in Dictionary"
      (browse-url
       (concat "dict:///"
               (url-hexify-string (buffer-substring-no-properties beg end))))
      :active t
      :help "Look up word at cursor in Dictionary.app"]
     ["--" nil]
     ["Cut"   (clipboard-kill-region beg end) :active (and editable mark-active)
      :help "Delete text in region and copy it to the clipboard"]
     ["Copy"  (clipboard-kill-ring-save beg end) :active mark-active
      :help "Copy text in region to the clipboard"]
     ["Paste" (clipboard-yank) :active editable
      :help "Paste text from clipboard"]
     ["--" nil]
     ("Spelling"
      ["Spelling..."
       (progn (goto-char end)(ispell-word)) :active editable
       :help "Spell-check word at cursor"]
      ["Check Spelling" (ispell-buffer) :active editable
       :help "Check spelling of the current buffer"]
      ["Check Spelling as You Type"
       (flyspell-mode)
       :style toggle :selected flyspell-mode :active editable
       :help "Check spelling while you edit the text"]
     )
     ("Font"
      ["Show Fonts" (ignore) :active nil]
      ["Bold"       (ignore) :active nil]
      ["Italic"     (ignore) :active nil]
      ["Underline"  (ignore) :active nil]
      ["Outline"    (ignore) :active nil]
      ["Styles..."  (ignore) :active nil]
      ["--" nil]
      ["Show Colors" (ignore) :active nil]
     )
     ("Speech"
      ["Start Speaking"
       (if (and mark-active
                (<= (region-beginning) pt) (<= pt (region-end)) )
           (mac-key-speak-region beg end)
         (mac-key-speak-buffer) )
       :help "Speak text through the sound output"]
      ["Stop Speaking" (mac-key-stop-speaking)
       :active (and mac-key-speech-process
                    (eq (process-status mac-key-speech-process) 'run))
       :help "Stop speaking"]
     )
     ["--" nil]
     ["Buffers" mouse-buffer-menu
       :help "Pop up a menu of buffers for selection with the mouse"]
     ))))


(provide 'mac-key-mode)

;;; mac-key-mode.el ends here.
