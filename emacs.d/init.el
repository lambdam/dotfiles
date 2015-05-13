(require 'package)

;; Packages
;; ========

(defvar dam-packages
  '(auto-complete
    cider
    clojure-mode
    emmet-mode
    evil
    fill-column-indicator
    flx
    flx-ido
    fuzzy
    git-gutter+
    haskell-mode
    helm
    highlight-parentheses
    ido-ubiquitous
    ido-vertical-mode
    magit
    markdown-mode
    monokai-theme
    multiple-cursors
    neotree
    projectile
    rainbow-delimiters
    ruby-mode
    smex
    smooth-scroll
    smooth-scrolling
    undo-tree)
  "Dam packages")

;; On a freshly installed Emacs: `M-x` -> `dam-install-packages`
(defun dam-install-packages ()
  "Installs packages used in this configuration"
  (interactive)
  (condition-case nil
      (progn
        (package-initialize)
        (message "%s" "Refreshing packages")
        (package-refresh-contents)
        (message "%s" " Done")
        (mapc
         (lambda (package)
           (or (package-installed-p package)
               (package-install package)))
         dam-packages))
    (error
     (message "%s" "Error on packages installation"))))


;; Emacs configuration
;; ===================

;; Set up load path
;; (add-to-list 'load-path user-emacs-directory t)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(package-initialize)
(load custom-file)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please
(setq inhibit-startup-message t)

;; Auto revert (~ reload modified files)
(global-auto-revert-mode t)

;; Display line number
(global-linum-mode t)

;; (setq linum-format "%d")
;; (setq linum-format "%4d \u2502 ")

;; Display line number
;; (setq column-number-mode t)

(load-library "iso-transl")

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Font size
(set-face-attribute 'default nil :height 130)

;; disable ring bell
(setq ring-bell-function 'ignore)

;; UTF-8 default encoding
(prefer-coding-system 'utf-8)

;; Exec Path
;; http://stackoverflow.com/questions/13671839/cant-launch-lein-repl-in-emacs
;; Suggestion:
;; (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
;; (setq exec-path (append exec-path '("/usr/local/bin")))
;; But this simpler option works
(add-to-list 'exec-path "/usr/local/bin")

;; General keybindings
;; ===================

;; For Mac OS rebind meta to function key
(when (eq system-type 'darwin)
  ;; (setq mac-function-modifier 'meta)
  ;; (setq mac-option-modifier 'none))
  (setq mac-left-option-modifier 'meta)
  (setq mac-right-option-modifier 'none)
  (setq ns-use-native-fullscreen nil)
  (global-set-key [f9] 'toggle-frame-fullscreen)
  )

;; Linux specific
(when (or
       (eq system-type 'gnu)
       (eq system-type 'gnu/linux))
  (global-set-key [f11] 'fullscreen-mode-fullscreen-toggle)
  (global-set-key (kbd "<menu>") 'smex))

;; Move cursor easily between windows
(global-set-key (kbd "<M-s-left>") 'windmove-left)
(global-set-key (kbd "<M-s-right>") 'windmove-right)
(global-set-key (kbd "<M-s-up>") 'windmove-up)
(global-set-key (kbd "<M-s-down>") 'windmove-down)

;; Resize windows
(global-set-key (kbd "<C-S-up>") 'shrink-window)
(global-set-key (kbd "<C-S-down>") 'enlarge-window)
(global-set-key (kbd "<C-S-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-S-right>") 'enlarge-window-horizontally)

;; Fill Column
(setq-default fill-column 80)
(setq auto-fill-mode 1)

;; General installed modes
;; =======================

;; Evil mode
;; ---------

(evil-mode 1)

;; Rainbow delimiters
;; ------------------

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; IDO
;; ---

(require 'ido)
(require 'ido-ubiquitous)
(require 'flx-ido)
(require 'ido-vertical-mode)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)
(ido-mode +1)
(ido-ubiquitous-mode +1)
(ido-vertical-mode +1)

;; SMEX
;; ----

(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Smooth scrolling
;; ----------------

(require 'smooth-scrolling)
;; (setq scroll-step 1)
;; (setq scroll-conservatively 1000)
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
;; (setq mouse-wheel-progressive-speed nil)
;; (setq mouse-wheel-follow-mouse t)

;; Nice scrolling
(setq
 scroll-margin 0
 scroll-conservatively 100000
 scroll-preserve-screen-position 1)

;; Smooth scroll
;; -------------

(require 'smooth-scroll)
(smooth-scroll-mode 'toggle)

;; Autocomplete
;; ------------

(require 'auto-complete)
(ac-flyspell-workaround)
(ac-linum-workaround)
(global-auto-complete-mode t)

;; Multiple cursors
;; ----------------

(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Dired plus
;; ----------

;; (toggle-diredp-find-file-reuse-dir 1)

;; Ibuffer
;; -------

;; Use Ibuffer instead of Buffer List
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; ECB
;; ---

(setq ecb-tip-of-the-day nil)

;; Git gutter plus
;; ---------------

(add-hook 'prog-mode-hook 'git-gutter+-mode)
;; (eval-after-load 'git-gutter+
;;   '(require git-gutter-fringe+))


;; Neotree
;; -------

(global-set-key [f8] 'neotree-toggle)


;; Fill Column Indicator
;; ---------------------

;; (add-hook 'prog-mode-hook 'fci-mode)


;; Language modes
;; ==============

;; Clojure / ClojureScript
;; -----------------------

(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
(add-hook 'clojure-mode-hook 'highlight-parentheses-mode)

;; Haskell
;; -------

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))

;; Haskell bindings
;; (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
;; (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
;; (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
;; (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
;; (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;; (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;; (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
;; (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

;; Cabal bindings
;; (define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
;; (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;; (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;; (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)

;; Ruby
;; ----

(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))

;; Web
;; ---

;; Javascript
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-hook 'js-mode-hook 'js2-minor-mode)
;; (add-hook 'js2-mode-hook 'ac-js2-mode)
;; HTML and templates
;; (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
;; (add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
;; (setq web-mode-engines-alist '(("underscore" . "\\.tpl\\'")) )
