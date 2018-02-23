;; join lines
(global-set-key (kbd "C-c J") 'join-line)
(global-set-key (kbd "C-c j") (lambda () (interactive) (join-line 1)))

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

(provide 'init-edit)
