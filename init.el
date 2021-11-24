(require 'package)

;; Agenda + some org-mode definitions (colors)
(load "~/jurjo/djurjo_github/emacs/files/agenda.el")

;; Mail related definition
(load "~/jurjo/djurjo_github/emacs/files/mail.el") 

;; List all orgs. By jfmc
(load "~/jurjo/djurjo_github/emacs/files/org-list.el") 

;; Mac needs
(load "~/jurjo/djurjo_github/emacs/files/mac_things.el") 

;; Package archives and related things
(load "~/jurjo/djurjo_github/emacs/files/packages.el") 

;; Miscellaneous
(load "~/jurjo/djurjo_github/emacs/files/misc.el") 

;; Enviroment (shell/bash/zsh etc)
(load "~/jurjo/djurjo_github/emacs/files/env.el") 

;;; Custom-set variables/faces/whatever
(load "~/jurjo/djurjo_github/emacs/files/custom-set.el") 

;;; Alerts/notifications
(load "~/jurjo/djurjo_github/emacs/files/alerts.el") 

;;; Flyspell and flycheck (Dafny, Z3, boogie-friendss). it disabled
;(load "/Users/danieljurjo/.emacs.d/init/flyspell_flycheck.el") 

;; Ciao
;; @begin(99421239)@ - Do not edit these lines - added automatically!
(if (file-exists-p "/Users/danieljurjo/ciao-devel/bndls/ciao_emacs/elisp/ciao-site-file.el")
  (load-file "/Users/danieljurjo/ciao-devel/bndls/ciao_emacs/elisp/ciao-site-file.el"))
;; @end(99421239)@ - End of automatically added lines.;; (when (memq window-system '(mac ns))











