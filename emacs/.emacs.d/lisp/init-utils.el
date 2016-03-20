
;; line selection

(defun my-select-line ()
    (interactive)
    (end-of-line)
    (set-mark (line-beginning-position))
)

(global-set-key (kbd "C-l") 'my-select-line)

(provide 'init-utils)
