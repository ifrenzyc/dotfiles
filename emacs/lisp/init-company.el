(use-package company
  :ensure t
  :defer t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  ;(setq company-tooltip-common-selection ((t (:inherit company-tooltip-selection :background "yellow2" :foreground "#c82829"))))
  ;(setq company-tooltip-selection ((t (:background "yellow2"))))
  (setq company-idle-delay 0.2)
  (setq company-selection-wrap-around t)
  (define-key company-active-map [tab] 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(provide 'init-company)
