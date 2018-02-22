(when (maybe-require-package 'dimmer)
  (setq-default dimmer-fraction 0.1)
  (add-hook 'after-init-hook 'dimmer-mode))


(provide 'init-theme)
