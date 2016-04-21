(use-package hc-zenburn-theme
  :init
  (defvar zenburn-override-colors-alist
    '(("zenburn-bg+05" . "#282828")
      ("zenburn-bg+1"  . "#2F2F2F")
      ("zenburn-bg+2"  . "#3F3F3F")
      ("zenburn-bg+3"  . "#4F4F4F")))
  (load-theme 'zenburn t))


(provide 'init-themes)
