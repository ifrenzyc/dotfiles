;; (use-package indent-guide
  ;; :ensure t
  ;; :init
  ;; (indent-guide-global-mode)
  ;; :config
  ;; (set-face-background 'indent-guide-face "dimgray")
  ;; (setq indent-guide-recursive t)
  ;; )


(use-package highlight-indentation
  :ensure t
  :init
  (highlight-indentation-mode t)
  :config
  (set-face-background 'highlight-indentation-face "#e3e3d3")
  (set-face-background 'highlight-indentation-current-column-face "#c3b3b3"))

(provide 'init-indent-guide)
