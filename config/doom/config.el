;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

(setq doom-font (font-spec :family "FiraMono Nerd Font" :size 18
                           ;; :weight 'semi-light
                           )
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 18))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-spectrum)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; https://gist.github.com/ericdallo/09217734a925148976e13b872b91e134
(setq read-process-output-max (* 1024 1024)
      doom-localleader-key "," ;; easier than <SPC m>
      )

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(use-package! lsp-mode
  :commands lsp
  :config
  (setq lsp-semantic-tokens-enable t)
  (add-hook 'lsp-after-apply-edits-hook (lambda (&rest _) (save-buffer)))) ;; save buffers after renaming
;; ---

(after! smartparens
  (add-hook 'clojure-mode-hook #'smartparens-strict-mode))

;; https://clojureverse.org/t/doom-cider-keybindings/7762/5
;; mapping part of the Spacemacs lisp key map:
;; https://github.com/syl20bnr/spacemacs/blob/master/doc/DOCUMENTATION.org#editing-lisp-code
;; https://rameezkhan.me/adding-keybindings-to-doom-emacs/
(map! :leader
      (:prefix-map ("k" . "smartparens-mode")
        :desc "forward slurp" "s" #'sp-forward-slurp-sexp
        :desc "backward slurp" "S" #'sp-backward-slurp-sexp
        :desc "forward barf" "b" #'sp-forward-barf-sexp
        :desc "backward barf" "B" #'sp-backward-barf-sexp
        :desc "raise" "r" #'sp-raise-sexp
        :desc "unwrap & kill after" "e" #'sp-unwrap-sexp
        :desc "unwrap & kill before" "E" #'sp-backward-unwrap-sexp
        :desc "transpose" "t" #'sp-transpose-sexp
        ;; :desc "sp-forward-sexp" "L" #'sp-forward-sexp
        ;; :desc "sp-backward-sexp" "H" #'sp-backward-sexp
        ;; "C-M-u" #'sp-backward-up-sexp
        ;; "C-M-d" #'sp-down-sexp
        ;; "C-M-p" #'sp-backward-down-sexp
        ;; "C-M-n" #'sp-up-sexp
        ;; "C-M-s" #'sp-splice-sexp
        ))
