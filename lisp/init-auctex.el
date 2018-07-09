;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; configurations for auctex
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require-package 'auctex)

(require 'tex)
(require 'latex)
(require 'tex-site)
(require 'tex-mik)


;; parsing the document
(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; set master document nil
(setq-default TeX-master nil)

;; auto insert paired $, quote, etc
(add-hook 'plain-TeX-mode-hook
	  (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
			  (cons "$" "$"))))
(add-hook 'LaTeX-mode-hook
	  (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
			  (cons "$" "$"))))
(setq  LaTeX-electric-left-right-brace t)
(setq TeX-quote-after-quote t)

;;
(add-hook 'LaTeX-mode-hook (lambda () (set-fill-column 80)))
(setq LaTeX-fill-break-at-separators '(\\\( \\\[))


;; add flyspell mode
;; (add-hook 'LaTeX-mode-hook #'turn-on-flyspell)
(mapc (lambda (mode)
	(add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
	    #'turn-on-flyspell))

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method 'synctex)

(cond
   ((eq system-type 'windows-nt)
     (setq TeX-view-program-list '(("SumatraPDF" ("SumatraPDF.exe -reuse-instance" (mode-io-correlate " -forward-search %b %n ") " %o"))))
     (eval-after-load 'tex
       '(progn
	  (assq-delete-all 'output-pdf TeX-view-program-selection)
	  (add-to-list 'TeX-view-program-selection '(output-pdf "SumatraPDF"))))
     )
   ((eq system-type 'gnu/linux)
    (setq server-auth-dir "~/.emacs.d/server/")))


(provide 'init-auctex)
