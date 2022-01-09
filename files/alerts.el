;; (setq org-show-notification-handler 'message)
;; ;; Alerts

;; ;; (mu4e-alert-set-default-style 'notifier)
;; ;; (add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
;; ;; (add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)


;; (use-package mu4e-alert
;;   :ensure t
;;   :after mu4e
;;   :init
;;   (setq mu4e-alert-interesting-mail-query
;;     (concat
;;      "flag:unread maildir:/jurjorivas.daniel/INBOX "
;;      ))
;;   (mu4e-alert-enable-mode-line-display)
;;   (defun gjstein-refresh-mu4e-alert-mode-line ()
;;     (interactive)
;;     (mu4e~proc-kill)
;;     (mu4e-alert-enable-mode-line-display)
;;     )
;;   (run-with-timer 0 60 'gjstein-refresh-mu4e-alert-mode-line)
;;   )
;; https://www.reddit.com/r/emacs/comments/4dntkl/mu4e_with_push_notifications/



