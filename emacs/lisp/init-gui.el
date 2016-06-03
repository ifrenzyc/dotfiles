;; 取消工具栏
(tool-bar-mode nil)

;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示行列号
(setq linum-mode nil)
(setq global-linum-mode nil)

;; 打开括号匹配显示模式
(show-paren-mode t)

(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; 在行首 C-k 时，同时删除该行
(setq-default kill-whole-line t)

;; 括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处。
(setq show-paren-style 'parenthesis)

;; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(setq mouse-avoidance-mode 'animate)

(setq visible-bell t)
(setq ring-bell-function 'ignore)  ;; visible-bell doesn’t work well on OS X, so disable those notifications completely

(global-visual-line-mode t)
(setq word-wrap t)
(setq truncate-lines t)


;; @see http://ergoemacs.org/emacs/whitespace-mode.html
;; @see http://xahlee.info/comp/unicode_arrows.html
;; “·”, MIDDLE DOT, 183
;; “¶”, PILCROW SIGN, 182
;; “↵”, DOWNWARDS ARROW WITH CORNER LEFTWARDS, 8629
;; “▷”, WHITE RIGHT POINTING TRIANGLE, 9655
;; “▶”, BLACK RIGHT-POINTING TRIANGLE, 9654
;; “→”, RIGHTWARDS ARROW, 8594
;; “↦”, RIGHTWARDS ARROW FROM BAR, 8614
;; “⇥”, RIGHTWARDS ARROW TO BAR, 8677

;; lines lines-tail newline trailing space-before-tab space-afte-tab empty
;; indentation-space indentation indentation-tab tabs spaces
(use-package whitespace
	:ensure t
	:init
	(setq whitespace-style '(face
													 trailing
													 ;;tabs
													 ;;spaces
													 ;;tab-mark
													 ;;space-mark
;;													 newline
	;;												 newline-mark))
													 ))

;;	(setq whitespace-display-mappings '(
																			;; (space-mark   ?\     [?\u00B7]     [?.])
																			;; (space-mark   ?\xA0  [?\u00A4]     [?_])
																			;; (newline ?\n    [?↵ ?\n])
																			;;(newline-mark ?\n    [?↵ ?\n])))
																			;;(newline ?\n    [?↴ ?\n])
																			;;(newline-mark ?\n    [?↴ ?\n])))
	(setq whitespace-line-column 120)

	;; (set-face-attribute 'whitespace-space nil :background nil :foreground "gray30")
	(global-whitespace-mode t)
	(if window-system (progn
											;;(setq initial-frame-alist '((width . 202)(height . 58)(top . 0)(left . 48)))
											;;		    (set-background-color "Black")
											;;  (set-foreground-color "White")
											(set-cursor-color "Gray")
											;; make it delete trailing whitespace
											(add-hook 'before-save-hook 'delete-trailing-whitespace)

											(add-hook 'after-init-hook
																(lambda () (set-face-attribute 'whitespace-newline nil
																															 :foreground "#AAA"
																															 :weight 'bold)))
											)))
(display-battery-mode t)


;; show relative linum
;; (use-package linum-relative
;;   :ensure t
;;   :config
;;   (linum-relative-on))

;; 取消滚动栏
(use-package yascroll
	:ensure t
	:init
	(set-scroll-bar-mode nil)
	(global-yascroll-bar-mode 1)
	)

(use-package smooth-scrolling
	:ensure t
  :init
	(smooth-scrolling-mode 1))

;; (use-package sublimity
;;   :ensure t
;;   :init
;;   (sublimity-mode 1)
;;   (set-scroll-bar-mode nil)
;;   (require 'sublimity-scroll)
;;   ;; (require 'sublimity-map)
;;   ;; (require 'sublimity-attractive)
;;   :config
;;   (setq sublimity-scroll-weight 10
;; 	sublimity-scroll-drift-length 5)
;;   ;; (setq sublimity-map-size 20)
;;   ;; (setq sublimity-map-fraction 0.3)
;;   ;; (setq sublimity-map-text-scale -7)
;;   ;; (add-hook 'sublimity-map-setup-hook
;; 	    ;; (lambda ()
;; 	      ;; (setq buffer-face-mode-face '(:family "Monospace"))
;; 	      ;; (buffer-face-mode)))
;;   ;; (sublimity-map-set-delay 5)
;;   )

(provide 'init-gui)
