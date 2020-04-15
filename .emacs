;; ==============
;;  PACKAGE INIT

(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     t)


;; ==================
;;  CUSTOM VARIABLES

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "d362eed16f74bfa8e49df0185a9336184d479e120c41837a5e6f020e0336bf7f" default)))
 '(org-agenda-files
   (list
    (concat
     (file-name-as-directory org-directory)
     "gtd")))
 '(org-directory "~/Documents/org")
 '(package-selected-packages
   (quote
    (elpy markdown-mode haskell-mode better-defaults sublime-themes magit geiser racket-mode slime))))


;; ===========
;;  FUNCTIONS

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if
there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(defun lisp-sig ()
  "Insert a Lisp comment signature at point."
  (interactive)
  (let ((name "Aaron Hooper")
        (email "rnjckhpr@gmail.com"))
    (insert ";; " name " <" email ">\n"
            ";; " (format-time-string "%Y-%m-%d") "\n")))


;; ==============
;;  KEY BINDINGS

;; Remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; Remap C-return to `newline'
(global-set-key (kbd "C-<return>") 'newline)

;; Remap C-c c to `org-capture'
(global-set-key (kbd "C-c c") 'org-capture)

;; Remap C-c a to `org-agenda'
(global-set-key (kbd "C-c a") 'org-agenda)

;; Remap C-, to cycle agenda files
;; (should be already bound but it's not for some reason)
(global-set-key (kbd "C-,") 'org-cycle-agenda-files)

;; Remap C-c C-; to comment/uncomment
(global-set-key (kbd "C-c C-;") 'comment-or-uncomment-region-or-line)


;; ==========
;;  ORG-MODE

;; Hide blank lines between org mode headings
(setq org-cycle-separator-lines 0)

;; Set custom org mode todo cycle states
(setq org-todo-keywords
      '((sequence "NEXT(n)" "WAITING(w)" "DOING(o)" "|" "DONE(d)" "CANCELLED(c)")))

;; Set custom state colors
(setq org-todo-keyword-faces
      '(("NEXT" .      (:foreground "sky blue"   :weight bold))
        ("DOING" .     (:foreground "orange"     :weight bold))
        ("WAITING" .   (:foreground "OrangeRed"  :weight bold))
        ("CANCELLED" . (:foreground "SlateGray4" :weight normal))))

;; Start org mode files folded
(setq org-startup-folded t)

;; Block setting parent to DONE if it's children are not all DONE
(setq org-enforce-todo-dependencies t)

;; Set custom `org-capture' templates
(setq org-capture-templates
      '(("i" "Inbox" plain
         (file+headline "gtd/inbox.org" "Inbox"))
        ("n" "Next Actions" entry
         (file+headline "gtd/next.org" "Next Actions") "* NEXT %c")
        ("s" "Someday" entry
         (file+headline "gtd/someday-maybe.org" "Someday") "* %c")
        ("m" "Maybe" entry
         (file+headline "gtd/someday-maybe.org" "Maybe") "* %c")
        ("c" "Calendar" entry
         (file+headline "gtd/calendar.org" "Calendar") "* %c")
        ("p" "Projects" entry
         (file+headline "gtd/next.org" "Projects") "* %c")))

;; Set refile targets so that captures can be refiled under individual
;; projects
(setq org-refile-targets '(("gtd/next.org" :maxlevel . 3)))

;; Set babel supported languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (lisp . t)
   (emacs-lisp . t)))

;; Set python3 for babel
(setq org-babel-python-command "python3")

;; Larger latex fragments
(plist-put org-format-latex-options :scale 2.5)


;; ========
;;  CONFIG

;; Load `better-defaults'
(require 'better-defaults)

;; Allow `racket-mode' to activate upon opening .rkt files
(add-to-list 'auto-mode-alist '("\\.rkt" . racket-mode))

;; Enable line numbers
(global-display-line-numbers-mode 1)

;; Highlight trailing whitespace
(setq show-trailing-whitespace t)

;; Enable `upcase-region'
(put 'upcase-region 'disabled nil)

;; Set lisp implementation for SLIME
(setq inferior-lisp-program "sbcl")

;; Suppress welcome screen
(setq inhibit-startup-screen t)

;; Set font size
(set-face-attribute 'default nil :height 140)

;; If the window's width in chars is less than number, truncate lines
;; for windows narrower than the full frame width
(setq truncate-partial-width-windows 90)

;; Show column number in modeline
(column-number-mode 1)

;; Set python indent size
(setq python-indent-offset 4)

;; Allow frame to take up whole screen width & height
(setq frame-resize-pixelwise t)

;; Allow typing in a region to delete the region
(delete-selection-mode 1)

;; Load theme
(load-theme 'odersky t)


;; ==============
;;  CUSTOM FACES

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bold ((t (:foreground "pale turquoise" :weight bold))))
 '(ido-only-match ((t (:foreground "light green"))))
 '(ido-subdir ((t (:foreground "light sky blue"))))
 '(org-block ((t (:background "gray13"))))
 '(org-block-begin-line ((t (:inherit org-meta-line :background "gray15")))))

