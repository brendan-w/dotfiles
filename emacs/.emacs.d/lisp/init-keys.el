
(defun eval-python-in-place ()
  "runs the current region as a python command, and inserts the result"
  (interactive)
  (setq code (format
"from random import *
from math import *
print((%s), end=\"\")
" (buffer-substring (mark) (point))))
  (setq result (shell-command-to-string (format "python3 -c '%s'" code)))
  (call-interactively 'delete-region)
  (insert result)
)

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer t t)
)

(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
        (revert-buffer t t t)
      )
    )
  )
  (message "Refreshed open files.")
)

(defun my-select-line ()
    (interactive)
    ;; if there's no selection, start one
    (if (not mark-active)
        (set-mark (line-beginning-position))
    )
    (next-logical-line)
    (beginning-of-line)
)

(defun my-select-next ()
    (interactive)
    (if (region-active-p)
        (call-interactively 'mc/mark-next-like-this)
        (call-interactively 'er/expand-region) ;; mark the word that the cursor's in
    )
)

(defun my-empty-line ()
    (interactive)
    (kill-whole-line)
    (newline)
)

(defun my-duplicate-line()
  (interactive)
  (beginning-of-line)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line)
  (yank)
  (beginning-of-line)
)

(defun my-helm-find-files-navigate-forward (orig-fun &rest args)
  (if (file-directory-p (helm-get-selection))
      (apply orig-fun args)
      (helm-maybe-exit-minibuffer)
  )
)

(defun my-helm-find-files-navigate-back (orig-fun &rest args)
  (if (= (length helm-pattern) (length (helm-find-files-initial-input)))
      (helm-find-files-up-one-level 1)
      (apply orig-fun args)
  )
)

;; Helm keybindings
(advice-add 'helm-execute-persistent-action :around #'my-helm-find-files-navigate-forward)
(advice-add 'helm-ff-delete-char-backward :around #'my-helm-find-files-navigate-back)
(define-key helm-find-files-map (kbd "<return>") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "<tab>") 'helm-execute-persistent-action)

;; global keymappings
;; I don't want any of these overriden by major modes

(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))

    (define-key map (kbd "C-z")        'undo-tree-undo) ; act like every other program. also, don't run (suspend-frame)
    (define-key map (kbd "C-S-z")      'undo-tree-redo)
    (define-key map (kbd "M-z")        'undo-tree-visualize)
    (define-key map (kbd "C-l")        'my-select-line)
    (define-key map (kbd "C-c C-c")    'kill-ring-save) ; copy
    (define-key map (kbd "C-x C-x")    'kill-region) ; cut
    (define-key map (kbd "C-v")        'yank) ; paste
    (define-key map (kbd "C-k")        'kill-whole-line)
    (define-key map (kbd "M-k")        'my-empty-line)
    (define-key map (kbd "C-S-d")      'my-duplicate-line)
    (define-key map (kbd "C-/")        'comment-line)
    (define-key map (kbd "M-RET")      'eval-python-in-place)

    (define-key map (kbd "<C-home>")   'beginning-of-buffer)
    (define-key map (kbd "<C-end>")    'end-of-buffer)
    (define-key map (kbd "<C-prior>")  'tabbar-backward-tab)
    (define-key map (kbd "<C-next>")   'tabbar-forward-tab)
    (define-key map (kbd "M-DEL")      'kill-this-buffer)

    (define-key map (kbd "M-x")        'helm-M-x)
    (define-key map (kbd "M-SPC")      'helm-find-files)
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
