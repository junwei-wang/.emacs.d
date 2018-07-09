;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (version<= emacs-version "25")
  (error "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; add the loading path
;; we put all our elisp scripts under fold "lisp"
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "emacswiki" user-emacs-directory))

;; fill column width
;; buffer local variable
(setq-default fill-column 80)
(require 'fill-column-indicator)
(setq fci-rule-color "darkblue")
;; enable fci-mode globally
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)


;; disable the welcome frame
(setq inhibit-startup-screen t)

;; change font size
(set-face-attribute 'default nil :font "Lucida Console-13" )
(setq-default line-spacing 3)

;; constants
(defconst *enabled-spell-check* t)
(defconst *is-a-mac* (eq system-type 'darwin))

;; disable GC while startup
(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))

;; benchmaring for loading
(require 'init-benchmarking)

;; add utilities
(require 'init-utils)
(require 'init-edit)

;; install missing package
(package-initialize)
(require 'init-elpa)

(require 'init-auctex)
(require 'init-auto-complete)
(require 'init-dired)
(require 'init-flyspell)
(require 'init-git)
(require 'init-ibuffer)
(require 'init-ivy)
(require 'init-json)
(require 'init-markdown)
(require 'init-octave)
(require 'init-python)
(require 'init-sage)
(require 'init-smex)
(require 'init-theme)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; local setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;
(require 'init-local)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; allow access from emacsclient
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'server)
(unless (server-running-p)
  (server-start))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load custome files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
(put 'set-goal-column 'disabled nil)
(put 'scroll-left 'disabled nil)
