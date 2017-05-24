;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; configurations for auctex
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require-package 'auctex)
(require 'tex)

;; parsing the document
(setq TeX-auto-save t)
(setq TeX-parse-self t)
;; set master document nil
(setq-default TeX-master nil)

;; add flyspell mode
(add-hook 'LaTeX-mode-hook #'turn-on-flyspell)

(mapc (lambda (mode)
      (add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
	    #'turn-on-flyspell))

(provide 'init-auctex)
