(require 'package)

(if (file-exists-p "~/.emacs.d/emacs/files/ciao_temp.el")
(load "~/.emacs.d/emacs/files/ciao_temp.el"))

;; Agenda + some org-mode definitions (colors)
(if (file-exists-p "~/.emacs.d/emacs/files/agenda.el")
(load "~/.emacs.d/emacs/files/agenda.el"))

;; Mail related definition
(if (file-exists-p "~/.emacs.d/emacs/files/mail.el")
    (load "~/.emacs.d/emacs/files/mail.el") )
;; Telegrammm
(if (file-exists-p "~/.emacs.d/emacs/files/telega.el")
(load "~/.emacs.d/emacs/files/telega.el") )

;; List all orgs. By jfmc
;;(load "~/.emacs.d/emacs/files/org-list.el") 

;; Mac needs
(if (file-exists-p "~/.emacs.d/emacs/files/mac_things.el")
(load "~/.emacs.d/emacs/files/mac_things.el") )

;; Package archives and related things
(if (file-exists-p "~/.emacs.d/emacs/files/packages.el")
(load "~/.emacs.d/emacs/files/packages.el") )

;; Miscellaneous
(if (file-exists-p "~/.emacs.d/emacs/files/misc.el")
(load "~/.emacs.d/emacs/files/misc.el") )

;; Enviroment (shell/bash/zsh etc)
(if (file-exists-p "~/.emacs.d/emacs/files/env.el")
(load "~/.emacs.d/emacs/files/env.el") )

;; Custom-set variables/faces/whatever
;;;;; better don't touch this too much
(if (file-exists-p "~/.emacs.d/emacs/files/custom-set.el")
(load "~/.emacs.d/emacs/files/custom-set.el"))

;; Alerts/notifications
;;; TODO: include this file once it works
;; (if (file-exists-p "~/.emacs.d/emacs/files/alerts.el")
;; (load "~/.emacs.d/emacs/files/alerts.el") )

;; Flyspell and flycheck (Dafny, Z3, boogie-friendss). it disabled
;; (if (file-exists-p "~/.emacs.d/init/flyspell_flycheck.el")
;; (load "~/.emacs.d/init/flyspell_flycheck.el") 

;; Ciao
;; @begin(99421239)@ - Do not edit these lines - added automatically!
(if (file-exists-p "~/ciao-devel/bndls/ciao_emacs/elisp/ciao-site-file.el")
  (load-file "~/ciao-devel/bndls/ciao_emacs/elisp/ciao-site-file.el"))
;; @end(99421239)@ - End of automatically added lines.;; (when (memq window-system '(mac ns))











