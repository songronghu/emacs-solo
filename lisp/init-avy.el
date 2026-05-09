(use-package avy
  :straight (avy :host github :repo "abo-abo/avy")
  :defer t
  :bind (
         ("s-d" . avy-goto-char)
         ("s-j" . avy-goto-word-1)
         ))

(provide 'init-avy)
