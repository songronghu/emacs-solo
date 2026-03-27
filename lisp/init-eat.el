(use-package eat
  :ensure t
  :bind (:map eat-mode-map
              ("<f8>" . my-eat-ssh-connect))
  :config
  ;; 定义 SSH 补全函数
  (defun my-eat-ssh-connect ()
    "解析 ~/.ssh/config 并通过 Emacs 补全界面选择主机发送至 Eat 终端"
    (interactive)
    (let* ((ssh-config (expand-file-name "~/.ssh/config"))
           (hosts (when (file-exists-p ssh-config)
                    (with-temp-buffer
                      (insert-file-contents ssh-config)
                      (let (res)
                        (goto-char (point-min))
                        ;; 匹配以 Host 开头的行，过滤掉通配符 *
                        (while (re-search-forward "^Host[ \t]+\\([^ \t\n\*]+\\)" nil t)
                          (push (match-string 1) res))
                        (delete-dups res))))))
      (if (not hosts)
          (message "未在 ~/.ssh/config 中找到有效主机")
        (let ((selected-host (completing-read "SSH to: " hosts nil t)))
          (when (and selected-host (not (string-empty-p selected-host)))
            ;; 确保发送前清理当前行（发送 Ctrl-u），然后输入命令
            (process-send-string (get-buffer-process (current-buffer))
                                 (format "\C-u ssh %s\n" selected-host))))))))
(provide 'init-eat)
