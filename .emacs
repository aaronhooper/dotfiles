;; -*- mode: elisp -*-

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	           t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-capture-pop-frame markdown-mode geiser racket-mode slime))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun uncomment-region (beg end)
  "Like `comment-region' invoked with a C-u prefix arg."
  (interactive "r")
  (comment-region beg end -1))

;; Better defaults
(add-to-list 'load-path "./.emacs.d/better-defaults")
(require 'better-defaults)

;; Enable line numbers
(global-display-line-numbers-mode)


;;;; ORG MODE CONFIG

(require 'org)

;; Make Org mode work on file extension
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))


;;;; KEYBINDS

;; Duplicate line
(defun duplicate-line ()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))
(global-set-key (kbd "C-c <down>") 'duplicate-line)
