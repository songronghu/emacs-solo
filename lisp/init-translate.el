(use-package google-translate
  :straight (google-translate :host github :repo "atykhonov/google-translate")
  :init
  ;; 绑定快捷键
  (bind-keys ("C-c t" . google-translate-at-point)
             ("C-c T" . google-translate-query-translate))
  :config
  ;; 必须引入默认 UI 模块，否则会报错
  ;;(require 'google-translate-default-ui)
  (require 'google-translate-smooth-ui)

  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "zh-CN")

  (setq google-translate-backend-method 'curl))

(provide 'init-translate)
