
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
  :config
  (global-set-key (kbd "M-x") 'helm-M-x))

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(tool-bar-mode -1) ;; hide the gui toolbar

;; use M-<arrow> to change focus between visible buffers
(require 'windmove)
(windmove-default-keybindings 'meta)
