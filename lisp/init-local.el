;; always set linum-mode
(global-linum-mode 1)

;; save the cursor place
(save-place-mode 1)

;; duplicate line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key "\C-cd" 'duplicate-line)

(provide 'init-local)
