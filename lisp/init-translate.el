(use-package google-translate
  :ensure nil
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

  ;; 解决搜索词中包含换行符导致翻译失败的问题
  ;;(defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130))

  ;; 注意：由于 Google 经常变动接口，如果翻译出现 "Search TKK" 错误，
  ;; 下面这个设置通常能解决大部分问题
  (setq google-translate-backend-method 'curl))

(provide 'init-translate)
