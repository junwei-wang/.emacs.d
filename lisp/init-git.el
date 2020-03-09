(require-package 'magit)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c g") 'magit-dispatch-popup)

(require-package 'magit-todos)

(provide 'init-git)
