;; @see https://github.com/gorakhargosh/emacs.d/blob/master/themes/color-theme-less.el


;; (use-package hc-zenburn-theme
;; 	:ensure t
;; 	:init
;; 	(defvar zenburn-override-colors-alist
;; 		'(("zenburn-bg+05" . "#282828")
;; 			("zenburn-bg+1"  . "#2F2F2F")
;; 			("zenburn-bg+2"  . "#3F3F3F")
;; 			("zenburn-bg+3"  . "#4F4F4F")))
;; 	(load-theme 'zenburn t)
;; 	:config
;; 	(set-face-attribute 'region nil :background "#666"))

;; (load-theme 'adwaita t)
;; (load-theme 'light-blue t)

;; (use-package molokai-theme
;; :ensure t
;; :init
;; (load-theme 'molokai t))

;; (use-package monochrome-theme
;; 	:ensure t
;; 	:init
;; 	(load-theme 'monochrome t))

;; (use-package quasi-monochrome-theme
;; 	:ensure t
;; 	:init
;; 	(load-theme 'quasi-monochrome t))

;; @see https://github.com/dmand/eink.el
;; (use-package eink-theme
;; 	:ensure t
;; 	:init
;; 	(load-theme 'eink t))

;; (use-package phoenix-dark-mono-theme
;; :ensure t
;; 	:init
;; 	(load-theme 'phoenix-dark-mono t))

;; @see https://github.com/anler/minimal-theme
(use-package minimal-theme
	:ensure t
	:init
	(load-theme 'minimal t))

;; @see https://github.com/fgeller/basic-theme.el
;; (use-package basic-theme
;; 	:ensure t
;; 	:init
;; 	(load-theme 'basic t))

;; (defun mode-line-visual-toggle ()
;; 	(interactive)
;; 	(let ((faces-to-toggle '(mode-line mode-line-inactive))
;; 				(invisible-color "#e8e8e8")
;; 				(visible-color "#a1b56c"))
;; 		(cond ((string= visible-color (face-attribute 'mode-line :background))
;; 					 (mapcar (lambda (face)
;; 										 (set-face-background face invisible-color)
;; 										 (set-face-attribute face nil :height 20))
;; 									 faces-to-toggle))
;; 					(t
;; 					 (mapcar (lambda (face)
;; 										 (set-face-background face visible-color)
;; 										 (set-face-attribute face nil :height (face-attribute 'default :height)))
;; 									 faces-to-toggle)))))


;; (use-package paper-theme
;; 	:ensure t
;; 	:init
;; 	(load-theme 'paper t))


;; (use-package base16-theme
;; 	:ensure t
;; 	:init
;; 	(load-theme 'base16-grayscale-dark t))
;; (use-package base16-theme
;; 	:ensure t
;; 	:init
;; 	(load-theme 'base16-solarized-dark t))
;; (use-package base16-theme
;; 	:ensure t
;; 	:init
;; 	(load-theme 'base16-ocean-dark t))
;; (use-package base16-theme
;; 	:ensure t
;; 	:init
;; 	(load-theme 'base16-ocean-dark t))

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

;; (use-package powerline
;; 	:ensure t
;; 	:init
;; 	(powerline-vim-theme)
;; 	)


;; (use-package powerline-evil
;; 	:ensure t
;; 	:init
;; 	(powerline-evil-vim-color-theme))


;; (use-package smart-mode-line-powerline-theme :ensure t)

;; (use-package smart-mode-line
;; 	:ensure t
;; 	:init
;; 	(setq powerline-arrow-shape 'arrow)
;; 	(setq ns-use-srgb-colorspace t)
;; 	(setq powerline-default-separator-dir '(left . right))
;; 	(setq sml/no-confirm-load-theme t)
;; 	;; (setq sml/theme 'dark)
;; 	;; (setq sml/theme 'light)
;; 	;; (setq sml/theme 'respectful)
;; 	(setq sml/theme 'powerline)
;; 	(sml/setup))

(use-package powerline
	:ensure t
	:config (progn
						;; Wave seperators please
						(setq powerline-default-separator 'wave)

						;; Use spacemacs' mode line
						;; @see https://libraries.io/emacs/spaceline
						;; @see https://github.com/TeMPOraL/nyan-mode
						;; @see https://github.com/TheBB/spaceline
						(use-package spaceline
							:ensure t
							:config (progn
												(require 'spaceline-config)
												(require 'spaceline-segments)
												(spaceline-spacemacs-theme)
												(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
												))
						(use-package nyan-mode
							:ensure t
							:init
							(progn
								(nyan-mode)
								(setq nyan-wavy-trail t))
							:config (nyan-start-animation)
							)))

(provide 'init-themes)
