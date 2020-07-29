;; python

;; https://realpython.com/emacs-the-best-python-editor/

(require-package 'elpy)
(elpy-enable)

(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")
(setq python-shell-completion-native-enable nil)

(require-package 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'elpy-mode-hook (lambda () (set-fill-column 100)))

(provide 'init-python)
