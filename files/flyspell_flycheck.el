(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))


(setq flycheck-dafny-executable "/Users/danieljurjo/.emacs.d/libs/dafny/dafny")
(setq flycheck-boogie-executable "/Users/danieljurjo/.emacs.d/libs/boogie-friends")
(setq flycheck-z3-smt2-executable "/Users/danieljurjo/.emacs.d/libs/dafny/z3/bin/z3")
;(setq flycheck-inferior-dafny-executable "PATH-TO-DafnyServer.exe") ;; Optional
;(setq boogie-friends-profile-analyzer-executable "PATH-TO-Z3-AXIOM-PROFILER") ;; Optional
