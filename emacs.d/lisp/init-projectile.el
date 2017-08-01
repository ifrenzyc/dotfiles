(use-package projectile
  :ensure t
  :commands (projectile-project-root)   
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'default)
  (setq projectile-indexing-method 'alien)
  
  )

(defun itsyc/helm-project-do-ag ()
  "Search in current project with `ag'."
  (interactive)
  (let ((dir (projectile-project-root)))
    (if dir
        (helm-do-ag dir)
      (message "error: Not in a project."))))

(provide 'init-projectile)
