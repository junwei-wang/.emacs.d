(require-package 'sage-shell-mode)

;; Run SageMath by M-x run-sage instead of M-x sage-shell:run-sage
(sage-shell:define-alias)

;; Turn on eldoc-mode in Sage terminal and in Sage source files
(add-hook 'sage-shell-mode-hook #'eldoc-mode)
(add-hook 'sage-shell:sage-mode-hook #'eldoc-mode)

;; disable elpy-mode in Sage source files
(add-hook 'sage-shell:sage-mode-hook (lambda () (elpy-mode -1)))

(add-hook 'sage-shell:sage-mode-hook
	  (lambda () (local-set-key (kbd "C-c C-e") 'sage-shell-edit:send-buffer-and-go)))


(setq sage-shell:use-prompt-toolkit t)


(provide 'init-sage)
