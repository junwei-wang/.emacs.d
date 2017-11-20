;; set the position and size of the frame
(when window-system
  (set-frame-position (selected-frame) 00 0)
  (set-frame-size (selected-frame) 165 42))

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

;; find file at point
(global-set-key (kbd "C-x f") 'find-file-at-point)

;; Run SageMath by M-x run-sage instead of M-x sage-shell:run-sage
(sage-shell:define-alias)

;; Turn on eldoc-mode in Sage terminal and in Sage source files
(add-hook 'sage-shell-mode-hook #'eldoc-mode)
(add-hook 'sage-shell:sage-mode-hook #'eldoc-mode)

;; If you have Sage 7.4 or later, uncomment the following line.
(setq sage-shell:use-prompt-toolkit t)

;; set tex path
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/" ":/usr/local/bin/"))  
(setq exec-path (append exec-path '("/Library/TeX/texbin/" "/usr/local/bin/")))

(provide 'init-local)
