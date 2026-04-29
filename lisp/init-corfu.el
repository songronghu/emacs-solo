(use-package corfu
  :ensure nil
  :custom
  ;; allow cycle select
  (corfu-cycle t)
  ;; no quit when input separator
  (corfu-quit-at-boundary nil)
  ;;
  (corfu-quit-no-match 'separator)

  ;; close preview current
  (corfu-preview-current nil)
  ;; press Enter key, Enter the currently selected text directly.
  (corfu-preselect 'prompt)
  ;; only one candidate word, auto insert
  (corfu-on-exact-match 'insert)
  ;; enable auto completion
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-trigger ".")
  (corfu-auto-prefix 1)
  (corfu-quit-at-boundary 'separator)
  :config
  (global-corfu-mode)
  (require 'corfu-history)
   ;; remember completion history
  (corfu-history-mode 1)
  (require 'corfu-popupinfo)

  ;; show doc floating window
  (corfu-popupinfo-mode 1)
  ;; Insert directly after entering the prefix parameter
  (require 'corfu-indexed)
  (corfu-indexed-mode 1)
  (add-hook 'eshell-mode-hook (lambda ()
                              (setq-local corfu-auto nil)
                              (corfu-mode -1))))
(provide 'init-corfu)
