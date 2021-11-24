;;; Small thingies

;;; @begin@ -Initial buffer
(setq initial-buffer-choice "/Users/danieljurjo/.emacs.d/start.org")
;;; @end@ -Initial buffer

;;; Theme & block startup (I guess)
(setq package-enable-at-startup nil)
(load-theme 'alect-light t) 
;;;


;;; Encryptation (disableb)
;; (require 'epa-file)
;; (epa-file-enable)

;;; I'm lazy etc
(fset 'yes-or-no-p 'y-or-n-p)

;;; Ispell
(setq ispell-program-name "/usr/local/bin/aspell")

;;; Pdf-tools
(load-library "pdf-tools")
(pdf-tools-install) ; Very nice PDF viewer (needs separate installation)
(setq TeX-view-program-selection '((output-pdf "pdf-tools")))
(setq TeX-source-correlate-start-server t)
(setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view")))
(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
(add-hook 'pdf-view-mode-hook 'pdf-continuous-scroll-mode)

;;; Telega: Telegram + Emacs!

 (use-package telega
   :load-path  "~/.emacs.d/libs/telega.el"
   :commands (telega)
   :defer t)


;;; Select window etc
(global-set-key (kbd "C-x p") 'ace-window)

;; RETURN will follow links in org-mode files
(setq org-return-follows-link  t)
