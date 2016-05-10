;; @see http://coldnew.github.io/blog/2013/05-20_5cbb7/
(use-package pangu-spacing
  :ensure t
  :config
  (global-pangu-spacing-mode 1)
  ;; (setq pangu-spacing-real-insert-separtor t)
  (add-hook 'org-mode-hook
	    '(lambda ()
	       (set (make-local-variable 'pangu-spacing-real-insert-separtor) t))))


(provide 'init-panguspacing)
