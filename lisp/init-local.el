;; set the position and size of the frame
(when window-system
  (set-frame-position (selected-frame) 500 0)
  (set-frame-size (selected-frame) 190 60))

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
