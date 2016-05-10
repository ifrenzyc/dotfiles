(use-package hc-zenburn-theme
  :ensure t
  :init
  (defvar zenburn-override-colors-alist
    '(("zenburn-bg+05" . "#282828")
      ("zenburn-bg+1"  . "#2F2F2F")
      ("zenburn-bg+2"  . "#3F3F3F")
      ("zenburn-bg+3"  . "#4F4F4F")))
  (load-theme 'zenburn t)
  :config
  (set-face-attribute 'region nil :background "#666"))

;; (load-theme 'adwaita t)
;; (load-theme 'light-blue t)

;; (use-package molokai-theme
  ;;:ensure t
  ;;:init
  ;;(load-theme 'molokai t))


(provide 'init-themes)
