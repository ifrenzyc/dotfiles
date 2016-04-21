(use-package expand-region
  :ensure t
  :init
  (pending-delete-mode t)
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))


(provide 'init-expand-region)
