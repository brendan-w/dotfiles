
;; window management

(require 'windmove) ;; use M-<arrow> to change focus between visible buffers
(windmove-default-keybindings 'meta)

;; TODO: move window focus in the correct direction
(global-set-key (kbd "<C-M-up>") 'split-window-vertically)
(global-set-key (kbd "<C-M-down>") 'split-window-vertically)
(global-set-key (kbd "<C-M-left>") 'split-window-horizontally)
(global-set-key (kbd "<C-M-right>") 'split-window-horizontally)

(global-set-key (kbd "<C-M-delete>") 'delete-window)

(provide 'init-wm)
