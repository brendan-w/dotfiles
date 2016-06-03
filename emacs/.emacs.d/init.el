
;; look in ~/.emacs.d/lisp for custom lisp modules
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; ---------------- builtin stuff ----------------

(setq make-backup-files nil) ;; filename~   might be a bad idea, we'll see...
(setq auto-save-default nil) ;; #filename#
(setq inhibit-startup-message t) ;; disable the startup message
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse t) ;; scroll window under mouse
(setq scroll-error-top-bottom t) ;; make pgUP and pgDOWN move the cursor when it pegs at EOF
(setq-default indicate-empty-lines t) ;; similar to vim's tildes
(modify-all-frames-parameters (list (cons 'cursor-type 'bar)))
(setq-default scroll-conservatively 1) ;; don't scroll by whole pages
(setq-default scroll-margin 10) ;; keep the cursor N lines from the ends of the window
(setq ring-bell-function 'ignore) ;; be quite

;; indentation
(setq-default indent-tabs-mode nil) ;; only use spaces for tabs
(setq-default tab-width 4) ;; the width of actual TAB characters
(setq c-basic-offset 4) ;; indentation step for C mode
(setq c-default-style "bsd") ;; Allman style

;; show me whitespace
(setq whitespace-style '(face tabs spaces trailing space-before-tab indentation space-after-tab space-mark tab-mark))
(global-whitespace-mode 1)

(tool-bar-mode 0) ;; hide the gui toolbar
(menu-bar-mode 0) ;; hide the menu bar
; (global-linum-mode 1) ;; display line numbers
(line-number-mode 1) ;; show the line and column number in the modeline
(column-number-mode 1)
;(blink-cursor-mode 0) ;; DON'T blink the cursor
(electric-pair-mode) ;; auto close parens/quotes (apparently, this is ok in Emacs >= 24.4)
(setq show-paren-delay 0) ;; highlight matching parens instantaneously
(show-paren-mode 1) ;; highlight the matching paren, bracket, or brace
(delete-selection-mode 1) ;; delete/replace the selection what I start typing in a region
(desktop-save-mode 1) ;; save buffer layout/open file list in ~/.emacs.d/.emacs.desktop
(set-face-attribute 'default nil :height 100) ;; default font size to 10pt

;; initialize my window management keys
(require 'init-wm)

;; bring in some of my util functions/keys
(require 'init-utils)


;; ---------------- packaged stuff ----------------

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
    (setq helm-buffers-fuzzy-matching t)
    (setq helm-split-window-in-side-p t) ;; keep helm inside the current window/frame
)

(use-package expand-region
    :ensure t)

(use-package multiple-cursors
    :ensure t)

(use-package move-text
    :ensure t)

;; auto completion
(use-package company
    :ensure t
    :config
    (global-company-mode 1)
    (setq company-idle-delay 0.1)
    (setq company-minumum-prefix-length 2))

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

(use-package tabbar
    :ensure t
    :config
    (tabbar-mode 1)
    (setq tabbar-buffer-groups-function (lambda ()
        (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
            ((eq major-mode 'dired-mode) "emacs")
            (t "user"))))
    )
)

(use-package popwin
    :ensure t
    :config
    (popwin-mode 1)
)

(use-package clean-aindent-mode
    :ensure t
    :config
    (clean-aindent-mode 1)
    (set 'clean-aindent-is-simple-indent t)
)

(use-package window-numbering
    :ensure t
    :config
    (window-numbering-mode 1)
)

(use-package undo-tree
    :ensure t
    :config
    (global-undo-tree-mode 1)
)

(use-package markdown-mode
    :ensure t
)

(use-package fish-mode
    :ensure t
)


;; ---------------- hooks ----------------

(add-hook 'prog-mode-hook (lambda ()
    (toggle-truncate-lines 1) ; don't wrap lines when I'm coding
))

(add-hook 'text-mode-hook (lambda ()
    (toggle-truncate-lines 0) ; wrap lines
    (toggle-word-wrap 1) ; wrap on word boundries
))

;; since HTML is mostly textual content, enable word wrapping
(add-hook 'web-mode-hook (lambda ()
    (toggle-truncate-lines 0) ; wrap lines
    (toggle-word-wrap 1) ; wrap on word boundries
))


;; load my key bindings as a minor mode, to prevent major modes
;; from overriding them.
(require 'init-keys)
