;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; configurations for c-ide
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require-package 'use-package)
(require-package 'undo-tree)
(require-package 'anzu)
(require-package 'dtrt-indent)
(require-package 'volatile-highlights)
(require-package 'counsel-projectile)
(require-package 'clean-aindent-mode)
(require-package 'company)
(require-package 'ws-butler)
(require-package 'yasnippet)

(setq use-package-always-ensure t)

(require 'c-ide-setup-general)
(require 'c-ide-setup-cedet)
(require 'c-ide-setup-editing)


(provide 'init-c-ide)
