
;; window management

(require 'windmove) ;; use M-<arrow> to change focus between visible buffers
(windmove-default-keybindings 'meta)

;; new windows are added on the lower/right,
;; so these directions leave the cursor in the correct spot
(global-set-key (kbd "<C-M-up>") 'split-window-vertically)
(global-set-key (kbd "<C-M-left>") 'split-window-horizontally)

(defun my-split-window-vertically ()
    (interactive)
    (split-window-vertically)
    (windmove-down)
)

(defun my-split-window-horizontally ()
    (interactive)
    (split-window-horizontally)
    (windmove-right)
)

;; these, however, need to move the cursor down or right
(global-set-key (kbd "<C-M-down>") 'my-split-window-vertically)
(global-set-key (kbd "<C-M-right>") 'my-split-window-horizontally)

;; window deletion
(global-set-key (kbd "<C-M-delete>") 'delete-window)

(provide 'init-wm)
