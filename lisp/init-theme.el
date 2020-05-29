;; load theme AMPLE
;; (require-package 'ample-theme)
;; (load-theme 'ample t t)
;; (load-theme 'ample-flat t t)
;; (load-theme 'ample-light t t)
;; (enable-theme 'ample-flat)

;; ;; dimmer mode
;; (when (maybe-require-package 'dimmer)
;;   (setq-default dimmer-fraction 0.5)
;;   (add-hook 'after-init-hook 'dimmer-mode))

;; load theme DRACULA
;; (require-package 'dracula-theme)
;; (load-theme 'dracula t)

;; load theme NIMBUS
;; (require-package 'nimbus-theme)
;; (load-theme 'nimbus t)

;; load theme Nord
(require-package 'nord-theme)
(load-theme 'nord t)

;; status bar
;; (require-package 'ergoemacs-status)
;; (ergoemacs-status-mode)

(provide 'init-theme)
