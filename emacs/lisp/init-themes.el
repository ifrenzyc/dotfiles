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


;; (use-package eink-theme
;; 	:ensure t
;; 	:init
;; 	(load-theme 'eink t))

;; (use-package phoenix-dark-mono-theme
;; :ensure t
;; 	:init
;; 	(load-theme 'phoenix-dark-mono t))


;; (use-package base16-theme
;; 	:ensure t
;; 	:init
;; 	(load-theme 'base16-grayscale-dark t))

(use-package rainbow-delimiters
	:ensure t
	:config
	(add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; M-x color-theme-sanityinc-tomorrow-day
;; M-x color-theme-sanityinc-tomorrow-night
;; M-x color-theme-sanityinc-tomorrow-blue
;; M-x color-theme-sanityinc-tomorrow-bright
;; M-x color-theme-sanityinc-tomorrow-eighties
;; (use-package color-theme-sanityinc-tomorrow
;; 	:ensure t
;; 	:config
;; 	(color-theme-sanityinc-tomorrow--define-theme day))

(provide 'init-themes)
