
; disable the startup message
(setq inhibit-startup-message t)

; look in ~/.emacs.d/lisp for custom lisp modules
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa)

; load packages

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


(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(tool-bar-mode -1) ;; hide the gui toolbar

;; use M-<arrow> to change focus between visible buffers
(require 'windmove)
(windmove-default-keybindings 'meta)

(global-linum-mode) ;; display line numbers
(global-hl-line-mode) ;; highlight the current line
(blink-cursor-mode 0) ;; DON'T blink the cursor
