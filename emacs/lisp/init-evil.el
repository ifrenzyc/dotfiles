(use-package evil-leader
	:ensure t
	:init
	(global-evil-leader-mode)
	:config
	(evil-leader/set-leader ",")
	(evil-leader/set-key
		"a" 'ack-and-a-half
		"bb" 'ido-switch-buffer
		"be" 'ibuffer
		"d" 'neotree
		"f" 'ido-find-file
		"g" 'magit-status
		"h" 'evil-search-highlight-persist-remove-all
		"jj" 'avy-goto-word-or-subword-1
		"q" 'delete-window
		"w" 'save-buffer
		"<tab>" 'mode-line-other-buffer
		;; "wh" 'windmove-left
		;; "wl" 'windmove-right
		;; "wk" 'windmove-up
		;; "wj" 'windmove-down
		;; "w|" 'split-window-right
		;; "w-" 'split-window-below
		;; "wc" 'delete-window
		;; "xb" 'ido-switch-buffer
		;; "xc" 'save-buffers-kill-terminal
		;; "jj" 'w3mext-search-js-api-mdn
		;; "xz" 'suspend-frame
		;; "xvv" 'vc-next-action
		;; "xv=" 'vc-diff
		;; "xvl" 'vc-print-log
		;; "j" 'dired-jump
		;; "SPC" 'evil-buffer
		;; "F" 'find-file
		;; "f" 'projectile-find-file
		;; "b" 'bs-show
		;; "B" 'ibuffer
		;; "x" 'execute-extended-command
		;; "d" 'kill-this-buffer
		;; "q" 'kill-buffer-and-window
		))

;; @see http://wikemacs.org/wiki/Evil
(use-package evil
	:ensure t
	:init
	(evil-mode 1)
	:config
	;;	(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
	;; or (setq-default evil-escape-key-sequence "jj")
	;; use evil-escape

	;; @see http://nathantypanski.com/blog/2014-08-03-a-vim-like-emacs-config.html
	(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
	(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
	(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
	(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

	;; esc quits
	;; @see http://stackoverflow.com/questions/8483182/evil-mode-best-practice
	(defun minibuffer-keyboard-quit ()
		"Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
		(interactive)
		(if (and delete-selection-mode transient-mark-mode mark-active)
				(setq deactivate-mark  t)
			(when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
			(abort-recursive-edit)))
	(define-key evil-normal-state-map [escape] 'keyboard-quit)
	(define-key evil-visual-state-map [escape] 'keyboard-quit)
	(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
	(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
	(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
	(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
	(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

	(define-key evil-normal-state-map "\C-y" 'yank)
	(define-key evil-insert-state-map "\C-y" 'yank)
	(define-key evil-visual-state-map "\C-y" 'yank)
	(define-key evil-insert-state-map "\C-e" 'end-of-line)
	;; (define-key evil-normal-state-map "\C-w" 'evil-delete)
	;; (define-key evil-insert-state-map "\C-w" 'evil-delete)
	;; (define-key evil-visual-state-map "\C-w" 'evil-delete)
	;; (define-key evil-insert-state-map "\C-r" 'search-backward)

	;; Split and move the cursor to the new split
	(define-key evil-normal-state-map (kbd "-")
		(lambda ()
			(interactive)
			(split-window-vertically)
			(other-window 1)))
	(define-key evil-normal-state-map (kbd "|")
		(lambda ()
			(interactive)
			(split-window-horizontally)
			(other-window 1)))

	(add-hook 'evil-after-load-hook
						(lambda ()
							;; config
							))
	;; C-a for redo the last insertion
	;; @see http://emacs.stackexchange.com/questions/14521/insert-mode-make-c-a-insert-previously-inserted-text
	(defun my-evil-paste-last-insertion ()
		(interactive)
		(evil-paste-from-register ?.))

	(eval-after-load 'evil-maps
		'(define-key evil-insert-state-map (kbd "C-a") 'my-evil-paste-last-insertion))

	;; C-u to scroll up or delete indent
	;; @see http://stackoverflow.com/questions/14302171/ctrl-u-in-emacs-when-using-evil-key-bindings
	(setq evil-want-C-u-scroll t)
	(setq evil-want-C-i-jump t)
	(set-cursor-color "DarkCyan")
	;; (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
	;; (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
	;; (define-key evil-insert-state-map (kbd "C-u")
	;; 	(lambda ()
	;; 		(interactive)
	;; 		(evil-delete (point-at-bol) (point))))
	;; (setq evil-normal-state-tag   (propertize " N " 'face '((:background "green" :foreground "black"))) ;; NORMAL
	;; 			evil-emacs-state-tag    (propertize " E " 'face '((:background "orange" :foreground "black"))) ;; EMACS
	;; 			evil-insert-state-tag   (propertize " I " 'face '((:background "red")))  ;; INSERT
	;; 			evil-motion-state-tag   (propertize " M " 'face '((:background "blue")))  ;; MOTION
	;; 			evil-visual-state-tag   (propertize " V " 'face '((:background "grey80" :foreground "black"))) ;; VISUAL
	;; 			evil-operator-state-tag (propertize " O " 'face '((:background "purple")))) ;; OPER

;; Great evil org mode keyboard shortcuts cribbed from cofi
(evil-define-key 'normal org-mode-map
  (kbd "RET") 'org-open-at-point
  "za"        'org-cycle
  "zA"        'org-shifttab
  "zm"        'hide-body
  "zr"        'show-all
  "zo"        'show-subtree
  "zO"        'show-all
  "zc"        'hide-subtree
  "zC"        'hide-all
  (kbd "M-h") 'org-metaleft
  (kbd "M-j") 'org-shiftleft
  (kbd "M-k") 'org-shiftright
  (kbd "M-l") 'org-metaright
  (kbd "M-H") 'org-metaleft
  (kbd "M-J") 'org-metadown
  (kbd "M-K") 'org-metaup
  (kbd "M-L") 'org-metaright)

(evil-define-key 'normal orgstruct-mode-map
  (kbd "RET") 'org-open-at-point
  "za"        'org-cycle
  "zA"        'org-shifttab
  "zm"        'hide-body
  "zr"        'show-all
  "zo"        'show-subtree
  "zO"        'show-all
  "zc"        'hide-subtree
  "zC"        'hide-all
  (kbd "M-h") 'org-metaleft
  (kbd "M-j") 'org-shiftleft
  (kbd "M-k") 'org-shiftright
  (kbd "M-l") 'org-metaright
  (kbd "M-H") 'org-metaleft
  (kbd "M-J") 'org-metadown
  (kbd "M-K") 'org-metaup
  (kbd "M-L") 'org-metaright)

(evil-define-key 'insert org-mode-map
  (kbd "M-h") 'org-metaleft
  (kbd "M-j") 'org-shiftleft
  (kbd "M-k") 'org-shiftright
  (kbd "M-l") 'org-metaright
  (kbd "M-H") 'org-metaleft
  (kbd "M-J") 'org-metadown
  (kbd "M-K") 'org-metaup
  (kbd "M-L") 'org-metaright)

(evil-define-key 'insert orgstruct-mode-map
  (kbd "M-j") 'org-shiftleft
  (kbd "M-k") 'org-shiftright
  (kbd "M-H") 'org-metaleft
  (kbd "M-J") 'org-metadown
  (kbd "M-K") 'org-metaup
  (kbd "M-L") 'org-metaright)

;; @see http://emacs.stackexchange.com/questions/10350/how-can-i-add-a-new-colon-command-to-evil
;; @see http://stackoverflow.com/questions/12558019/shortcut-to-open-a-specific-file-in-emacs
;; (eval-after-load 'evil-ex
;; '(define-key evil-ex-map "notes" (lambda() (interactive)(find-file "~/src/yangc/itsycnotes/home.org"))))
	;; '(define-key evil-ex-map "notes" 'helm-buffers-list))
	)


(use-package key-chord
	:ensure t
	:init
	(key-chord-mode 1)
	:config
	(key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

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


(use-package evil-search-highlight-persist
	:ensure t
	:init
	(global-evil-search-highlight-persist t))

(use-package avy
	:ensure t
	:init
	(setq avy-background t)
	)

(provide 'init-evil)
