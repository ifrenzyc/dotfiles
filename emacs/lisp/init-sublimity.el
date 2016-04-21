(use-package sublimity
  :ensure t
  :init
  (sublimity-mode 1)
  (set-scroll-bar-mode nil)
  (require 'sublimity-scroll)
  ;; (require 'sublimity-map)
  ;; (require 'sublimity-attractive)
  :config
  (setq sublimity-scroll-weight 10
	sublimity-scroll-drift-length 5)
  ;; (setq sublimity-map-size 20)
  ;; (setq sublimity-map-fraction 0.3)
  ;; (setq sublimity-map-text-scale -7)
  ;; (add-hook 'sublimity-map-setup-hook
	    ;; (lambda ()
	      ;; (setq buffer-face-mode-face '(:family "Monospace"))
	      ;; (buffer-face-mode)))
  ;; (sublimity-map-set-delay 5)
  )


(provide 'init-sublimity)
