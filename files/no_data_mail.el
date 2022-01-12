;;; Mail configuration. I am using mu4e + mbsync.

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
(setq mu4e-mu-binary "/usr/local/bin/mu")

(require 'mu4e)

(setq mu4e-compose-complete-addresses t)  ;; Complete address based in received mails
(setq mu4e-compose-complete-only-personal t)
;; Only if that adresses where sent to a personal address. This is set with mu init --my-address=balbla@mail1.com othermail@example.com
(setq mu4e-contact-process-function 'my-contact-processor)
;;; Set my-contact-processor as processor function.

;;; Process contacts to avoid no-reply and things like that. Modified from https://github.com/trws/dotfiles/blob/4d9c35bd320ea2f9a28a24fc0bbedc10c392b7bd/doom/config.el
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

(setq message-kill-buffer-on-exit t)
(setq mu4e-compose-dont-reply-to-self t)
(setq mu4e-get-mail-command "mbsync -a")
(setq mu4e-update-interval 300)
(setq mu4e-index-lazy-check t)


;;;; Contexts
(setq mu4e-contexts
 `( ,(make-mu4e-context
      :name "gmail_acc"
      :match-func (lambda (msg)   ;; TODO: Does not filter prop
		   (when msg
		     (string= (mu4e-message-field msg :maildir) "/gmail")
		     )
		   )
      :vars '(
	     (user-mail-address . "gmail_acc@gmail.com")
	     (user-full-name    . "NAME")
	     (mu4e-compose-signature .
				     (concat
				      "NAME\n"))
	     (mu4e-trash-folder . "/gmail/trash")
	     (mu4e-refile-folder ."/gmail/archive")
	     (mu4e-sent-folder ."/gmail/sent")
	     (mu4e-drafts-folder ."/gmail/drafts")
	     (mu4e-bookmarks .
	      (( :name  "Unread messages"
			 :query "flag:unread AND NOT flag:trashed"
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
			:key ?p))
	      )
      	      (mu4e-maildir-shortcuts .
				      (
				       ("/gmail/INBOX"      . ?i)
				       ("/gmail/Sent"       . ?s)
				       ("/gmail/Archive"    . ?a)
				       )
	       )
	      )
      )
    ,(make-mu4e-context
      :name "work"
      :match-func (lambda (msg)
		   (when msg
		     (string= (mu4e-message-field msg :maildir) "/work")))
      :vars '(
	      (user-mail-address . "work_acc@work.org")
	      (user-full-name    . "NAME")
	      (mu4e-compose-signature .
				      (concat
				       "NAME\n"))
	      (mu4e-trash-folder . "/work/Papelera")
	      (mu4e-refile-folder ."/work/Archive")
	      (mu4e-sent-folder ."/work/Enviados")
	      (mu4e-drafts-folder ."/work/Borradores")
	      (mu4e-bookmarks .
	      (( :name  "Unread messages"
			 :query "flag:unread AND NOT flag:trashed"
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
			:key ?p))
	      )
	      (mu4e-maildir-shortcuts .
	       ( ("/work/INBOX"      . ?i)
		 ("/work/Sent"       . ?s)
		 ("/work/Archive"    . ?a)
	      ))
      )
    )
 ))

;;; Use msmtp: https://www.tomica.net/blog/2020/12/sending-mail-using-multiple-mu4e-contexts-in-emacs/
(setq sendmail-program "/usr/local/bin/msmtp"
      message-sendmail-f-is-evil t
      message-sendmail-extra-arguments '("--read-envelope-from")
      send-mail-function 'smtpmail-send-it
      message-send-mail-function 'message-send-mail-with-sendmail)   
