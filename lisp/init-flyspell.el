;; Add spell-checking in comments for all programming language modes
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; (setq ispell-program-name "aspell")

(after-load 'flyspell
  (add-to-list 'flyspell-prog-text-faces 'nxml-text-face))

(setq ispell-program-name "hunspell")
(setq ispell-local-dictionary "en_US")
(setq ispell-local-dictionary-alist
      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil nil nil utf-8)))

(provide 'init-flyspell)
