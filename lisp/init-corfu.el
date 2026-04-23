(use-package corfu
  :ensure t
  :custom
  (corfu-cycle t)
  (corfu-auto t)                 ;; 必须设为 t
  (corfu-auto-delay 0.1)         ;; 变量赋值，不要写成 (corfu-auto-delay 0.1)
  (corfu-auto-prefix 2)          ;; 关键：设为 1，这样输入 . 之后就能立即触发
  (corfu-quit-at-boundary 'separator)
  ;; 仅在特定模式下启用 Corfu
  :hook ((prog-mode . corfu-mode)
         (shell-mode . corfu-mode)
         (eshell-mode . corfu-mode))
  :init
  (global-corfu-mode)
  ;; 针对 Eglot 的优化配置
  :config
  ;; 启用可选的扩展模式：
  (corfu-history-mode)   ;; 记住补全历史
  (corfu-popupinfo-mode) ;; 显示文档悬浮窗
  ;; 解决 . 号补全在某些情况下被判定为边界的问题
  (add-to-list 'corfu-auto-commands #'self-insert-command))

(provide 'init-corfu)
