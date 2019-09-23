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

;; turn options on
(setq LaTeX-electric-left-right-brace t)
(add-hook 'plain-TeX-mode-hook
	  (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
			  (cons "$" "$"))))
(add-hook 'LaTeX-mode-hook
	  (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
;;			  (cons "\\(" "\\)"))))
			  (cons "$" "$"))))


;; add flyspell mode
;; (add-hook 'LaTeX-mode-hook #'turn-on-flyspell)
(mapc (lambda (mode)
      (add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
	    #'turn-on-flyspell))

(add-hook 'LaTeX-mode-hook (lambda () (set-fill-column 80)))

;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(require-package 'auctex-latexmk)
(auctex-latexmk-setup)
;; pass the -pdf flag when TeX-PDF-mode is active
(setq auctex-latexmk-inherit-TeX-PDF-mode t)
;; SyncTeX on
'(TeX-source-correlate-mode t)

;; (add-hook 'LaTeX-mode-hook (lambda ()
;;   (push
;;     '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
;;       :help "Run latexmk on file")
;;     TeX-command-list)))
;; (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; $pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';
;; $pdf_previewer = 'open -a skim';
;; $clean_ext = 'bbl rel %R-blx.bib %R.synctex.gz';

(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("PDF Tools" TeX-pdf-tools-sync-view)
	("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))
;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
	  #'TeX-revert-document-buffer)


(defadvice LaTeX-fill-region-as-paragraph (around LaTeX-sentence-filling)
  "Start each sentence on a new line."
  (let ((from (ad-get-arg 0))
        (to-marker (set-marker (make-marker) (ad-get-arg 1)))
        tmp-end)
    (while (< from (marker-position to-marker))
      (forward-sentence)
      ;; might have gone beyond to-marker --- use whichever is smaller:
      (ad-set-arg 1 (setq tmp-end (min (point) (marker-position to-marker))))
      ad-do-it
      (ad-set-arg 0 (setq from (point)))
      (unless (or
               (bolp)
               (looking-at "\\s *$"))
        (LaTeX-newline)))
    (set-marker to-marker nil)))
(ad-activate 'LaTeX-fill-region-as-paragraph)


(provide 'init-auctex)
