(use-package powerline
  :ensure t
  :init
  (powerline-vim-theme)
  :config
  (setq powerline-arrow-shape 'curve)
  ;;  (custom-set-faces
  ;;'(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
  ;;'(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
  ;;  (setq powerline-color1 "grey22")
  ;; (setq powerline-color2 "grey40")
  )


(use-package powerline-evil
  :ensure t
  :init
  (powerline-evil-vim-color-theme)
  )

(use-package smart-mode-line-powerline-theme
  :ensure t
  )

(use-package smart-mode-line
  :ensure t
  :init
  (setq powerline-arrow-shape 'curve)
  (setq ns-use-srgb-colorspace t)
  (setq powerline-default-separator-dir '(left . right))
  (setq sml/no-confirm-load-theme t)
  ;; (setq sml/theme 'dark)
  ;; (setq sml/theme 'light)
  ;; (setq sml/theme 'respectful)
  (setq sml/theme 'powerline)
  (sml/setup))

(provide 'init-powerline)
