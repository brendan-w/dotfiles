
;; line selection

(defun my-select-line ()
    (interactive)
    ;; if there's no selection, start one
    (if (not mark-active)
        (set-mark (line-beginning-position))
    )
    (next-line)
    (beginning-of-line)
)

(global-set-key (kbd "C-l") 'my-select-line)

(provide 'init-utils)
