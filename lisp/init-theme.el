(require-package 'ample-theme)
;; load theme
(load-theme 'ample t t)
(load-theme 'ample-flat t t)
(load-theme 'ample-light t t)
(enable-theme 'ample-flat)

;; dimmer mode
(when (maybe-require-package 'dimmer)
  (setq-default dimmer-fraction 0.5)
  (add-hook 'after-init-hook 'dimmer-mode))


(provide 'init-theme)
