
;; global keymappings
;; I don't want any of these overriden by major modes

(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))

    (define-key map (kbd "C-z")        'undo) ; act like every other program. also, don't run (suspend-frame)
    (define-key map (kbd "<C-home>")   'recenter-top-bottom) ;; moves things to center/top/bottom of screen
    (define-key map (kbd "TAB")        'tab-to-tab-stop) ;; force the tab key to always indent. Don't try to be smart
    (define-key map (kbd "C-l")        'my-select-line)

    (define-key map (kbd "M-x")        'helm-M-x)
    (define-key map (kbd "M-SPC")      'helm-mini)
    (define-key map (kbd "C-M-SPC")    'helm-projectile-find-file)

    (define-key map (kbd "C-d")        'mc/mark-next-like-this)
    (define-key map (kbd "C-S-l")      'mc/edit-lines)

    (define-key map (kbd "<C-S-up>")   'move-text-up)
    (define-key map (kbd "<C-S-down>") 'move-text-down)

    (define-key map (kbd "C-=")        'er/expand-region)

    map)
  "my-keys-minor-mode keymap.")


(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter " my-keys")



;; activate this minor mode for everything but the minibuffer

(my-keys-minor-mode 1)

(add-hook 'minibuffer-setup-hook (lambda ()
    (my-keys-minor-mode 0)
))

(provide 'init-keys)
