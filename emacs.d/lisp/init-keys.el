;; (bind-map my-base-leader-map
;;  :keys ("M-m")
;; (bind-map my-elisp-map
;;  :keys ("M-m m" "M-RET")
;;  :major-modes (emacs-lisp-mode
;;                lisp-interaction-mode))

(bind-keys :prefix-map itsyc-leader-map :prefix "M-SPC")

(bind-map-set-keys itsyc-leader-map
  "TF" 'toggle-frame-fullscreen
  "TM" 'toggle-frame-maximized
  "<tab>" 'mode-line-other-buffer
  "wh" 'windmove-left
  "wl" 'windmove-right
  "wk" 'windmove-up
  "wj" 'windmove-down
  "w|" 'splict-window-right
  "w-" 'split-window-below
  "wc" 'delete-window
  "jf" 'avy-goto-char-in-line
  "jc" 'avy-goto-char
  "jw" 'avy-goto-word-1
  "jl" 'avy-goto-line
  )

(use-package back-button
  :ensure t
  :init
  (back-button-mode 1)
  ;; C-x C-<SPC>	go back in global-mark-ring, respects prefix arg
  ;; C-x C-<left>	go back in global-mark-ring
  ;; C-x C-<right>	go forward in global-mark-ring
  ;; C-x <SPC>	go back in (buffer-local) mark-ring, respects prefix arg
  ;; C-x <left>	go back in (buffer-local) mark-ring
  ;; C-x <right>	go forward in (buffer-local) mark-ring)
  (global-set-key (kbd "M-<left>") 'back-button-global-backward)
  (global-set-key (kbd "M-<right>") 'back-button-global-forward)
  )

(setq-default ediff-forward-word-function 'forward-char)
(setq ediff-split-window-function 'split-window-horizontally)

;; mac switch meta key
(defun mac-switch-meta nil 
  "switch meta between Option and Command"
  (interactive)
  (if (eq mac-option-modifier nil)
      (progn
	(setq mac-option-modifier 'meta)
	(setq mac-command-modifier 'hyper)
	)
    (progn 
      (setq mac-option-modifier nil)
      (setq mac-command-modifier 'meta)
      )
    )
  )


(provide 'init-keys)
