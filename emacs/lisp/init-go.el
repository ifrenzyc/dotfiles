(use-package go-mode
  :ensure t
  :config
  ;; 保存文件的时候对该源文件做一下gofmt
  (add-hook 'before-save-hook #'gofmt-before-save))

(use-package go-complete :ensure t)
(use-package go-direx :ensure t)
(use-package go-errcheck :ensure t)
(use-package go-gopath :ensure t)
(use-package go-impl :ensure t)
(use-package go-projectile :ensure t)
(use-package go-snippets :ensure t)


(provide 'init-go)
