(defvar using-linux? (or (eq system-type 'gnu)
                         (eq system-type 'gnu/linux)))

(defvar using-mac? (eq system-type 'darwin))

(require 'package)

;; Packages
;; ========

(defvar dam-packages
  '(cider
    clj-refactor
    clojure-mode
    company
    emmet-mode
    evil
    exec-path-from-shell
    fill-column-indicator
    flx-ido
    fuzzy
    git-gutter
    haskell-mode
    helm
    helm-ag
    helm-git-grep
    highlight-parentheses
    ido-completing-read+
    ido-vertical-mode
    magit
    markdown-mode
    monokai-theme
    multiple-cursors
    neotree
    paredit
    projectile
    rainbow-delimiters
    ruby-mode
    smex
    undo-tree
    which-key)
  "Dam packages")

;; Emacs >= 24.4
(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(clojure-mode . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(evil . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(flx-ido . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(fuzzy . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(haskell-mode . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(helm . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(helm-ag . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(helm-git-grep . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(highlight-parentheses . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(ido-completing-read+ . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(ido-vertical-mode . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(magit . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(multiple-cursors . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(paredit . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(projectile . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(rainbow-delimiters . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(smex . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(which-key . "melpa-stable") t)

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

;; Fonts
;; http://ergoemacs.org/emacs/emacs_list_and_set_font.html
(cond
 (using-linux? (when (member "Fira Mono" (font-family-list))
                 (add-to-list 'initial-frame-alist '(font . "Fira Mono"))
                 (add-to-list 'default-frame-alist '(font . "Fira Mono")))))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(package-initialize)
;; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
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
;; (setq auto-save-default nil)
;; (setq make-backup-files nil)
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

;; case insensitive sorts
(setq-default sort-fold-case t)

;; General keybindings
;; ===================

;; For Mac OS rebind meta to function key
(when using-mac?
  ;; (setq mac-function-modifier 'meta)
  ;; (setq mac-option-modifier 'none))
  (setq mac-left-option-modifier 'meta)
  (setq mac-right-option-modifier 'none)
  (setq ns-use-native-fullscreen nil)
  (global-set-key [f9] 'toggle-frame-fullscreen))

;; Linux specific
(when using-linux?
  ;; (global-set-key [f11] 'fullscreen-mode-fullscreen-toggle)
  ;; (global-set-key (kbd "<menu>") 'smex)
  )

;; Move cursor easily between windows
(when using-mac?
  (global-set-key (kbd "<M-A-left>") 'windmove-left)
  (global-set-key (kbd "<M-A-right>") 'windmove-right)
  (global-set-key (kbd "<M-A-up>") 'windmove-up)
  (global-set-key (kbd "<M-A-down>") 'windmove-down))
(when using-linux?
  (global-set-key (kbd "<C-s-left>") 'windmove-left)
  (global-set-key (kbd "<C-s-right>") 'windmove-right)
  (global-set-key (kbd "<C-s-up>") 'windmove-up)
  (global-set-key (kbd "<C-s-down>") 'windmove-down))

;; Resize windows
(global-set-key (kbd "<C-S-up>") 'shrink-window)
(global-set-key (kbd "<C-S-down>") 'enlarge-window)
(global-set-key (kbd "<C-S-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-S-right>") 'enlarge-window-horizontally)

;; Fill Column
(setq-default fill-column 80)
(setq auto-fill-mode 1)

;; Downcase
(put 'downcase-region 'disabled nil)

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

(ido-mode 1)
(ido-everywhere 1)
(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)
(ido-vertical-mode 1)

;; (require 'ido)
;; (require 'ido-ubiquitous)
;; (require 'flx-ido)
;; (require 'ido-vertical-mode)


;; SMEX
;; ----

(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)


;; Nice scrolling
(setq
 scroll-margin 0
 scroll-conservatively 100000
 scroll-preserve-screen-position 1)


;; Company mode
;; ------------

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'company-mode-hook
          (lambda ()
            (define-key company-mode-map (kbd "<print>") 'company-complete)))


;; Multiple cursors
;; ----------------

(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; Ibuffer
;; -------

;; Use Ibuffer instead of Buffer List
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; Magit
;; -----

(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")


;; Neotree
;; -------

(global-set-key [f8] 'neotree-toggle)


;; Which-key
;; ---------

(require 'which-key)
(which-key-mode)


;; Org mode

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


;; Language modes
;; ==============

;; Emacs Lisp
;; ----------

(add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)


;; Clojure / ClojureScript
;; -----------------------

(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljx\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojurescript-mode))
(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.ram\\'" . clojure-mode))
(add-hook 'clojure-mode-hook 'highlight-parentheses-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)

;; https://github.com/bhauman/lein-figwheel/wiki/Using-the-Figwheel-REPL-within-NRepl#integration-with-emacscider
;; (require 'cider)
;; (setq cider-cljs-lein-repl
;;       "(do (require 'figwheel-sidecar.repl-api)
;;            (figwheel-sidecar.repl-api/start-figwheel!)
;;            (figwheel-sidecar.repl-api/cljs-repl))")

(require 'clj-refactor)
(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))
(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

(require 'cider)
(setq cider-repl-use-pretty-printing t)
(setq cider-cljs-lein-repl
      "(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel!)
           (figwheel-sidecar.repl-api/cljs-repl))")

;; Haskell
;; -------

;; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;; (custom-set-variables
;;   '(haskell-process-suggest-remove-import-lines t)
;;   '(haskell-process-auto-import-loaded-modules t)
;;   '(haskell-process-log t))

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


;; OCaml
;; -----

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
 (when (and opam-share (file-directory-p opam-share))
  (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
  (autoload 'merlin-mode "merlin" nil t nil)
  (add-hook 'tuareg-mode-hook 'merlin-mode t)
  (add-hook 'caml-mode-hook 'merlin-mode t)))

(with-eval-after-load 'company
  (add-to-list 'company-backends 'merlin-company-backend))

;; Ruby
;; ----

(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))

;; Javascript
;; ----------

;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-hook 'js-mode-hook 'js2-minor-mode)
;; (add-hook 'js2-mode-hook 'ac-js2-mode)


;; HTML and templates
;; ------------------

(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
;; (setq web-mode-engines-alist '(("underscore" . "\\.tpl\\'")) )


;; Elixir - Alchemist
;; ------------------

(setq alchemist-goto-erlang-source-dir "~/code/github-non-dam/otp-OTP-20.0")
(setq alchemist-goto-elixir-source-dir "~/code/github-non-dam/elixir-1.5.1")
;; (setq alchemist-mix-command "/usr/local/bin/mix")
;; (setq alchemist-iex-program-name "/usr/local/bin/iex")
;; (setq alchemist-execute-command "/usr/local/bin/elixir")
;; (setq alchemist-compile-command "/usr/local/bin/elixirc")


;; ELM
;; ---

;; (add-hook 'elm-mode-hook 'auto-complete-mode)


;; Wisp
;; ----

;;(add-hook 'wispjs-mode-hook 'paredit-mode)
;;(add-hook 'wispjs-mode-hook 'rainbow-delimiters-mode)


;; LaTeX - AucTeX
;; --------------

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq TeX-PDF-mode t)

;; Markdown
;; --------

(eval-after-load "markdown-mode"
  '(defalias 'markdown-add-xhtml-header-and-footer 'as/markdown-add-xhtml-header-and-footer))

(defun as/markdown-add-xhtml-header-and-footer (title)
    "Wrap XHTML header and footer with given TITLE around current buffer."
    (goto-char (point-min))
    (insert "<!DOCTYPE html5>\n"
      "<html>\n"
      "<head>\n<title>")
    (insert title)
    (insert "</title>\n")
    (insert "<meta charset=\"utf-8\" />\n")
    (when (> (length markdown-css-paths) 0)
      (insert (mapconcat 'markdown-stylesheet-link-string markdown-css-paths "\n")))
    (insert "\n</head>\n\n"
      "<body>\n\n")
    (goto-char (point-max))
    (insert "\n"
      "</body>\n"
      "</html>\n"))



;; Custom functions/macros
;; =======================

(defmacro ->> (&rest body)
  (let ((result (pop body)))
    (dolist (form body result)
      (setq result (append form (list result))))))

(defmacro -> (&rest body)
  (let ((result (pop body)))
    (dolist (form body result)
      (setq result (append (list (car form) result)
                           (cdr form))))))
