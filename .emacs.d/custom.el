(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-use-fuzzy t)
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(clojure-align-binding-forms
   (quote
    ("let" "when-let" "when-some" "if-let" "if-some" "binding" "loop" "doseq" "for" "with-open" "with-local-vars" "with-redefs" "match")))
 '(clojure-align-cond-forms (quote ("condp" "cond" "cond->" "cond->>" "case" "are")))
 '(clojure-align-forms-automatically nil)
 '(clojure-defun-indents (quote (fdef)))
 '(clojure-defun-style-default-indent t)
 '(clojure-indent-style :align-arguments)
 '(compilation-message-face (quote default))
 '(confirm-kill-emacs (quote y-or-n-p))
 '(css-indent-offset 2)
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("132b6f6de83826cc43f286c07e222330bfbf676da3ca6a16cc544c48ab61f94c" "360c025947260ee585229744fe39a25f65769762cdcdc9eceb5e2e1ae27ea882" "4734d335dc78926118979be804d8a1d1d3feaf93ca8c5dbcb4bcbdbd0321873c" "d3a406c5905923546d8a3ad0164a266deaf451856eca5f21b36594ffcb08413a" "145351e942ae83a750e7648a8e5777493f778732ba7c80b515d2714cdfaa8308" "fd13f1804d0f34fc4c0e666661a267b3d32a41ea4475ce1fd62b347f7e5c0911" "8ed752276957903a270c797c4ab52931199806ccd9f0c3bb77f6f4b9e71b9272" "07fa1dd851542c305c7f83651ed8a6f306fc0d3e6406c2154ada53399688d0e0" "e674a5d6b70d38ac5c66a6bfdfc68e12c33a276a6863791f0c29f17cf20b9c53" "dbc36265f8078e5b36e907b7753cd5b538f702f9f1be398d17ff9c5b442fe8cf" "17abe119cdae7472a0027ac5fd91275b4d391cd07579d4ae76bd0667d172197c" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "776e35f5a92988a39582ca20b528a98685bf6d441950d5363254705697068fb4" "bd88c659ca050475ae773848adb29720b99c2983450cf21cab6b357d9b1a40e5" "690a0889f56a53c9e4137a3a6c43a164030f67a675486ba592c7b1a02d4c518e" "bd115791a5ac6058164193164fd1245ac9dc97207783eae036f0bfc9ad9670e0" "a0be8cc2d04108146aa14c493071b88578157a11bd2ef0d85e3ca34b5f2205c5" "338f622cba1f52523b57dddbb6ec255196ba1dbfce490aa2fed5ce0b038ce9af" "7f2b040545a8795c441aaab8592dc82219be5c545394aa44dac5a3ae551d5f09" "c6a6b4d59dc53d407432e4f936c49bf747e304683cc357abe32398af7c6dea33" "73fe242ddbaf2b985689e6ec12e29fab2ecd59f765453ad0e93bc502e6e478d6" "0e121ff9bef6937edad8dfcff7d88ac9219b5b4f1570fd1702e546a80dba0832" default)))
 '(ecb-layout-name "left13")
 '(ecb-options-version "2.40")
 '(ecb-windows-width 0.3)
 '(elm-indent-after-keywords
   (quote
    (("of" 2)
     ("in" 2 0)
     ("{" 2)
     "if" "then" "else" "let")))
 '(elm-indent-offset 2)
 '(elm-indent-rhs-align-column 0)
 '(emmet-indentation 2)
 '(fci-rule-color "#49483E")
 '(fringe-mode nil nil (fringe))
 '(geiser-implementations-alist
   (quote
    (((regexp "\\.scm$")
      guile)
     ((regexp "\\.rkt$")
      racket)
     ((regexp "\\.scm$")
      chicken)
     ((regexp "\\.release-info$")
      chicken)
     ((regexp "\\.meta$")
      chicken)
     ((regexp "\\.setup$")
      chicken)
     ((regexp "\\.ss$")
      chez)
     ((regexp "\\.def$")
      chez)
     ((regexp "\\.scm$")
      mit)
     ((regexp "\\.pkg$")
      mit)
     ((regexp "\\.scm$")
      chibi)
     ((regexp "\\.sld$")
      chibi))))
 '(global-whitespace-mode t)
 '(haml-backspace-backdents-nesting nil)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-path-cabal "/usr/local/bin/cabal")
 '(haskell-process-path-ghci "/usr/local/bin/ghci")
 '(haskell-process-suggest-remove-import-lines t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(hl-paren-background-colors (quote ("light green")))
 '(hl-paren-colors (quote ("black")))
 '(ido-enable-flex-matching t)
 '(indent-tabs-mode nil)
 '(js-auto-indent-flag t)
 '(js-indent-level 2)
 '(js-switch-indent-offset 2)
 '(linum-eager t)
 '(linum-format (quote dynamic))
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(markdown-indent-on-enter nil)
 '(neo-window-width 35)
 '(nginx-indent-level 2)
 '(nxml-attribute-indent 2)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (flycheck quack geiser evil-numbers wispjs-mode lfe-mode ido-completing-read+ nginx-mode ag yaml-mode pug-mode elm-mode org which-key exec-path-from-shell clj-refactor ido-grid-mode git-gutter alchemist lua-mode tuareg smooth-scrolling smex rainbow-delimiters projectile paredit neotree multiple-cursors monokai-theme markdown-mode magit ido-vertical-mode highlight-parentheses helm-git-grep helm-ag helm haskell-mode git-gutter+ fuzzy flx-ido flx fill-column-indicator evil emmet-mode cider auto-complete)))
 '(projectile-global-mode t)
 '(safe-local-variable-values
   (quote
    ((cider-refresh-after-fn . "integrant.repl/resume")
     (cider-refresh-before-fn . "integrant.repl/suspend"))))
 '(scheme-mode-hook (quote (geiser-mode--maybe-activate paredit-mode)) t)
 '(scss-compile-at-save nil)
 '(sh-indentation 2)
 '(smooth-scroll/vscroll-step-size 8)
 '(sr-speedbar-right-side nil)
 '(standard-indent 2)
 '(syslog-debug-face
   (quote
    ((t :background unspecified :foreground "#A1EFE4" :weight bold))))
 '(syslog-error-face
   (quote
    ((t :background unspecified :foreground "#F92672" :weight bold))))
 '(syslog-hour-face (quote ((t :background unspecified :foreground "#A6E22E"))))
 '(syslog-info-face
   (quote
    ((t :background unspecified :foreground "#66D9EF" :weight bold))))
 '(syslog-ip-face (quote ((t :background unspecified :foreground "#E6DB74"))))
 '(syslog-su-face (quote ((t :background unspecified :foreground "#FD5FF0"))))
 '(syslog-warn-face
   (quote
    ((t :background unspecified :foreground "#FD971F" :weight bold))))
 '(tab-width 2)
 '(tuareg-indent-align-with-first-arg t)
 '(tuareg-match-patterns-aligned t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(web-mode-attr-indent-offset 2)
 '(web-mode-block-padding 2)
 '(weechat-color-list
   (quote
    (unspecified "#000000" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
 '(whitespace-display-mappings (quote ((tab-mark 9 [187 9] [92 9]))))
 '(whitespace-line-column nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (shadow default) :background "#222222" :foreground "#75715E"))))
 '(whitespace-line ((t (:foreground nil)))))
