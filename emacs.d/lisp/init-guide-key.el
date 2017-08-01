 ;;; init-guide-key

;; (use-package guide-key
;;   :ensure t
;;   :config
;;   (guide-key-mode 1)
;;   (setq guide-key/idle-delay 0.1)

;;   (defun guide-key/my-hook-function-for-org-mode ()
;;     (guide-key/add-local-guide-key-sequence "C-c")
;;     (guide-key/add-local-guide-key-sequence "C-c C-x")
;;     (guide-key/add-local-highlight-command-regexp "org-"))
;;   (add-hook 'org-mode-hook 'guide-key/my-hook-function-for-org-mode)

;;   (setq guide-key/recursive-key-sequence-flag t)
;;   )

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

(provide 'init-guide-key)