
; look in ~/.emacs.d/lisp for custom lisp modules
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa)

; load packages
(use-package monokai-theme
    :ensure t)

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
