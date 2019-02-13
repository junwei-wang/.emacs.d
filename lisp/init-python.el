;; python

;; https://realpython.com/emacs-the-best-python-editor/

(require-package 'elpy)
(elpy-enable)
(setq python-shell-completion-native-enable nil)

(require-package 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(provide 'init-python)
