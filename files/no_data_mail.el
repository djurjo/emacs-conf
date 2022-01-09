;;; Mail configuration. I am using mu4e + offlineimap.
;;; Use M-x query-replace email.address <your-mail> and M-x query-replace name <your-name> to change that data. Notice that init.el is pointing to a different file called mail.el. Change the path.


;;; Most of this configuration can be found on http://cachestocaches.com/2017/3/complete-guide-email-emacs-using-mu-and-/

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
(setq mu4e-mu-binary "/usr/local/bin/mu")

(require 'mu4e)
(require 'smtpmail)

(setq mu4e-compose-complete-addresses t)  ;; Complete address based in received mails
(setq mu4e-compose-complete-only-personal t)
;; Only if that adresses where sent to a personal address. This is set with mu init --my-address=balbla@mail1.com othermail@example.com
(setq mu4e-contact-process-function 'my-contact-processor)
;;; Set my-contact-processor as processor function.

;;; Process contacts to avoid no-reply and things like that.
;;; Modified from https://github.com/trws/dotfiles/blob/4d9c35bd320ea2f9a28a24fc0bbedc10c392b7bd/doom/config.el
(defun my-contact-processor (contact)
  (cond
   ;; remove unwanted mailing list rewrites, etc.
   ;; This works doing a regexp in the contact name
   ((string-match-p " via " contact) (replace-regexp-in-string "^.+ via " "" contact)) 
   ((string-match-p "bounces" contact) nil)
   ((string-match-p "noreply" contact) nil)
   ((string-match-p "no-reply" contact) nil)
   ;;
   ;; jonh smiht --> John Smith
   ((string-match "@.+<.+@.+>" contact)  ;;; Fancy names 
    (replace-regexp-in-string ".+<\\(.+\\)>" "\\1" contact))
   (t contact)))

(setq mu4e-personal-address "email.address@gmail.com")
(setq message-kill-buffer-on-exit t)
(setq mu4e-user-mail-address "email.address@gmail.com")

(setq smtpmail-local-domain "gmail.com")
(setq smtpmail-default-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-server "smtp.gmail.com")

;;;; Contexts
(setq mu4e-contexts
 `( ,(make-mu4e-context
     :name "email.address"
     :match-func (lambda (msg)
		   (when msg
		     (mu4e-message-contact-field-matches msg
                            :to "email.address@gmail.com")))
     :vars '(
	     (user-mail-address . "email.address@gmail.com")
	     (user-full-name    . "name")
	     (mu4e-compose-signature .
				     (concat
				      "name\n"))
	     (mu4e-trash-folder . "/[Gmail].Papelera")
	     (mu4e-refile-folder ."/[Gmail].Archive")
	     (mu4e-sent-folder ."/[Gmail].Enviados")
	     (mu4e-drafts-folder ."/[Gmail].Borradores")
	     )
     )
    )
)

;;;; Bookmarks:
(defcustom mu4e-bookmarks
  '(( :name  "Unread messages"
      :query "flag:unread AND NOT flag:trashed 
              AND NOT maildir:/\[Gmail\].Spam
              AND NOT maildir:/\[Gmail\].Archive"
      :key ?u)
    ( :name "Today's messages"
      :query "date:today..now"
      :key ?t)
    ( :name "Last 7 days"
      :query "date:7d..now"
      :hide-unread t
      :key ?w)
    ( :name "Messages with images"
      :query "mime:image/*"
      :key ?p)
    )

 "List of pre-defined queries that are shown on the main screen.

Each of the list elements is a plist with at least:
:name  - the name of the query
:query - the query expression
:key   - the shortcut key.

Optionally, you add the following:
:hide  - if t, bookmark is hdden from the main-view and speedbar.
:hide-unread - do not show the counts of unread/total number
 of matches for the query. This can be useful if a bookmark uses
 a very slow query. :hide-unread is implied from :hide.
"
  :type '(repeat (plist))
  :group 'mu4e)
