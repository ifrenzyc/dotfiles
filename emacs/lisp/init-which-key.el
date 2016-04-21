(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom)
  (setq which-key-side-window-location 'bottom)
  (which-key-setup-minibuffer)
  ;; (setq which-key-popup-type 'minibuffer)
  (add-to-list 'which-key-key-replacement-alist '("TAB" . "↹"))
  (add-to-list 'which-key-key-replacement-alist '("RET" . "⏎"))
  (add-to-list 'which-key-key-replacement-alist '("DEL" . "⇤"))
  (add-to-list 'which-key-key-replacement-alist '("SPC" . "␣"))
  (setq which-key-sort-order 'which-key-key-order)
  )


(provide 'init-which-key)
