(when (maybe-require-package 'markdown-mode)
  (after-load 'whitespace-cleanup-mode
    (push 'markdown-mode whitespace-cleanup-mode-ignore-modes)))

(setq markdown-enable-math t)

(mapc (lambda (mode)
      (add-hook 'markdown-mode-hook mode))
      (list 'auto-fill-mode
	    #'turn-on-flyspell))

(add-hook 'markdown-mode-hook
          (lambda ()
            (set-fill-column 120)))

(provide 'init-markdown)
