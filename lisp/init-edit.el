;; join lines
(global-set-key (kbd "C-c J") 'join-line)
(global-set-key (kbd "C-c j") (lambda () (interactive) (join-line 1)))


(provide 'init-edit)
