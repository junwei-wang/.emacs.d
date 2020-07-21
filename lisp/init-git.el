(require-package 'magit)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c g") 'magit-dispatch-popup)

(require-package 'magit-todos)

;; diff-hl https://github.com/dgutov/diff-hl
(global-diff-hl-mode)
(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

(provide 'init-git)
