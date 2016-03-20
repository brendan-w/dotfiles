
;; look in ~/.emacs.d/lisp for custom lisp modules
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; ---------------- builtin stuff----------------

(setq inhibit-startup-message t) ;; disable the startup message
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(tool-bar-mode -1) ;; hide the gui toolbar
(global-linum-mode) ;; display line numbers
(global-hl-line-mode) ;; highlight the current line
(blink-cursor-mode 0) ;; DON'T blink the cursor
(delete-selection-mode 1) ;; delete/replace the selection what I start typing in a region
(global-set-key (kbd "C-z") 'undo) ; act like every other program. also, don't run (suspend-frame)
(global-set-key (kbd "<C-home>") 'recenter-top-bottom) ;; moves things to center/top/bottom of screen

;; initialize my window management keys
(require 'init-wm)

;; bring in some of my util functions/keys
(require 'init-utils)


;; ---------------- packaged stuff----------------

(require 'init-elpa)

;; load packages

(use-package monokai-theme
    :ensure t
    :init
    (load-theme 'monokai t))

(use-package helm
  :ensure t
  :init
  (helm-mode 1)
  (helm-autoresize-mode 1)
  :config
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
