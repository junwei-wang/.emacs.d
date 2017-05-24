(require-package 'magit)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c g") 'magit-dispatch-popup)

(provide 'init-git)
