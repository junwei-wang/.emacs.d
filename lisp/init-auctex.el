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
;; (add-hook 'LaTeX-mode-hook #'turn-on-flyspell)
(mapc (lambda (mode)
      (add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
	    #'turn-on-flyspell))

(add-hook 'LaTeX-mode-hook (lambda () (set-fill-column 100)))

;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)


;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; $pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';
;; $pdf_previewer = 'open -a skim';
;; $clean_ext = 'bbl rel %R-blx.bib %R.synctex.gz';

(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))


(provide 'init-auctex)
