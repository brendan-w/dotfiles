
;; ---------------- builtin stuff----------------

(setq inhibit-startup-message t) ;; disable the startup message
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(tool-bar-mode -1) ;; hide the gui toolbar
(global-linum-mode) ;; display line numbers
(global-hl-line-mode) ;; highlight the current line
(blink-cursor-mode 0) ;; DON'T blink the cursor

(require 'windmove) ;; use M-<arrow> to change focus between visible buffers
(windmove-default-keybindings 'meta)

(global-set-key (kbd "C-z") 'undo) ; act like every other program. also, don't run (suspend-frame)

;; window handling (splitting/deleting)
;; TODO: move window focus in the correct direction
(global-set-key (kbd "<C-M-up>") 'split-window-vertically)
(global-set-key (kbd "<C-M-down>") 'split-window-vertically)
(global-set-key (kbd "<C-M-left>") 'split-window-horizontally)
(global-set-key (kbd "<C-M-right>") 'split-window-horizontally)
(global-set-key (kbd "<C-M-delete>") 'delete-window)


;; ---------------- packaged stuff----------------

;; look in ~/.emacs.d/lisp for custom lisp modules
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

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
    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this))


