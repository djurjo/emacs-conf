;;; This file contains all the stuff related to the org-mode agenda // org-mode.

;;; Everything goes here unless stated in a different wayy
(setq org-default-notes-file "~/misc/misc.org")

;; Display agenda at start
;;https://stackoverflow.com/questions/2010539/how-can-i-show-the-org-mode-agenda-on-emacs-start-up
;;; (add-hook 'after-init-hook 'org-agenda-list)
;; (setq inhibit-splash-screen t)
;; (add-hook 'after-init-hook '(lambda () (org-agenda)))
;; ;;(org-agenda-list)
;; (delete-other-windows)

;; Open files fastttttt
(global-set-key (kbd "C-c mc")
                (lambda () (interactive) (find-file "~/misc/misc.org")))
(global-set-key (kbd "C-c phd")
                (lambda () (interactive) (find-file "~/jurjo_phd/notsh/phd.org")))
(global-set-key (kbd "C-c mf")
                (lambda () (interactive) (find-file "~/mfoc/mfoc.org")))

;; effort-estimation
; org-agenda-filter-by-effort
(global-set-key "\C-ceff" 'org-agenda-filter-by-effort)

;; Open org-agenda/org-capture
(global-set-key "\C-ca" 'org-agenda)

(global-set-key "\C-cc" 'org-capture)

(setq org-enforce-todo-dependencies t)
;; Where look for TODOs  etc
(setq org-agenda-files '(
			 "/Users/danieljurjo/jurjo_phd/notsh/phd.org"
			 "/Users/danieljurjo/mfoc/mfoc.org"
			 "/Users/danieljurjo/misc/misc.org"
			 "/Users/danieljurjo/jurjo_phd/phd.org"
			 ))

(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
	 ((agenda "")
	  (alltodo "")))
      ))


(setq calendar-week-start-day 2
          calendar-day-name-array ["Sunday" "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" ]
          calendar-month-name-array ["January" "February" "March" "April" "May"
                                     "June" "July" "August" "September"
                                     "October" "November" "December"])
(setq org-agenda-include-diary nil)
(setq org-deadline-warning-days 7)

;; Palabras clave para los TODO
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "|" "CANCELED(c)" "DONE(f)" "DELEGATED(dg)")))

;; Colores de los TODO.
;; M-x list-colors-display!
(setq org-todo-keyword-faces
      '(("TODO" . "#d15fee") ;:background "dim gray" :weight bold))
        ("NEXT" . "#cdaa7d") ;  :background "dim gray" :weight bold))
        ("WAITING" . "#ee9a00" ) ;:background "dim gray" :weight bold))
        ("CANCELED" . "#cd5c5c")
        ("DONE" . "#556B2F")
	("DELEGATED". "4682b4")
	)
      )
;; Tags
(setq org-tag-persistent-alist
      '(("@mfoc" . ?1)
        ("@phd" . ?2)
        ("misc" . ?3)
        ("congr" . ?6)
        ("note" . ?7)
        ("creat" . ?8)
        ("prj" . ?9)
        ("someday" . ?0)))

;; Colores de los tags
(setq org-tag-faces
      '(("mfoc" . "firebrick" )
        ("phd" . "light sea green")
        ("misc" . "deep sky blue")
        ("congr" . "spring green")
        ("note" . "light coral")
        ("creat" . "olive drab")
        ("prj" . "cornflower blue")
        ("someday" . "orchid")))

(setq org-capture-templates
      (quote (
	      ("g" "general todo" entry (file "~/misc/misc.org")
	       "* TODO %^{Description} \n:PROPERTIES:\n:ORDERED: nil \n:END:")
	      ("s" "scheduled todo" entry (file "~/misc/misc.org")
	       "* TODO %^{Description}\n:PROPERTIES:\n:ORDERED: nil \n:END:\nSCHEDULED: %T")
	      ("d" "todo w/ deadline" entry (file "~/misc/misc.org")
	       "* TODO %^{Description}\n:PROPERTIES:\n:ORDERED: nil \n:END:\n DEADLINE: %T")

	      ("P" "phd general todo" entry (file "~/jurjo_phd/notsh/phd.org")
	       "* TODO %^{Description}\n:PROPERTIES:\n:ORDERED: nil \n:END:")
	      ("S" "phd scheduled todo" entry (file "~/jurjo_phd/notsh/phd.org")
	       "* TODO %^{Description}\n:PROPERTIES:\n:ORDERED: nil \n:END: \n SCHEDULED: %T")
	      ("D" "phd todo w/ deadline" entry (file "~/jurjo_phd/notsh/phd.org")
	       "* TODO %^{Description}\n:PROPERTIES:\n:ORDERED: nil \n:END: \n DEADLINE: %T")
	      ("M" "phd meeting" entry (file "~/jurjo_phd/notsh/phd.org")
	       "* MEETING %^{Description}\n:PROPERTIES:\n:ORDERED: nil \n:END: \n %T")
	     
	      ("m" "mfoc general todo" entry (file "~/mfoc/mfoc.org")
	       "* TODO %^{Description}\n:PROPERTIES:\n:ORDERED: nil \n:END:")
	      ("z" "mfoc scheduled todo" entry (file "~/mfoc/mfoc.org")
	       "* TODO %^{Description}\n:PROPERTIES:\n:ORDERED: nil \n:END: \n SCHEDULED: %T")
	      ("w" "mfoc todo w/ deadline" entry (file "~/mfoc/mfoc.org")
	       "* TODO %^{Description}\n:PROPERTIES:\n:ORDERED: nil \n:END: \n DEADLINE: %T")
	      ("t" "mfoc meeting" entry (file "~/mfoc/mfoc.org")
	       "* MEETING %^{Description}\n:PROPERTIES:\n:ORDERED: nil \n:END: \n %T")
	      )
      )
)
