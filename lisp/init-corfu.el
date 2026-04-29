(use-package corfu
  :ensure nil
  :custom
  ;; 允许循环选择
  (corfu-cycle t)
  ;; 在输入空格或分隔符（边界）时不自动退出补全
  (corfu-quit-at-boundary nil)
  ;; 防止你在快速输入时，因为中间一瞬间没有匹配项导致弹窗闪烁消失
  (corfu-quit-no-match 'separator)

  ;; 默认情况下，选中某个候选词时，该词会暂时“虚显”在代码里。如果你觉得这种视觉干扰很大，可以将其关闭。
  (corfu-preview-current nil)
  ;; 这允许你按回车直接输入当前的文本，而不是强制插入第一个补全建议。
  (corfu-preselect 'prompt)
  ;; 设为 insert 表示如果只有一个完全匹配的选项，直接自动插入。
  (corfu-on-exact-match 'insert)
  ;; 开启字段补全
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-trigger ".")
  (corfu-auto-prefix 1)
  (corfu-quit-at-boundary 'separator)
  :config
  (global-corfu-mode)
  (require 'corfu-history)
   ;; 记住补全历史
  (corfu-history-mode 1)
  (require 'corfu-popupinfo)

  ;; 显示文档悬浮窗
  (corfu-popupinfo-mode 1)
  ;; 输入序号上屏
  (require 'corfu-indexed)
  (corfu-indexed-mode 1)
  (add-hook 'eshell-mode-hook (lambda ()
                              (setq-local corfu-auto nil)
                              (corfu-mode -1))))
(provide 'init-corfu)
