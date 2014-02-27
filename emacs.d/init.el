;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please
(setq inhibit-startup-message t)

;; Auto revert (~ reload modified files)
(global-auto-revert-mode t)

(require 'package)
(package-initialize)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Display line number
;; (global-linum-mode t)
;; (setq linum-format "%d")

;; Display line number
(setq column-number-mode t)

;; Evil mode
(evil-mode 1)

;; Rainbow delimiters
(global-rainbow-delimiters-mode)

;; 
(load-library "iso-transl")

;; For Mac OS rebind meta to function key
(when (eq system-type 'darwin)
  (setq mac-function-modifier 'meta)
  (setq mac-option-modifier 'none))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; IDO
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

;; SMEX
(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
