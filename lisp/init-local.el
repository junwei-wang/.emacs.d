;; set the position and size of the frame
(when window-system
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 165 65))


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

;; find file at point
(global-set-key (kbd "C-x f") 'find-file-at-point)

;; set tex path
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH") ":/Library/TeX/texbin/"))
(setq exec-path (append exec-path '("/Library/TeX/texbin/" "/usr/local/bin/")))


;; set env
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")


(provide 'init-local)
