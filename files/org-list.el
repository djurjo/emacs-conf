;; Jose sends me this. Create an org with all the orgs
(provide 'org-list)

(defun org-index--insert-link ()
  (let ((str (shell-command-to-string "mdfind -name \"kMDItemFSName = '*.org'\" -onlyin ~")))
    (dolist (line (split-string str))
      (insert "[[file:" line "][" line "]]\n"))))
(defun org-list ()
  "Create a new buffer linking all org files using mdfind"
  (interactive)
  (let (bufname buffer)
    (setq bufname "*org-index*")
    (setq buffer (get-buffer-create bufname))
    (with-current-buffer buffer
      (progn
        (read-only-mode -1)
        (erase-buffer)
        (goto-char (point-min))
        (save-excursion (org-index--insert-link))
        (read-only-mode)
        (org-mode)))
    (switch-to-buffer-other-window buffer)))          

