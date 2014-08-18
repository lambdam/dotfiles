(require 'package)

(defvar dam-packages
  '(
    ac-js2
    auto-complete
    dired+
    ecb
    emmet-mode
    evil
    flx
    flx-ido
    fuzzy
    helm
    highlight-sexp
    ido-ubiquitous
    ido-vertical-mode
    js2-mode
    magit
    markdown-mode+
    monokai-theme
    multiple-cursors
    neotree
    projectile
    rainbow-delimiters
    smex
    smooth-scroll
    smooth-scrolling
    undo-tree
    web-mode)
  "Dam packages")

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

;; Set up load path
(add-to-list 'load-path user-emacs-directory)

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

;; Evil mode
(evil-mode 1)

;; Rainbow delimiters
(global-rainbow-delimiters-mode)

;;
(load-library "iso-transl")

;; For Mac OS rebind meta to function key
(when (eq system-type 'darwin)
  ;; (setq mac-function-modifier 'meta)
  ;; (setq mac-option-modifier 'none))
  (setq mac-left-option-modifier 'meta)
  (setq mac-right-option-modifier 'none))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; IDO
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
(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; emacs-smooth-scrolling.el
(require 'smooth-scrolling)
;; (setq scroll-step 1)
;; (setq scroll-conservatively 1000)
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
;; (setq mouse-wheel-progressive-speed nil)
;; (setq mouse-wheel-follow-mouse t)

;; smooth-scroll
(require 'smooth-scroll)
(smooth-scroll-mode 'toggle)

;; disable ring bell
(setq ring-bell-function 'ignore)

;; Autocomplete
(require 'auto-complete)
(ac-flyspell-workaround)
(ac-linum-workaround)
(global-auto-complete-mode t)

;; Multiple cursors
(require 'multiple-cursors)

;; Dired
(toggle-diredp-find-file-reuse-dir 1)

;; Font size
(set-face-attribute 'default nil :height 110)

;; Multiple cursors
;; (setq multiple-cursors-map (make-sparse-keymap))
;; (define-key multiple-cursors-map (kbd "C->") 'mc/mark-next-like-this)
;; (add-hook
;;  'multiple-cursors-mode-hook
;;  (lambda ()
;;    ))

;; Nice scrolling
(setq
 scroll-margin 0
 scroll-conservatively 100000
 scroll-preserve-screen-position 1)

;; Use Ibuffer instead of Buffer List
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; ECB
(setq ecb-tip-of-the-day nil)

;; Full screen
(when (or
       (eq system-type 'gnu)
       (eq system-type 'gnu/linux))
  (global-set-key [f11] 'fullscreen-mode-fullscreen-toggle)
  (global-set-key (kbd "<menu>") 'smex))

;; Load syntaxes file (associate extensions with major modes)
(load (expand-file-name "syntaxes.el" user-emacs-directory))

;; Move cursor easily between windows
(global-set-key (kbd "<M-S-left>") 'windmove-left)
(global-set-key (kbd "<M-S-right>") 'windmove-right)
(global-set-key (kbd "<M-S-up>") 'windmove-up)
(global-set-key (kbd "<M-S-down>") 'windmove-down)

;; Web
;; ---
;; Javascript
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-hook 'js-mode-hook 'js2-minor-mode)
;; (add-hook 'js2-mode-hook 'ac-js2-mode)
;; HTML and templates
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(setq web-mode-engines-alist '(("underscore" . "\\.tpl\\'")) )
