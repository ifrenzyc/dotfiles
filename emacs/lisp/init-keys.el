;; (bind-map my-base-leader-map
;;  :keys ("M-m")
;; (bind-map my-elisp-map
;;  :keys ("M-m m" "M-RET")
;;  :major-modes (emacs-lisp-mode
;;                lisp-interaction-mode))


;; (bind-keys :prefix-map itsyc/leader-map :prefix "M-SPC")
(use-package bind-map
  :ensure t
  :config
  (bind-map itsyc/leader-map
	    :keys ("M-SPC")
	    :evil-keys ("SPC")
	    :evil-states (normal motion visual)))

;; (bind-map-set-keys my-base-leader-map
;; "c" 'compile
;; "C" 'check
;; ...
;; )
;; is the same as
;; (define-key my-base-leader-map (kbd "c") 'compile)
;; (define-key my-base-leader-map (kbd "C") 'check)
;; ...

;; (bind-map-set-key-defaults my-base-leader-map
;; "c" 'compile
;; ...
;; )
;; is the same as
;; (unless (lookup-key my-base-leader-map (kbd "c"))
;;   (define-key my-base-leader-map (kbd "c") 'compile))
;; ...
(bind-map-set-keys itsyc/leader-map
		   "tf" 'toggle-frame-fullscreen
		   "tm" 'toggle-frame-maximized
		   "<tab>" 'mode-line-other-buffer
		   "wh" 'windmove-left
		   "wl" 'windmove-right
		   "wk" 'windmove-up
		   "wj" 'windmove-down
		   "w|" 'splict-window-right
		   "w-" 'split-window-below
		   "wc" 'delete-window
		   "bb" 'ido-switch-buffer
		   ;; "jf" 'avy-goto-char-in-line
		   ;; "jc" 'avy-goto-char
		   ;; "jw" 'avy-goto-word-1
		   ;; "jl" 'avy-goto-line
		   )


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
