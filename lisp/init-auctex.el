;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; configurations for auctex
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require-package 'auctex)
(require 'tex)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;; add flyspell mode
(add-hook 'LaTeX-mode-hook #'turn-on-flyspell)

(mapc (lambda (mode)
      (add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
	    #'turn-on-flyspell))

(provide 'init-auctex)
