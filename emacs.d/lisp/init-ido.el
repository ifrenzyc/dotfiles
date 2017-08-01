(use-package ido
  :ensure t
  :init
  (ido-mode 1)
  (ido-vertical-mode 1)
  (setq ido-use-faces nil)
  (ido-everywhere 1)
  :config
  (global-set-key (kbd "C-x C-f") 'ido-find-file)
  )

(use-package flx-ido
  :ensure t
  :config
  (flx-ido-mode 1)
  ;; disable ido faces to see flx highlights.
  (setq ido-enable-flex-matching t)
  )

(provide 'init-ido)
