;;(global-set-key (kbd "C-c q")
                ;; (lambda () (interactive)
                ;;   (insert-file )
                ;;  )
                ;; )

(defun ciao-nonrel-template (filepath)
  "Load a template for non-relational domains"
  (interactive "sFile path: ")
  (create-empty-file-if-no-exists filepath)
  (find-file filepath)
  (insert-file "/Users/danieljurjo/jurjo_phd/ciao/domains/dummy.pl")
  )

;;; https://stackoverflow.com/questions/14071991/how-to-create-an-empty-file-by-elisp

(defun create-empty-file-if-no-exists (filePath)
   "Create a file with FILEPATH parameter."
   (interactive "sFile path: ")
   (if (file-exists-p filePath)
       ()
     (with-temp-buffer (write-file filePath)))
   )
