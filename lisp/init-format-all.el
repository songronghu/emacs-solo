(use-package format-all
  :commands (format-all-mode format-all-buffer)
  :hook (prog-mode . format-all-mode)
  :bind (("M-g f" . format-all-buffer))
  :config
  (setq-default format-all-formatters
                '(("C"     (astyle "--mode=c"))
                  ("Shell" (shfmt "-i" "4" "-ci")))))
(provide 'init-format-all)
