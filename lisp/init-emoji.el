
(if (version< "27.0" emacs-version)
    (set-fontset-font
     "fontset-default" 'unicode "Apple Color Emoji" nil 'prepend)
  (set-fontset-font
   t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend))


;; github style emoji input
(require-package 'company-emoji)
(require-package 'company)
(require-package 'use-package)
(use-package company
  :config
  (add-to-list 'company-backends 'company-emoji))

(provide 'init-emoji)
