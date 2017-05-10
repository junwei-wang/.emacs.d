;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (version<= emacs-version "25")
  (error "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; add the loading path
;; we put all our elisp scripts under fold "lisp"
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; fill column width
(setq-default fill-column 100)

;; disable the welcome frame
(setq inhibit-startup-screen t)

;; change font size
(set-face-attribute 'default nil :font "Monaco-16" )

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
(require 'init-ibuffer)
(require 'init-ivy)
(require 'init-octave)
(require 'init-smex)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; local setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
