(use-package helm
  :ensure t
  :diminish helm-mode
  :config
  (helm-mode 1)
  (helm-fuzzier-mode 1)
  (helm-autoresize-mode 1)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40)
  (set-face-attribute 'helm-selection nil 
		      :background "yellow"
		      :foreground "black")
  (global-set-key (kbd "M-x")                    'undefined)
  (global-set-key (kbd "M-x")                    'helm-M-x)
  ;; (global-set-key (kbd "C-x C-b") 'helm-find-buffer-on-elscreen)
  (global-set-key (kbd "C-x C-b")                'helm-buffers-list)
  ;; (global-set-key (kbd "C-x C-f")                'helm-find-files)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z") 'helm-select-action)
  (define-key helm-buffer-map (kbd "<tab>") 'helm-execute-persistent-action)
  ;; (define-key helm-map (kbd "S-SPC") 'helm-toggle-visible-mark)
  ;; (define-key helm-find-files-map (kbd "C-k") 'helm-find-files-up-one-level))
  :bind
  (:map itsyc-leader-map
	("bb" . helm-mini)
	("bB" . helm-buffers-list)
	("pf" . projectile-find-file)
	("ps" . helm-projectile-switch-project))
  )

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  (setq projectile-indexing-method 'native)
  (setq projectile-enable-caching t)
  ;; (global-set-key (kdb "C-c p p") 'helm-projectile)
  ;; (setq projectile-keymap-prefix (kbd "C-c p"))
  ;; (setq projectile-completion-system 'default)
  ;; (define-key projectile-mode-map [?\f] 'projectile-find-other-file)
  ;; (global-set-key (kbd "C-c p s") 'helm-projectile-switch-project)
  ;; (global-set-key (kbd "C-c p f") 'helm-projectile-find-other-file)
  )

(use-package helm-fuzzier :ensure t
  :config
  (helm-fuzzier-mode 1)
  (setq helm-mode-fuzzy-match t)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-recentf-fuzzy-match t)
  )
(use-package helm-swoop :ensure t)

(use-package recentf
  :ensure t
  :config
  (setq recentf-max-saved-items 1000))

(use-package undo-tree
  :ensure t
  :diminish ""
  :config
  :bind
  (:map itsyc-leader-map
	("U" . undo-tree-visualize))
  )


(provide 'init-helm)
