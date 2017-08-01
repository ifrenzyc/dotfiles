(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1)

  ;; scroll one line at a time (less "jumpy" than defaults)
  ;; (setq mouse-wheel-scroll-amount '(3 ((shift) . 3) ((control) . nil))) ;; one line at a time
  ;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  ;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
  ;; (setq scroll-step 1) ;; keyboard scroll one line at a time
  ;; (setq mouse-wheel-progressive-speed nil)
  )
(provide 'init-smooth-scrolling)
