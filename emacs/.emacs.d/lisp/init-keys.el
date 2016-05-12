
(defun my-select-next ()
    (interactive)
    (if (region-active-p)
        (call-interactively 'mc/mark-next-like-this)
        (call-interactively 'er/expand-region) ;; mark the word that the cursor's in
    )
)


;; global keymappings
;; I don't want any of these overriden by major modes

(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))

    (define-key map (kbd "C-z")        'undo-tree-undo) ; act like every other program. also, don't run (suspend-frame)
    (define-key map (kbd "M-z")        'undo-tree-redo)
    (define-key map (kbd "C-S-z")      'undo-tree-visualize)
    ;(define-key map (kbd "TAB")        'tab-to-tab-stop) ; force the tab key to always indent. Don't try to be smart
    ;(define-key map (kbd "<backspace>") 'backspace-whitespace-to-tab-stop)
    ;(define-key map (kbd "<M-backspace>") 'backward-kill-word) ; prevent my terminal motor memory from killing buffers
    (define-key map (kbd "C-l")        'my-select-line)
    (define-key map (kbd "C-c C-c")    'kill-ring-save) ; copy
    (define-key map (kbd "C-v")        'yank) ; paste
    (define-key map (kbd "M-DEL")      'kill-this-buffer)

    ; (define-key map (kbd "<C-home>")   'recenter-top-bottom) ;; moves things to center/top/bottom of screen
    (define-key map (kbd "<C-home>")   'beginning-of-buffer)
    (define-key map (kbd "<C-end>")    'end-of-buffer)
    (define-key map (kbd "<C-prior>")  'tabbar-backward-tab)
    (define-key map (kbd "<C-next>")   'tabbar-forward-tab)

    (define-key map (kbd "M-x")        'helm-M-x)
    (define-key map (kbd "M-SPC")      'ranger)
    (define-key map (kbd "C-M-SPC")    'helm-mini)

    (define-key map (kbd "C-d")        'my-select-next)
    (define-key map (kbd "C-S-l")      'mc/edit-lines)

    (define-key map (kbd "<C-S-up>")   'move-text-up)
    (define-key map (kbd "<C-S-down>") 'move-text-down)

    (define-key map (kbd "C-a")        'er/expand-region)
    (define-key map (kbd "M-a")        'er/contract-region)

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
