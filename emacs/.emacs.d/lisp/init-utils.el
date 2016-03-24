
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


;; make the backspace key delete whitespace to the next tab stop

(defvar my-offset 4 "My indentation offset. ")

(defun backspace-whitespace-to-tab-stop ()
  "Delete whitespace backwards to the next tab-stop, otherwise delete one character."
  (interactive)
  (if (or indent-tabs-mode
          (region-active-p)
          (save-excursion
            (> (point) (progn (back-to-indentation)
                              (point)))))
      (call-interactively 'backward-delete-char-untabify)
    (let ((movement (% (current-column) my-offset))
          (p (point)))
      (when (= movement 0) (setq movement my-offset))
      ;; Account for edge case near beginning of buffer
      (setq movement (min (- p 1) movement))
      (save-match-data
        (if (string-match "[^\t ]*\\([\t ]+\\)$" (buffer-substring-no-properties (- p movement) p))
            (backward-delete-char (- (match-end 1) (match-beginning 1)))
          (call-interactively 'backward-delete-char))))))


(provide 'init-utils)
