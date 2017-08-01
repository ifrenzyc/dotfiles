(use-package ido
  :ensure t
  :init
  (ido-mode 1)
  (ido-vertical-mode 1)
  (setq ido-use-faces nil)
  (ido-everywhere 1)
  :config
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)
  (global-set-key (kbd "C-x C-f") 'ido-find-file))

(use-package flx-ido
  :ensure t
  :config
  (flx-ido-mode 1)
  ;; disable ido faces to see flx highlights.
  (setq ido-enable-flex-matching t))

(use-package ido-ubiquitous
  :ensure t
  :config
  (ido-ubiquitous-mode 1))


(provide 'init-ido)
