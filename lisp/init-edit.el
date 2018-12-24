;; join lines
(global-set-key (kbd "C-c J") 'join-line)
(global-set-key (kbd "C-c j") (lambda () (interactive) (join-line 1)))

;; resize window keys
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; auto add newline at the end of the file
(setq require-final-newline "visit")

;; change backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )

;; auto delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; always set linum-mode
(global-linum-mode 1)
(set-face-foreground 'linum "yellow")
(add-hook 'after-change-major-mode-hook
	  '(lambda ()
	     (linum-mode (if (or
			      (equal major-mode 'doc-view-mode)
			      (equal major-mode 'eshell-mode)
			      (equal major-mode 'help-mode)
			      (equal major-mode 'magit-log-mode)
			      (equal major-mode 'magit-popup-mode)
			      (equal major-mode 'magit-revision-mode)
			      (equal major-mode 'magit-status-mode)
			      (equal major-mode 'term-mode)
			      (equal major-mode 'TeX-output-mode)
			      )
			     0 1))))


(provide 'init-edit)
