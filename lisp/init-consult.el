(use-package consult
  :straight (consult :host github :repo "minad/consult")
  :bind (
       ;; replace isearch
       ("C-s" . consult-line)

       ;; search in git repo
       ("M-s g" . consult-ripgrep)

       ("C-c f" . consult-find)
       ("C-x b" . consult-buffer)
       ("M-y" . consult-yank-pop)))

(provide 'init-consult)
