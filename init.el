;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (version<= emacs-version "25")
  (error "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; add the loading path
;; we put all our elisp scripts under fold "lisp"
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; disable the welcome frame
(setq inhibit-startup-screen t)

;; set the position and size of the frame
(when window-system
  (set-frame-position (selected-frame) 500 0)
  (set-frame-size (selected-frame) 200 100))

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

;; install missing package
(package-initialize)
(require 'init-elpa)

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

