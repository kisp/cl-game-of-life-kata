(defun run-tests ()
  (interactive )
  (save-some-buffers t)
  (slime-display-output-buffer)
  (slime-eval-async
      `(cl:progn
	(cl:load ,(buffer-file-name (get-buffer "gol.lisp")))
	(5am:run! :gol))
    (lambda (result)
      (message "done: %s" result))))

(global-set-key (kbd "C-t") 'run-tests)
