(defvar my/eshell-where-file
  "/home/ronghusong/src/github/emacs-solo/eshell/.where")

(defun my/eshell--ensure-where-file ()
  (unless (file-exists-p my/eshell-where-file)
    (make-directory (file-name-directory my/eshell-where-file) t)
    (write-region "" nil my/eshell-where-file)))

(defun my/eshell--read-where ()
  (my/eshell--ensure-where-file)
  (with-temp-buffer
    (insert-file-contents my/eshell-where-file)
    (split-string (buffer-string) "\n" t)))

(defun my/eshell--write-where (paths)
  (with-temp-file my/eshell-where-file
                  (insert (mapconcat #'identity paths "\n"))))

(defun my/eshell--add-path (path)
  (let* ((paths (my/eshell--read-where))
         (abs (expand-file-name path))
         (new (cons abs (remove abs paths))))
    (my/eshell--write-where new)))

(defun my/eshell--match (input paths)
  (let ((keywords (split-string input " " t)))
    (seq-filter
      (lambda (p)
        (cl-every (lambda (k)
                    (string-match-p (regexp-quote k) p))
                  keywords))
      paths)))

(defun my/eshell--choose (candidates)
  (if (= (length candidates) 1)
    (car candidates)
    (progn
      (message "\n%s"
               (mapconcat
                 (lambda (p)
                   (format "%d %s"
                           (1+ (cl-position p candidates))
                           p))
                 candidates "\n"))
      (let* ((idx (read-number "Select index: "))
             (choice (nth (1- idx) candidates)))
        choice))))

(defun my/eshell-smart-cd-advice (orig-fun &rest args)
  (let ((input (string-join args " ")))
    (if (and (not (string-empty-p input))
             (file-directory-p (expand-file-name input default-directory)))
        (progn
          (apply orig-fun args)
          (my/eshell--add-path (expand-file-name input default-directory)))
      (let* ((paths (my/eshell--read-where))
             (matches (and (not (string-empty-p input))
                           (my/eshell--match input paths))))
        (if matches
            (let ((target (my/eshell--choose matches)))
              (when target
                (apply orig-fun (list target))
                (my/eshell--add-path target)))
          (prog1
              (apply orig-fun args)
            (when default-directory
              (my/eshell--add-path default-directory))))))))

(with-eval-after-load 'eshell
                      (advice-add 'eshell/cd :around #'my/eshell-smart-cd-advice))

;; 自动记录 cd
(defun my/eshell-track-cd ()
  (when default-directory
    (my/eshell--add-path default-directory)))

(add-hook 'eshell-directory-change-hook #'my/eshell-track-cd)

(provide 'init-eshell)

