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

;; switch meta key
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom)
  (setq which-key-side-window-location 'bottom)
  (which-key-setup-minibuffer)
  ;; (setq which-key-popup-type 'minibuffer)
  (add-to-list 'which-key-key-replacement-alist '("TAB" . "↹"))
  (add-to-list 'which-key-key-replacement-alist '("RET" . "⏎"))
  (add-to-list 'which-key-key-replacement-alist '("DEL" . "⇤"))
  (add-to-list 'which-key-key-replacement-alist '("SPC" . "␣"))
  (setq which-key-sort-order 'which-key-key-order)
  )


(provide 'init-keys)
