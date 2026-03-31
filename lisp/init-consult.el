(use-package consult
 :bind (
       ;; 替代 isearch
       ("C-s" . consult-line)

       ;; 全局搜索
       ("C-c s" . consult-ripgrep)

       ("C-c f" . grep-findq)
       ("C-x b" . consult-buffer)
       ("M-y" . consult-yank-pop)))

(provide 'init-consult)
