(use-package evil-leader
  :ensure t
  :init
  (global-evil-leader-mode)
  :config
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "xf" 'ido-find-file
    "bb" 'ido-switch-buffer
    "d" 'neotree
    "<tab>" 'mode-line-other-buffer
    "wh" 'windmove-left
    "wl" 'windmove-right
    "wk" 'windmove-up
    "wj" 'windmove-down
    "w|" 'splict-window-right
    "w-" 'split-window-below
    "wc" 'delete-window
    ;; "xb" 'ido-switch-buffer
    ;; "xc" 'save-buffers-kill-terminal
    ;; "jj" 'w3mext-search-js-api-mdn
    ;; "xz" 'suspend-frame
    ;; "xvv" 'vc-next-action
    ;; "xv=" 'vc-diff
    ;; "xvl" 'vc-print-log
    ))

(use-package evil
  :ensure t
  :init
  (evil-mode 1)
  :config
  ;; @see http://nathantypanski.com/blog/2014-08-03-a-vim-like-emacs-config.html
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right))


(use-package evil-nerd-commenter
  :ensure t
  :init
  (evilnc-default-hotkeys)
  :config
  ;; Emacs key bindings
  (global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
  (global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
  (global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
  (global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

  (evil-leader/set-key
    "ci" 'evilnc-comment-or-uncomment-lines
    "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
    "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
    "cc" 'evilnc-copy-and-comment-lines
    "cp" 'evilnc-comment-or-uncomment-paragraphs
    "cr" 'comment-or-uncomment-region
    "cv" 'evilnc-toggle-invert-comment-line-by-line
    "\\" 'evilnc-comment-operator ; if you prefer backslash key
    ))

(use-package evil-surround
  :ensure t
  :init
  (global-evil-surround-mode 1)
  )

(provide 'init-evil)
