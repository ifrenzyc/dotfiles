(require 'color-theme-sanityinc-tomorrow)
(require 'sanityinc-tomorrow-day-theme)
(require 'sanityinc-tomorrow-night-theme)

;(color-theme-sanityinc-solarized-dark)
;(color-theme-sanityinc-solarized-light)
;(color-theme-sanityinc-tomorrow-blue)
;(color-theme-sanityinc-tomorrow-bright)
;; (color-theme-sanityinc-tomorrow-eighties)
;(color-theme-sanityinc-tomorrow-night)
					;(color-theme-sanityinc-tomorrow-day)

					;(add-hook 'after-init-hook 
					;  (lambda () (load-theme 'cyberpunk t)))

;;------------------------------------------------------------------------------
;; Old-style color theming support (via color-theme.el)
;;------------------------------------------------------------------------------
(defcustom window-system-color-theme 'color-theme-sanityinc-solarized-dark
  "Color theme to use in window-system frames.
If Emacs' native theme support is available, this setting is
ignored: use `custom-enabled-themes' instead."
  :type 'symbol)

(defcustom tty-color-theme 'color-theme-terminal
  "Color theme to use in TTY frames.
If Emacs' native theme support is available, this setting is
ignored: use `custom-enabled-themes' instead."
  :type 'symbol)

(unless (boundp 'custom-enabled-themes)
  (defun color-theme-terminal ()
    (interactive)
    (color-theme-sanityinc-solarized-dark))

  (defun apply-best-color-theme-for-frame-type (frame)
    (with-selected-frame frame
      (funcall (if window-system
                   window-system-color-theme
                 tty-color-theme))))

  (defun reapply-color-themes ()
    (interactive)
    (mapcar 'apply-best-color-theme-for-frame-type (frame-list)))

  (set-variable 'color-theme-is-global nil)
  (add-hook 'after-make-frame-functions 'apply-best-color-theme-for-frame-type)
  (add-hook 'after-init-hook 'reapply-color-themes)
  (apply-best-color-theme-for-frame-type (selected-frame)))


;;------------------------------------------------------------------------------
;; New-style theme support, in which per-frame theming is not possible
;;------------------------------------------------------------------------------

;; If you don't customize it, this is the theme you get.
;(setq-default custom-enabled-themes '(sanityinc-solarized-light)) 
;; (setq-default custom-enabled-themes '(sanityinc-tomorrow-night))
;; (require-package 'sublime-themes)
;; (use-package sublime-themes :ensure t)

;(require-package 'color-theme-tangotango)
;(use-package color-theme-tangotango :ensure t)
;(load-theme 'color-theme-tangotango)
; (require-package 'base16-theme)
; (require 'base16-irblack-dark)
;(use-package base16-theme
;  :ensure t
;  :config
;  :init
;  (load-theme base16-irblack-dark)

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)


(defvar zenburn-override-colors-alist
  '(("zenburn-bg+05" . "#282828")
    ("zenburn-bg+1"  . "#2F2F2F")
    ("zenburn-bg+2"  . "#3F3F3F")
    ("zenburn-bg+3"  . "#4F4F4F")))
(load-theme 'zenburn t)
;; (load-theme 'base16-railscasts-dark t)
;; (load-theme 'base16-ateliersulphurpool-light t)
;; (load-theme 'base16-monokai-dark t)



;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------
(defun light ()
  "Activate a light color theme."
  (interactive)
  (color-theme-sanityinc-solarized-light))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (color-theme-sanityinc-solarized-dark))


(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)

(provide 'init-themes)
