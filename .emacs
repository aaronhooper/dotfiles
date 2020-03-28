;;;;;;;;;;;;;;;;;;
;; PACKAGE INIT ;;
;;;;;;;;;;;;;;;;;;

(package-initialize)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	           t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d362eed16f74bfa8e49df0185a9336184d479e120c41837a5e6f020e0336bf7f" default)))
 '(org-agenda-files
   (quote
    ("~/org/calendar.org" "~/org/inbox.org" "~/org/someday.org" "~/org/next.org")))
 '(package-selected-packages
   (quote
    (magit dracula-theme org-capture-pop-frame markdown-mode geiser racket-mode slime))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;;;;;;;;;;;;;;;;
;; DEFINITIONS ;;
;;;;;;;;;;;;;;;;;

;; Load better defaults
(add-to-list 'load-path "~/.emacs.d/better-defaults")
(require 'better-defaults)

;; Load org-mode
(require 'org)

(defun duplicate-line ()
  "Move to beginning of line, kill and yank back, open a new line
and yank back again."
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(defun uncomment-region (beg end)
  "Like `comment-region' invoked with a C-u prefix arg."
  (interactive "r")
  (comment-region beg end -1))

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


;;;;;;;;;;;;;;
;; KEYBINDS ;;
;;;;;;;;;;;;;;

;; Remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

;; Remap C-return to `newline'
(global-set-key (kbd "C-<return>") 'newline)

;; Remap C-c c to org-capture
(global-set-key (kbd "C-c c") 'org-capture)

;; Remap C-c a to org-agenda
(global-set-key (kbd "C-c a") 'org-agenda)

;; Remap C-, to cycle agenda files (should be already bound but it's
;; not for some reason)
(global-set-key (kbd "C-,") 'org-cycle-agenda-files)

;; Remap M-n and M-p to move by lines
;; (global-set-key (kbd "M-n") 'next-line)
;; (global-set-key (kbd "M-p") 'previous-line)

;; Remap C-c down to `duplicate-line'
;; (global-set-key (kbd "C-c <down>") 'duplicate-line)


;;;;;;;;;;;;
;; CONFIG ;;
;;;;;;;;;;;;

;; Hide blank lines between org mode headings
(setq org-cycle-separator-lines 0)

;; Set custom org mode todo cycle states
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "DOING(o)" "|" "DONE(d)" "CANCELLED(c)")))

;; Set custom state colors
(setq org-todo-keyword-faces
      '(("NEXT" . (:foreground "sky blue" :weight bold))
        ("DOING" . (:foreground "orange" :weight bold))
        ("WAITING" . (:foreground "OrangeRed" :weight bold))
        ("CANCELLED" . (:foreground "SlateGray4" :weight normal))))

;; Start org mode files folded
(setq org-startup-folded t)

;; block setting parent to done if it's children are not all done
(setq org-enforce-todo-dependencies t)

;; Suppress welcome screen
(setq inhibit-startup-screen t)

;; Set custom org-capture templates
(setq org-capture-templates '(("i" "Inbox" plain (file+headline "inbox.org" "Inbox"))
                              ("n" "Next Actions" entry (file+headline "next.org" "Next Actions")
                               "* NEXT %c")
                              ("s" "Someday/Maybe" entry (file+headline "someday.org" "Someday/Maybe")
                               "* %c")
                              ("c" "Calendar" entry (file+headline "calendar.org" "Calendar")
                               "* %c")
                              ("p" "Projects" entry (file+headline "next.org" "Projects")
                               "* %c")))

;; Set refile targets (so captures can be refiled under individual
;; projects)
(setq org-refile-targets '(("next.org" :maxlevel . 2)))

;; Enable line numbers
(global-display-line-numbers-mode)

;; Use dracula theme
(load-theme 'dracula)

;; Make org mode work on .org extension
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Enable ido mode (should be enabled in better defaults, but it
;; isn't, for some reason...)
(ido-mode t)

;; Enable upcase-region
(put 'upcase-region 'disabled nil)

;; Open org-agenda on Emacs startup
;(add-hook 'after-init-hook 'org-agenda-list)
