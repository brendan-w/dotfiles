
;; look in ~/.emacs.d/lisp for custom lisp modules
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; ---------------- builtin stuff----------------

(setq make-backup-files nil) ;; filename~   might be a bad idea, we'll see...
(setq auto-save-default nil) ;; #filename#
(setq inhibit-startup-message t) ;; disable the startup message
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-error-top-bottom t) ;; make pgUP and pgDOWN move the cursor when it pegs at EOF

;; indentation
(setq-default indent-tabs-mode nil) ;; only use spaces for tabs
(setq tab-width 4) ;; the width of actual TAB characters
(setq c-basic-offset 4) ;; indentation step for C mode
(setq c-default-style "bsd") ;; Allman style

;; show me whitespace
(setq whitespace-style '(face indentation trailing))
(global-whitespace-mode 1)

(tool-bar-mode 0) ;; hide the gui toolbar
(menu-bar-mode 0) ;; hide the menu bar
(global-linum-mode 1) ;; display line numbers
(line-number-mode 1) ;; show the line and column number in the modeline
(column-number-mode 1)
(blink-cursor-mode 0) ;; DON'T blink the cursor
(electric-pair-mode) ;; auto close parens/quotes (apparently, this is ok in Emacs >= 24.4)
(delete-selection-mode 1) ;; delete/replace the selection what I start typing in a region
(global-set-key (kbd "C-z") 'undo) ; act like every other program. also, don't run (suspend-frame)
(global-set-key (kbd "<C-home>") 'recenter-top-bottom) ;; moves things to center/top/bottom of screen
(set-face-attribute 'default nil :height 100) ;; default font size to 10pt

;; initialize my window management keys
(require 'init-wm)

;; bring in some of my util functions/keys
(require 'init-utils)


;; ---------------- packaged stuff----------------

(require 'init-elpa)

;; load packages

(use-package monokai-theme
    :ensure t
    :config
    (load-theme 'monokai t))

(use-package helm
    :ensure t
    :config
    (helm-mode 1)
    (helm-autoresize-mode 1)
    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key (kbd "M-SPC") 'helm-mini)
    (setq helm-buffers-fuzzy-matching t)
    (setq helm-split-window-in-side-p t)) ;; keep helm inside the current window/frame

(use-package expand-region
    :ensure t
    :config
    (global-set-key (kbd "C-=") 'er/expand-region))

(use-package multiple-cursors
    :ensure t
    :config
    (global-set-key (kbd "C-d") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-S-l") 'mc/edit-lines))

(use-package move-text
    :ensure t
    :config
    (global-set-key (kbd "<C-S-up>") 'move-text-up)
    (global-set-key (kbd "<C-S-down>") 'move-text-down))

;; auto completion
(use-package company
    :ensure t
    :config
    (global-company-mode)
    (setq company-idle-delay 0))

(use-package projectile
    :ensure t
    :config
    (projectile-global-mode)
    (setq projectile-enable-caching t))

(use-package helm-projectile
    :ensure t
    :config
    (global-set-key (kbd "C-M-SPC") 'helm-projectile-find-file))

(use-package web-mode
    :ensure t
    :config
    (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
)
