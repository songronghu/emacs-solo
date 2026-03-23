(use-package sort-tab
    :load-path "~/src/github/emacs-solo/site-lisp/sort-tab/"
    :config
    (sort-tab-mode t)
    (global-set-key (kbd "M-7") #'sort-tab-select-prev-tab)    ;选择前一个标签
    (global-set-key (kbd "M-8") #'sort-tab-select-next-tab)    ;选择后一个标签
    (global-set-key (kbd "M-s-7") #'sort-tab-select-first-tab) ;选择第一个标签
    (global-set-key (kbd "M-s-8") #'sort-tab-select-last-tab)  ;选择最后一个标签
    (global-set-key (kbd "C-;") #'sort-tab-close-current-tab)  ;关闭当前标签
    (global-set-key (kbd "s-q") #'sort-tab-close-other-tabs)   ;关闭后台标签
    (global-set-key (kbd "s-Q") #'sort-tab-close-all-tabs))    ;关闭所有标签
(provide 'sort-tab)
```
```
```
```
```
```
```
