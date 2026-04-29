(use-package consult
 :bind (
       ;; replace isearch
       ("C-s" . consult-line)

       ;; search in git repo
       ("M-s g" . consult-ripgrep)

       ("C-c f" . grep-findq)
       ("C-x b" . consult-buffer)
       ("M-y" . consult-yank-pop)))

(provide 'init-consult)
