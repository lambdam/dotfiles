(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7758a8b8912ef92e8950a4df461a4d510484b11df0d7195a8a3d003965127abc" "c8c4baac2988652a760554e0e7ce11a0fe0f8468736be2b79355c9d9cc14b751" "350fef8767e45b0f81dd54c986ee6854857f27067bac88d2b1c2a6fa7fecb522" "3c08da65265d80a7c8fc99fe51df3697d0fa6786a58a477a1b22887b4f116f62" "2b20b4633721cc23869499012a69894293d49e147feeb833663fdc968f240873" "f5f80dd6588e59cfc3ce2f11568ff8296717a938edd448a947f9823a4e282b66" default))
 '(safe-local-variable-values
   '((eval progn
      (make-variable-buffer-local 'cider-jack-in-nrepl-middlewares)
      (add-to-list 'cider-jack-in-nrepl-middlewares "chpill.sonde/dummy-nrepl-middleware")
      (make-variable-buffer-local 'cider-jack-in-dependencies)
      (cider-add-to-alist 'cider-jack-in-dependencies "chpill/sonde"
       '(("git/sha" . "8755a24a8731a842247ed77a6288726e59328ede")
         ("git/url" . "https://github.com/chpill/sonde"))))
     (eval progn
      (setenv "HABILITATEM_ENV" "dev-local-transactor"))
     (eval progn
      (make-variable-buffer-local 'cider-jack-in-nrepl-middlewares)
      (add-to-list 'cider-jack-in-nrepl-middlewares "shadow.cljs.devtools.server.nrepl/middleware"))
     (cider-default-cljs-repl . custom)
     (cider-clojure-cli-global-options . "-A:dev:cljs")
     (cider-ns-refresh-after-fn . "user/start")
     (cider-ns-refresh-before-fn . "user/stop"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
