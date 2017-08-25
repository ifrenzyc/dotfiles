(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "elpa/eink" user-emacs-directory))
(defconst *is-a-mac* (eq system-type 'darwin))
(when (memq window-system '(mac ns))
  (setq ns-use-srgb-colorspace nil))

;; @see http://stackoverflow.com/questions/12558019/shortcut-to-open-a-specific-file-in-emacs
(set-register ?e (cons 'file "~/.dotfiles/emacs/init.el"))

;; 自动的在文件末增加一新行
(setq require-final-newline t)

(setq default-tab-width 2)

;; tabs are truly evil
(setq-default indent-tabs-mode nil)

;;; warn when opening files bigger than 100MB (default is 10MB)
(setq large-file-warning-threshold 100000000)

(use-package diminish
  :ensure t)

(use-package autothemer
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-env "GOPATH"))
  )

;; start the emacs server
(use-package server
  :commands (server-running-p server-start)
  :init (unless (server-running-p)
          (server-start)))

(use-package auto-package-update
  :ensure t
  :init (progn (setq auto-package-update-interval 3)
               (with-demoted-errors (auto-package-update-maybe))))

;; 设置个人信息
(setq user-full-name "Yang Chuang")
(setq user-mail-address "ifrenzyc@gmail.com")

;; 设定不产生备份文件
(setq make-backup-files nil)
(setq-default make-backup-files nil)  ; 不生成临时文件

;; 取消自动保存模式
(setq auto-save-mode nil)

(setq backup-by-copying nil)

;; Save a list of recent files visited. (open recent file with C-x f)
(recentf-mode 1)
(setq recentf-max-saved-items 1000) ;; just 20 is too recent

(save-place-mode 1)

;; 取消工具栏
(tool-bar-mode nil)

;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。
(fset 'yes-or-no-p 'y-or-n-p)

;;; show human readable file sizes in dired
(setq dired-listing-switches "-alh")

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

(global-visual-line-mode nil)
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
                           ;;                           newline
                           ;;                         newline-mark))
                           ))

  ;;  (setq whitespace-display-mappings '(
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
                      ;;        (set-background-color "Black")
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
  (global-yascroll-bar-mode 1))

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
;;  sublimity-scroll-drift-length 5)
;;   ;; (setq sublimity-map-size 20)
;;   ;; (setq sublimity-map-fraction 0.3)
;;   ;; (setq sublimity-map-text-scale -7)
;;   ;; (add-hook 'sublimity-map-setup-hook
;;      ;; (lambda ()
;;        ;; (setq buffer-face-mode-face '(:family "Monospace"))
;;        ;; (buffer-face-mode)))
;;   ;; (sublimity-map-set-delay 5)
;;   )

;;; respect ansi colors
(ansi-color-for-comint-mode-on)

;;; ansi colors in compilation mode
(ignore-errors
  (defun itsyc/colorize-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (add-hook 'compilation-filter-hook itsyc/colorize-compilation-buffer))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)
                          (bookmarks . 5))))

;; @see https://github.com/gorakhargosh/emacs.d/blob/master/themes/color-theme-less.el
;; (use-package hc-zenburn-theme
;;   :ensure t
;;   :init
;;   (defvar zenburn-override-colors-alist
;;     '(("zenburn-bg+05" . "#282828")
;;       ("zenburn-bg+1"  . "#2F2F2F")
;;       ("zenburn-bg+2"  . "#3F3F3F")
;;       ("zenburn-bg+3"  . "#4F4F4F")))
;;   (load-theme 'zenburn t)
;;   :config
;;   (set-face-attribute 'region nil :background "#666"))

(use-package gruvbox-theme
  :ensure t
  :config
  ;; (load-theme  'gruvbox-dark-medium t))
  (load-theme  'gruvbox-dark-soft t))
;; (load-theme  'gruvbox-dark-hard t))
;; (load-theme  'gruvbox-light-medium t))
;; (load-theme  'gruvbox-light-soft t))
;; (load-theme  'gruvbox-light-hard t))

;; (use-package zerodark-theme
;;   :demand t
;;   :config
;;   (progn
;;     (defun set-selected-frame-dark ()
;;       (interactive)
;;       (let ((frame-name (cdr (assq 'name (frame-parameters (selected-frame))))))
;;         (call-process-shell-command
;;          (format
;;           "xprop -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT 'dark' -name '%s'"
;;           frame-name))))

;;     (when (window-system)
;;       (load-theme 'zerodark t)
;;       (zerodark-setup-modeline-format)
;;       (set-selected-frame-dark)
;;       (setq frame-title-format '(buffer-file-name "%f" ("%b"))))))

;; (use-package all-the-icons
;;   :ensure t)
;; Solarized
;; https://github.com/sellout/emacs-color-theme-solarized/pull/187
;; (use-package color-theme
;;   :ensure t)
;; (setq color-themes '())
;; (use-package color-theme-solarized
;;   :ensure t
;;   :config
;;   (customize-set-variable 'frame-background-mode 'light)
;;   (load-theme 'solarized t))

;; (use-package color-theme
;;   :ensure t)
;; (setq color-themes '())
;; (load-theme 'adwaita t)

;; (use-package molokai-theme
;;   :ensure t
;;   :init
;;   (load-theme 'molokai t))

;; (use-package monochrome-theme
;;  :ensure t
;;  :init
;;  (load-theme 'monochrome t))

;; (use-package quasi-monochrome-theme
;;  :ensure t
;;  :init
;;  (load-theme 'quasi-monochrome t))

;; @see https://github.com/dmand/eink.el
;; (use-package eink-theme
;;  :ensure t
;;  :init
;;  (load-theme 'eink t))

;; (use-package phoenix-dark-mono-theme
;; :ensure t
;;  :init
;;  (load-theme 'phoenix-dark-mono t))

;; @see https://github.com/anler/minimal-theme
;; (use-package minimal-theme
;;   :ensure t
;;   :init
;;   (load-theme 'minimal t))

;; @see https://github.com/fgeller/basic-theme.el
;; (use-package basic-theme
;;  :ensure t
;;  :init
;;  (load-theme 'basic t))

;; (defun mode-line-visual-toggle ()
;;  (interactive)
;;  (let ((faces-to-toggle '(mode-line mode-line-inactive))
;;        (invisible-color "#e8e8e8")
;;        (visible-color "#a1b56c"))
;;    (cond ((string= visible-color (face-attribute 'mode-line :background))
;;           (mapcar (lambda (face)
;;                     (set-face-background face invisible-color)
;;                     (set-face-attribute face nil :height 20))
;;                   faces-to-toggle))
;;          (t
;;           (mapcar (lambda (face)
;;                     (set-face-background face visible-color)
;;                     (set-face-attribute face nil :height (face-attribute 'default :height)))
;;                   faces-to-toggle)))))

;; (use-package paper-theme
;;  :ensure t
;;  :init
;;  (load-theme 'paper t))

;; (use-package base16-theme
;;   :ensure t
;;   :init
;;   (load-theme 'base16-monokai t))
;; (load-theme 'base16-google-dark t))
;; (load-theme 'base16-solarized-light t))
;; (load-theme 'base16-tomorrow-night t))
;; (load-theme 'base16-grayscale-dark t))
;; (load-theme 'base16-spacemacs-theme t))

;; (use-package leuven-theme
;;   :ensure t
;;   :init
;;   (load-theme 'leuven t)
;;   :config
;;   ;; Fontify the whole line for headings (with a background color).
;;   (setq org-fontify-whole-heading-line t))

;; (use-package kaolin-theme
;;   :ensure t
;;   :init
;;   (load-theme 'kaolin t))

;; Got following from Purcell's emacs configuration
;; From https://github.com/purcell/emacs.d

;; (use-package color-theme-sanityinc-solarized
;;   :ensure t
;;   :defer t)
;; (use-package color-theme-sanityinc-tomorrow
;;   :ensure t
;;   :defer t)
;; ;;------------------------------------------------------------------------------
;; ;; Old-style color theming support (via color-theme.el)
;; ;;------------------------------------------------------------------------------
;; (defcustom window-system-color-theme 'color-theme-sanityinc-solarized-dark
;;   "Color theme to use in window-system frames.
;;   If Emacs' native theme support is available, this setting is
;;   ignored: use `custom-enabled-themes' instead."
;;   :type 'symbol)

;; (defcustom tty-color-theme 'color-theme-terminal
;;   "Color theme to use in TTY frames.
;;   If Emacs' native theme support is available, this setting is
;;   ignored: use `custom-enabled-themes' instead."
;;   :type 'symbol)

;; (unless (boundp 'custom-enabled-themes)
;;   (defun color-theme-terminal ()
;;     (interactive)
;;     (color-theme-sanityinc-solarized-dark))

;;   (defun apply-best-color-theme-for-frame-type (frame)
;;     (with-selected-frame frame
;;       (funcall (if window-system
;;                    window-system-color-theme
;;                  tty-color-theme))))

;;   (defun reapply-color-themes ()
;;     (interactive)
;;     (mapcar 'apply-best-color-theme-for-frame-type (frame-list)))

;;   (set-variable 'color-theme-is-global nil)
;;   (add-hook 'after-make-frame-functions 'apply-best-color-theme-for-frame-type)
;;   (add-hook 'after-init-hook 'reapply-color-themes)
;;   (apply-best-color-theme-for-frame-type (selected-frame)))

;; ;;------------------------------------------------------------------------------
;; ;; New-style theme support, in which per-frame theming is not possible
;; ;;------------------------------------------------------------------------------

;; ;; If you don't customize it, this is the theme you get.
;; (setq-default custom-enabled-themes '(sanityinc-solarized-light))

;; ;; Ensure that themes will be applied even if they have not been customized
;; (defun reapply-themes ()
;;   "Forcibly load the themes listed in `custom-enabled-themes'."
;;   (dolist (theme custom-enabled-themes)
;;     (unless (custom-theme-p theme)
;;       (load-theme theme)))
;;   (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

;; (add-hook 'after-init-hook 'reapply-themes)

;; ;;------------------------------------------------------------------------------
;; ;; Toggle between light and dark
;; ;;------------------------------------------------------------------------------
;; (defun light ()
;;   "Activate a light color theme."
;;   (interactive)
;;   (color-theme-sanityinc-solarized-light))

;; (defun dark ()
;;   "Activate a dark color theme."
;;   (interactive)
;;   (color-theme-sanityinc-solarized-dark))

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
;;  :ensure t
;;  :config
;;  (color-theme-sanityinc-tomorrow--define-theme day))

;; (use-package powerline
;;   :ensure t
;;   :config (progn
;;             ;; Wave seperators please
;;             ;; wave
;;             ;; arrow
;;             ;; rounded
;;             ;; zigzag
;;             ;; These two lines are just examples
;;             (setq powerline-arrow-shape 'wave)
;;             ;; (setq powerline-default-separator-dir '(right . left))
;;             ;; (setq powerline-default-separator 'nil)
;;             (powerline-vim-theme)))

;; (use-package powerline-evil
;;   :ensure t
;;   :config
;;   (powerline-evil-vim-color-theme))

;; (use-package smart-mode-line
;;   :ensure t
;;   :config
;;   (setq sml/no-confirm-load-theme t)
;;   (setq sml/theme 'dark)
;;   (sml/setup))

;; (use-package smart-mode-line-powerline-theme
;;   :ensure t
;;   :config (setq sml/theme 'powerline))

;; ;; (use-package airline-themes
;; ;;   :ensure t
;; ;;   :config
;; ;;   (load-theme 'airline-molokai))

;; (use-package nyan-mode
;;   :ensure t
;;   :init
;;   (progn
;;     (nyan-mode)
;;     (setq nyan-wavy-trail t))
;;   :config (nyan-start-animation))

;; 目前这个有 bug，会导致 emacs 卡死，但不知道具体原因
;; Use spacemacs' mode line
;; @see https://libraries.io/emacs/spaceline
;; @see https://github.com/TeMPOraL/nyan-mode
;; @see https://github.com/TheBB/spaceline
;; (use-package spaceline
;;   :ensure t
;;   :config (progn (use-package spaceline-config
;;   :ensure spaceline
;;   :config
;;   (spaceline-helm-mode 1)
;;   (spaceline-emacs-theme))
;;             (require 'spaceline-segments)
;;             (spaceline-spacemacs-theme)
;;             (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
;;             ))

;; (use-package spaceline-all-the-icons
;;   :after spaceline
;;   :config
;;   (spaceline-all-the-icons-theme)
;;   (spaceline-all-the-icons--setup-anzu)            ;; Enable anzu searching
;;   (spaceline-all-the-icons--setup-package-updates) ;; Enable package update indicator
;;   (spaceline-all-the-icons--setup-git-ahead)       ;; Enable # of commits ahead of upstream in git
;;   (spaceline-all-the-icons--setup-paradox)         ;; Enable Paradox mode line
;;   (spaceline-all-the-icons--setup-neotree)         ;; Enable Neotree mode line)
;;   )

(defface my-pl-segment1-active
  '((t (:foreground "#000000" :background "#E1B61A")))
  "Powerline first segment active face.")
(defface my-pl-segment1-inactive
  '((t (:foreground "#CEBFF3" :background "#3A2E58")))
  "Powerline first segment inactive face.")
(defface my-pl-segment2-active
  '((t (:foreground "#F5E39F" :background "#8A7119")))
  "Powerline second segment active face.")
(defface my-pl-segment2-inactive
  '((t (:foreground "#CEBFF3" :background "#3A2E58")))
  "Powerline second segment inactive face.")
(defface my-pl-segment3-active
  '((t (:foreground "#CEBFF3" :background "#3A2E58")))
  "Powerline third segment active face.")
(defface my-pl-segment3-inactive
  '((t (:foreground "#CEBFF3" :background "#3A2E58")))
  "Powerline third segment inactive face.")

(defun air--powerline-default-theme ()
  "Set up my custom Powerline with Evil indicators."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (seg1 (if active 'my-pl-segment1-active 'my-pl-segment1-inactive))
                          (seg2 (if active 'my-pl-segment2-active 'my-pl-segment2-inactive))
                          (seg3 (if active 'my-pl-segment3-active 'my-pl-segment3-inactive))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (let ((evil-face (powerline-evil-face)))
                                       (if evil-mode
                                           (powerline-raw (powerline-evil-tag) evil-face)
                                         ))
                                     (if evil-mode
                                         (funcall separator-left (powerline-evil-face) seg1))
                                     ;;(when powerline-display-buffer-size
                                     ;;  (powerline-buffer-size nil 'l))
                                     ;;(when powerline-display-mule-info
                                     ;;  (powerline-raw mode-line-mule-info nil 'l))
                                     (powerline-buffer-id seg1 'l)
                                     (powerline-raw "[%*]" seg1 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format seg1 'l))
                                     (powerline-raw " " seg1)
                                     (funcall separator-left seg1 seg2)
                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object seg2 'l))
                                     (powerline-major-mode seg2 'l)
                                     (powerline-process seg2)
                                     (powerline-minor-modes seg2 'l)
                                     (powerline-narrow seg2 'l)
                                     (powerline-raw " " seg2)
                                     (funcall separator-left seg2 seg3)
                                     (powerline-vc seg3 'r)
                                     (when (bound-and-true-p nyan-mode)
                                       (powerline-raw (list (nyan-create)) seg3 'l))))
                          (rhs (list (powerline-raw global-mode-string seg3 'r)
                                     (funcall separator-right seg3 seg2)
                                     (unless window-system
                                       (powerline-raw (char-to-string #xe0a1) seg2 'l))
                                     (powerline-raw "%4l" seg2 'l)
                                     (powerline-raw ":" seg2 'l)
                                     (powerline-raw "%3c" seg2 'r)
                                     (funcall separator-right seg2 seg1)
                                     (powerline-raw " " seg1)
                                     (powerline-raw "%6p" seg1 'r)
                                     (when powerline-display-hud
                                       (powerline-hud seg1 seg3)))))
                     (concat (powerline-render lhs)
                             (powerline-fill seg3 (powerline-width rhs))
                             (powerline-render rhs)))))))

(use-package powerline
  :ensure t
  :config
  (powerline-default-theme)
  (setq powerline-default-separator (if (display-graphic-p) 'slant
                                      nil))
  (air--powerline-default-theme)
  )

(use-package powerline-evil
 :ensure t)

(custom-set-faces
 '(org-block-begin-line
   ((t (:underline "#A7A6AA" :foreground "#3D4A41" :background "#9EAC8C" :height 0.9 :slant italic :weight semi-bold))))
 '(org-block-end-line
   ((t (:overline "#A7A6AA" :foreground "#3D4A41" :background "#9EAC8C" :height 0.9 :slant italic :weight semi-bold))))
 '(org-block
   ((t (:background "#333333"))))
 '(org-block-background
   ((t (:background "#333333"))))
 )

(use-package smartparens
  :ensure t
  :init (use-package smartparens-config)
  :config (progn (smartparens-global-mode t)
                 ;; highlights matching pairs
                 (show-smartparens-global-mode t)
                 ;; custom keybindings for smartparens mode
                 (define-key smartparens-mode-map (kbd "C-<left>") 'sp-forward-barf-sexp)
                 (define-key smartparens-mode-map (kbd "M-(") 'sp-forward-barf-sexp)
                 (define-key smartparens-mode-map (kbd "C-<right>") 'sp-forward-slurp-sexp)
                 (define-key smartparens-mode-map (kbd "M-)") 'sp-forward-slurp-sexp)

                 (define-key smartparens-strict-mode-map (kbd "M-d") 'kill-sexp)
                 (define-key smartparens-strict-mode-map (kbd "M-D") 'sp-kill-sexp)
                 (define-key smartparens-mode-map (kbd "s-S") 'sp-split-sexp)


                 (sp-with-modes '(clojure-mode cider-repl-mode)
                   (sp-local-pair "#{" "}")
                   (sp-local-pair "`" nil :actions nil)
                   (sp-local-pair "@(" ")")
                   (sp-local-pair "#(" ")"))

                 (sp-local-pair 'markdown-mode "`" nil :actions nil)
                 (sp-local-pair 'gfm-mode "`" nil :actions nil)

                 (sp-local-pair 'web-mode "{" "}" :actions nil)
                 ;; (-each sp--lisp-modes 'enable-lisp-hooks)
                 ))

;; (use-package indent-guide
;; :ensure t
;; :init
;; (indent-guide-global-mode)
;; :config
;; (set-face-background 'indent-guide-face "dimgray")
;; (setq indent-guide-recursive t)
;; )

(use-package highlight-indentation
  :ensure t
  :init
  (highlight-indentation-mode t)
  :config
  (set-face-background 'highlight-indentation-face "#e3e3d3")
  (set-face-background 'highlight-indentation-current-column-face "#c3b3b3"))

;; (use-package elscreen
;;   :init
;;   (progn
;;     ;; (set-face-attribute 'elscreen-tab-background-face nil :inherit 'default :background nil)
;;     (setq elscreen-tab-display-control nil)
;;     (setq elscreen-tab-display-kill-screen nil)
;;     (setq elscreen-prefix-key "\C-a")
;;     (elscreen-start)))

(use-package zoom-window
  :ensure t
  :config
  (global-set-key (kbd "C-x C-z") 'zoom-window-zoom)
  (setq zoom-window-mode-line-color "DarkGreen"))

;;; ace-window
(use-package ace-window
  :ensure t
  :bind ("C-x o" . ace-window))

;; (use-package auto-dim-other-buffers
;;   :ensure t
;;   :init
;;   (add-hook 'after-init-hook (lambda ()
;;   (when (fboundp 'auto-dim-other-buffers-mode)
;;     (auto-dim-other-buffers-mode t)))))

;; frame font
;; Setting English Font
;; (if (member "Monaco" (font-family-list))
;;    (set-face-attribute
;;     'default nil :font "Monaco 13"))
(if (member "Source Code Pro" (font-family-list))
    (set-face-attribute
     'default nil :font "Source Code Pro 14"))

(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)

;; set the default encoding system
(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp buffer-file-coding-system)
    (setq buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(use-package all-the-icons
  :ensure t)

;; @see http://coldnew.github.io/blog/2013/05-20_5cbb7/
(use-package pangu-spacing
  :ensure t
  :config
  (global-pangu-spacing-mode 1)
  ;; (setq pangu-spacing-real-insert-separtor t)
  (add-hook 'org-mode-hook
            '(lambda ()
               (set (make-local-variable 'pangu-spacing-real-insert-separtor) t))))

(use-package direx
  :ensure t
  :init
  (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory))

(use-package projectile
  :ensure t
  :commands (projectile-project-root)
  :init (projectile-global-mode)
  :config (progn (setq projectile-mode-line '(:eval (format " Proj[%s]" (projectile-project-name))))

                 (setq projectile-enable-caching t)
                 (setq projectile-completion-system 'default)
                 (setq projectile-indexing-method 'alien)

                 ;; add to the globally ignored files
                 (dolist (file-name '("*~" "*.elc"))
                   (add-to-list 'projectile-globally-ignored-files file-name))))

(defun itsyc/helm-project-do-ag ()
  "Search in current project with `ag'."
  (interactive)
  (let ((dir (projectile-project-root)))
    (if dir
        (helm-do-ag dir)
      (message "error: Not in a project."))))

(use-package neotree
  :ensure t
  :config
  (setq neo-smart-open t)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (setq-default neo-dont-be-alone t)  ; Don't allow neotree to be the only open window
  ;; Use with evil mode
  ;; @see https://www.emacswiki.org/emacs/NeoTree
  (add-hook 'neotree-mode-hook
            (lambda ()
              (visual-line-mode -1)
              (setq truncate-lines t)
              (hl-line-mode 1)
              (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)))
  ;; 'classic, 'nerd, 'ascii, 'arrow
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  ;; (setq neo-theme 'nerd)
  )

(defun neotree-copy-file ()
  (interactive)
  (let* ((current-path (neo-buffer--get-filename-current-line))
         (msg (format "Copy [%s] to: "
                      (neo-path--file-short-name current-path)))
         (to-path (read-file-name msg (file-name-directory current-path))))
    (dired-copy-file current-path to-path t))
  (neo-buffer--refresh t))

(define-minor-mode neotree-evil
  "Use NERDTree bindings on neotree."
  :lighter " NT"
  :keymap (progn
            (evil-make-overriding-map neotree-mode-map 'normal t)
            (evil-define-key 'normal neotree-mode-map
              "C" 'neotree-change-root
              "U" 'neotree-select-up-node
              "r" 'neotree-refresh
              "o" 'neotree-enter
              (kbd "<return>") 'neotree-enter
              "i" 'neotree-enter-horizontal-split
              "s" 'neotree-enter-vertical-split
              "n" 'evil-search-next
              "N" 'evil-search-previous
              "ma" 'neotree-create-node
              "mc" 'neotree-copy-file
              "md" 'neotree-delete-node
              "mm" 'neotree-rename-node
              "gg" 'evil-goto-first-line
              "gi" (lambda ()
                     (interactive)
                     (if (string= pe/get-directory-tree-external-command
                                  nt/gitignore-files-cmd)
                         (progn (setq pe/get-directory-tree-external-command
                                      nt/all-files-cmd))
                       (progn (setq pe/get-directory-tree-external-command
                                    nt/gitignore-files-cmd)))
                     (nt/refresh))
              "I" (lambda ()
                    (interactive)
                    (if pe/omit-enabled
                        (progn (setq pe/directory-tree-function
                                     'pe/get-directory-tree-async)
                               (pe/toggle-omit nil))
                      (progn (setq pe/directory-tree-function
                                   'pe/get-directory-tree-external)
                             (pe/toggle-omit t)))))
            neotree-mode-map))

(use-package go-mode
  :ensure t
  :mode ("\\.go" . go-mode)
  :commands go-mode
  :init (add-to-list 'auto-mode-alist '("\\.go$" . go-mode))
  :config (progn (use-package company-go
                   :ensure t
                   :if (executable-find "gocode")
                   :commands company-go
                   :init (add-hook 'after-init-hook
                                   (lambda ()(add-to-list 'company-backends 'company-go)))
                   )
                 (use-package go-direx
                   :ensure t
                   :init
                   (define-key go-mode-map (kbd "C-c C-j") 'go-direx-pop-to-buffer))
                 (use-package go-eldoc
                   :ensure t
                   :if (executable-find "gocode")
                   :commands go-eldoc-setup
                   :init (add-to-list 'go-mode-hook 'go-eldoc-setup))
                 (bind-key "M-]" 'godef-jump go-mode-map)
                 (bind-key "M-[" 'pop-tag-mark go-mode-map)
                 (bind-key "C-S-F" 'gofmt go-mode-map)
                 (bind-key "M-<return>" 'godef-describe go-mode-map)
                 ;;                (setq go-mode-map
                 ;; (let ((m (make-sparse-keymap)))
                 ;;   (define-key m "}" #'go-mode-insert-and-indent)
                 ;;   (define-key m ")" #'go-mode-insert-and-indent)
                 ;;   (define-key m "," #'go-mode-insert-and-indent)
                 ;;   (define-key m ":" #'go-mode-insert-and-indent)
                 ;;   (define-key m "=" #'go-mode-insert-and-indent)
                 ;;   (define-key m (kbd "C-c C-a") #'go-import-add)
                 ;;   (define-key m (kbd "C-c C-j") #'godef-jump)
                 ;;   ;; go back to point after called godef-jump.  ::super
                 ;;   (define-key m (kbd "C-c C-b") #'pop-tag-mark)
                 ;;   (define-key m (kbd "C-x 4 C-c C-j") #'godef-jump-other-window)
                 ;;   (define-key m (kbd "C-c C-d") #'godef-describe)
                 ;;   m))

                 (add-hook 'go-mode-hook 'flycheck-mode)
                 (add-hook 'go-mode-hook 'yas-minor-mode)
                 (add-hook 'go-mode-hook 'highlight-symbol-mode)

                 ;; 保存文件的时候对该源文件做一下 gofmt
                 (add-hook 'before-save-hook 'gofmt-before-save)
                 (add-hook 'go-mode-hook
                           (lambda ()
                             (setq tab-width 4)
                             (setq indent-tabs-mode 1))))
  )

(use-package go-complete :ensure t)
(use-package go-errcheck :ensure t)
(use-package go-gopath :ensure t)
(use-package go-impl :ensure t)
(use-package go-projectile :ensure t)
(use-package go-snippets
  :ensure go-snippets
  :init (go-snippets-initialize))

;; Quick run current buffer
(defun itsyc/go ()
  "run current buffer"
  (interactive)
  (compile (concat "go run " (buffer-file-name))))

;; use goimports instead of gofmt ::super
(setq gofmt-command "goimports")

(defun itsyc/run-current-file ()
  "Execute the current file.
For example, if the current buffer is x.py, then it'll call「python x.py」in a shell. Output is printed to message buffer.

The file can be Emacs Lisp, PHP, Perl, Python, Ruby, JavaScript, TypeScript, golang, Bash, Ocaml, Visual Basic, TeX, Java, Clojure.
File suffix is used to determine what program to run.

If the file is modified or not saved, save it automatically before run.

URL `http://ergoemacs.org/emacs/elisp_run_current_file.html'
Version 2017-07-31"
  (interactive)
  (let (
        ($suffix-map
         ;; (‹extension› . ‹shell program name›)
         `(
           ("php" . "php")
           ("pl" . "perl")
           ("py" . "python")
           ("py3" . ,(if (string-equal system-type "windows-nt") "c:/Python32/python.exe" "python3"))
           ("rb" . "ruby")
           ("go" . "/usr/local/bin/go run")
           ("hs" . "runhaskell")
           ("js" . "node") ; node.js
           ("ts" . "tsc --alwaysStrict --lib DOM,ES2015,DOM.Iterable,ScriptHost --target ES5") ; TypeScript
           ("sh" . "bash")
           ("clj" . "java -cp /home/xah/apps/clojure-1.6.0/clojure-1.6.0.jar clojure.main")
           ("rkt" . "racket")
           ("ml" . "ocaml")
           ("vbs" . "cscript")
           ("tex" . "pdflatex")
           ("latex" . "pdflatex")
           ("java" . "javac")
           ;; ("pov" . "/usr/local/bin/povray +R2 +A0.1 +J1.2 +Am2 +Q9 +H480 +W640")
           ))
        $fname
        $fSuffix
        $prog-name
        $cmd-str)
    (when (not (buffer-file-name)) (save-buffer))
    (when (buffer-modified-p) (save-buffer))
    (setq $fname (buffer-file-name))
    (setq $fSuffix (file-name-extension $fname))
    (setq $prog-name (cdr (assoc $fSuffix $suffix-map)))
    (setq $cmd-str (concat $prog-name " \""   $fname "\""))
    (cond
     ((string-equal $fSuffix "el") (load $fname))
     ((string-equal $fSuffix "go")
      (when (fboundp 'gofmt)
        (gofmt)
        (shell-command $cmd-str "*xah-run-current-file output*" )))
     ((string-equal $fSuffix "java")
      (progn
        (shell-command $cmd-str "*xah-run-current-file output*" )
        (shell-command
         (format "java %s" (file-name-sans-extension (file-name-nondirectory $fname))))))
     (t (if $prog-name
            (progn
              (message "Running…")
              (shell-command $cmd-str "*xah-run-current-file output*" ))
          (message "No recognized program file suffix for this file."))))))

(use-package clojure-mode
  :ensure t
  :commands clojure-mode
  :init (add-to-list 'auto-mode-alist '("\\.\\(clj[sx]?\\|dtm\\|edn\\)\\'" . clojure-mode))
  :config (progn (use-package cider
                   :ensure t
                   :init (progn (add-hook 'clojure-mode-hook 'cider-turn-on-eldoc-mode)
                                (add-hook 'cider-repl-mode-hook 'subword-mode))
                   :config (progn (setq cider-annotate-completion-candidates t
                                        cider-mode-line " cider")
                                  (define-key cider-repl-mode-map (kbd "M-RET") 'cider-doc)
                                  (define-key cider-mode-map (kbd "M-RET") 'cider-doc)))
                 (use-package clj-refactor
                   :ensure t
                   :init (progn (add-hook 'clojure-mode-hook (lambda ()
                                                               (clj-refactor-mode 1)
                                                               (cljr-add-keybindings-with-prefix "C-c C-m")))
                                (define-key clojure-mode-map (kbd "C-:") 'clojure-toggle-keyword-string)
                                (define-key clojure-mode-map (kbd "C->") 'cljr-cycle-coll)))
                 (add-hook 'clojure-mode-hook (lambda () (setq buffer-save-without-query t)))
                 (add-hook 'clojure-mode-hook 'subword-mode)
                 ;; Fancy docstrings for schema/defn when in the form:
                 ;; (schema/defn NAME :- TYPE "DOCSTRING" ...)
                 (put 'schema/defn 'clojure-doc-string-elt 4)))

(use-package js2-mode
  :ensure t
  :init (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  :config (use-package tern
            :commands tern-mode
            :init (add-hook 'js2-mode-hook 'tern-mode)
            :config (progn (use-package company-tern
                             :ensure t
                             :init (add-to-list 'company-backends 'company-tern))
                           (define-key tern-mode-keymap (kbd "M-.") 'tern-find-definition)
                           (define-key tern-mode-keymap (kbd "C-M-.") 'tern-find-definition-by-name)
                           (define-key tern-mode-keymap (kbd "M-,") 'tern-pop-find-definition)
                           (define-key tern-mode-keymap (kbd "C-c C-r") 'tern-rename-variable)
                           (define-key tern-mode-keymap (kbd "C-c C-c") 'tern-get-type)
                           (define-key tern-mode-keymap (kbd "C-c C-d") 'tern-get-docs)
                           (define-key tern-mode-keymap (kbd "M-<return>") 'tern-get-docs))))

(setq js-indent-level 2)
(setq typescript-indent-level 2)

(use-package typescript
  :ensure t)

(add-to-list 'load-path (expand-file-name "lisp/angularjs-mode" user-emacs-directory))
(add-to-list 'yas-snippet-dirs (expand-file-name "lisp/angularjs-mode/snippets" user-emacs-directory))
;; (add-to-list 'ac-dictionary-directories (expand-file-name "lisp/angularjs-mode/ac-dict" user-emacs-directory))
;; (add-to-list 'ac-modes 'angular-mode)
;; (add-to-list 'ac-modes 'angular-html-mode)

(use-package angular-snippets
  :ensure t
  :config
  (eval-after-load "sgml-mode"
    '(define-key html-mode-map (kbd "C-c C-d") 'ng-snip-show-docs-at-point)))

(use-package js-comint
  :ensure t
  :config
  (defun whitespace-clean-and-compile ()
    (interactive)
    (whitespace-cleanup-all)
    (compile compile-command))

  ;; Configure jshint for JS style checking.
  ;;   - Install: $ npm install -g jshint
  ;;   - Usage: Hit C-cC-u within any emacs buffer visiting a .js file
  (setq jshint-cli "jshint --show-non-errors ")
  (setq compilation-error-regexp-alist-alist
        (cons '(jshint-cli "^\\([a-zA-Z\.0-9_/-]+\\): line \\([0-9]+\\), col \\([0-9]+\\)"
                           1 ;; file
                           2 ;; line
                           3 ;; column
                           )
              compilation-error-regexp-alist-alist))
  (setq compilation-error-regexp-alist
        (cons 'jshint-cli compilation-error-regexp-alist))

  (add-hook 'js-mode-hook '(lambda ()
                             (local-set-key "\C-x\C-e" 'eval-last-sexp)
                             (local-set-key "\C-cb" 'js-send-buffer)
                             (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
                             (local-set-key "\C-cl" 'js-load-file-and-go)
                             (local-set-key "\C-c!" 'run-js)
                             (local-set-key "\C-c\C-r" 'js-send-region)
                             (local-set-key "\C-c\C-j" 'js-send-line)
                             (set (make-local-variable 'compile-command)
                                  (let ((file buffer-file-name)) (concat jshint-cli file)))
                             (set (make-local-variable 'compilation-read-command) nil)
                             (local-set-key "\C-c\C-u" 'whitespace-clean-and-compile)
                             ))

  (defun node-repl-comint-preoutput-filter (output)
    "This function fixes the escape issue with node-repl in js-comint.el.
  Heavily adapted from http://www.squidoo.com/emacs-comint (which
  is in emacs/misc/comint_ticker)
  Basically, by adding this preoutput filter to the
  comint-preoutput-filter-functions list we take the output of
  comint in a *js* buffer and do a find/replace to replace the
  ANSI escape noise with a reasonable prompt.
"
    (if (equal (buffer-name) "*js*")
        (progn
          ;; Uncomment these to debug the IO of the node process
          ;; (setq js-node-output output)
          ;; (message (concat "\n----------\n" output "\n----------\n"))

          ;; Replaced ^ with \^ to indicate that doesn't have to be
          ;; at start of line
          (replace-regexp-in-string
           "\\\[0K" ""
           (replace-regexp-in-string
            "\\\[1G" ""
            (replace-regexp-in-string
             "\\\[0J" ""
             (replace-regexp-in-string
              "\\\[3G" ""
              (replace-regexp-in-string
               "\\\[0G" ""
               (replace-regexp-in-string
                "\\[2C" ""
                (replace-regexp-in-string
                 "\\[0K" ""
                 (replace-regexp-in-string
                  "" "" output))))))))
          )
      output
      )
    )

  (add-hook 'comint-preoutput-filter-functions 'node-repl-comint-preoutput-filter)
  (add-hook 'comint-output-filter-functions 'node-repl-comint-preoutput-filter))

(use-package web-mode
  :ensure t
  :commands web-mode
  :init (progn (add-to-list 'auto-mode-alist '("\\.phtml$'" . web-mode))
               (add-to-list 'auto-mode-alist '("\\.tpl\\.php$'" . web-mode))
               (add-to-list 'auto-mode-alist '("\\.[gj]sp$'" . web-mode))
               (add-to-list 'auto-mode-alist '("\\.as[cp]x$'" . web-mode))
               (add-to-list 'auto-mode-alist '("\\.erb$'" . web-mode))
               (add-to-list 'auto-mode-alist '("\\.mustache$'" . web-mode))
               (add-to-list 'auto-mode-alist '("\\.djhtml$'" . web-mode))
               (add-to-list 'auto-mode-alist '("\\.html$'" . web-mode)))
  :config ;; Autocomplete end tag when finished writing opening tag
  (setq web-mode-auto-close-style 2))

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
  (setq emmet-expand-jsx-className? t))

(use-package json-mode
  :ensure t
  :defer t
  :init (progn (add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
               (add-to-list 'auto-mode-alist '("\\.jsonld$" . json-mode))
               (add-to-list 'auto-mode-alist '(".tern-project" . json-mode))
               (add-to-list 'auto-mode-alist '(".jshintrc" . json-mode)))
  :config (progn (add-hook 'json-mode-hook 'flycheck-mode)
                 (bind-key "C-S-f" 'json-mode-beautify json-mode-map)))

(use-package nxml-mode
  :defer t
  :init (progn (add-to-list 'auto-mode-alist '("\\.xml$" . nxml-mode))
               (add-to-list 'auto-mode-alist '("\\.gapp$" . nxml-mode)))
  :config (progn (bind-key "C-S-f" 'beautify-xml nxml-mode-map)))

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode)))

(use-package logstash-conf
  :ensure t
  :config
  (setq logstash-indent 2))

(use-package markdown-mode
  :ensure t
  :commands
  (markdown-mode gfm-mode)
  :mode
  (("README\\.md\\'" . gfm-mode)
   ("\\.md\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "/usr/local/Cellar/multimarkdown/5*/bin/multimarkdown")
  :config
  ;; Turn on flyspell mode when editing markdown files
  (add-hook 'markdown-mode-hook 'flyspell-mode)
  (add-hook 'gfm-mode-hook 'flyspell-mode))

(use-package markdown-toc :ensure t)
(use-package markdown-mode+ :ensure t)

(use-package company
  :ensure t
  :defer t
  :commands global-company-mode
  :diminish "comp"
  :init
  (global-company-mode)
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-dabbrev-downcase nil)  ;; fix case-sensitive
  :config
  ;; (setq company-tooltip-common-selection ((t (:inherit company-tooltip-selection :background "yellow2" :foreground "#c82829"))))
  ;; (setq company-tooltip-selection ((t (:background "yellow2"))))
  (setq company-idle-delay 0.2)
  (setq company-tooltip-flip-when-above t)
  (setq company-selection-wrap-around t)
  (define-key company-active-map [tab] 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package company-quickhelp
  :disabled t
  :config
  (company-quickhelp-mode 1))

(use-package yasnippet
  :ensure t
  :defer 2
  :diminish yas-minor-mode
  :config
  (progn
    ;; Suppress excessive log messages
    (setq yas-verbosity 1
          yas-prompt-functions '(yas-ido-prompt)
          yas-snippet-dir (expand-file-name "snippets" user-emacs-directory))
    (yas-global-mode t)))

;;; spell checking
(use-package ispell
  :config (setq ispell-program-name "aspell" ; use aspell instead of ispell
                ispell-extra-args '("--sug-mode=ultra")))

(use-package flyspell
  :ensure t
  :defer 2
  :commands flyspell-mode
  :init (add-hook 'text-mode-hook 'flyspell-mode))

;;; flycheck mode
(use-package flycheck
  :ensure t
  :commands global-flycheck-mode
  :config (progn (use-package popup
                   :ensure t)
                 (use-package flycheck-pos-tip
                   :ensure t)
                 (add-to-list 'flycheck-disabled-checkers 'emacs-lisp-checkdoc)
                 ;; (use-package flycheck-clojure
                 ;;   :ensure t
                 ;;   :init (flycheck-clojure-setup))
                 (setq flycheck-display-errors-function 'flycheck-pos-tip-error-messages)
                 (global-flycheck-mode)))

(use-package evil-leader
  :ensure t
  :init
  (global-evil-leader-mode)
  :config
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    ;; "a" 'ack-and-a-half
    "aa" 'ag
    "ap" 'ag-project
    ;; "bb" 'ido-switch-buffer
    ;; "bb" 'helm-buffers-list
    "b" 'helm-mini
    "e" 'helm-find-files
    ;; "be" 'ibuffer
    "cf" 'helm-recentf
    "d" 'neotree
    "f" 'ido-find-file
    "g" 'magit-status
    "h" 'evil-search-highlight-persist-remove-all
    "jj" 'avy-goto-word-or-subword-1
    "q" 'delete-window
    "s" 'swiper
    "w" 'save-buffer
    "<tab>" 'mode-line-other-buffer
    "pf" 'projectile-find-file
      "ps" 'helm-projectile-switch-project
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

  ;; @see https://github.com/rime/squirrel/wiki/vim%E7%94%A8%E6%88%B7%E4%B8%8Eemacs-evil-mode%E7%94%A8%E6%88%B7-%E8%BE%93%E5%85%A5%E6%B3%95%E8%87%AA%E5%8A%A8%E5%88%87%E6%8D%A2%E6%88%90%E8%8B%B1%E6%96%87%E7%8A%B6%E6%80%81%E7%9A%84%E5%AE%9E%E7%8E%B0
  (defadvice keyboard-quit (before evil-insert-to-nornal-state activate)
    "C-g back to normal state"
    (when  (evil-insert-state-p)
      (cond
       ((equal (evil-initial-state major-mode) 'normal)
        (evil-normal-state))
       ((equal (evil-initial-state major-mode) 'insert)
        (evil-normal-state))
       ((equal (evil-initial-state major-mode) 'motion)
        (evil-motion-state))
       (t
        (if (equal last-command 'keyboard-quit)
            (evil-normal-state)           ;如果初始化 state 不是 normal，按两次才允许转到 normal state
          (evil-change-to-initial-state)) ;如果初始化 state 不是 normal，按一次 转到初始状态
        ))))

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
  ;; '(define-key evil-ex-map "notes" (lambda() (interactive)(find-file "~/notes/home.org"))))
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
  :after org
  :init
  (global-evil-surround-mode 1))

(use-package evil-goggles
  :ensure t
  :after org
  :config
  (evil-goggles-mode))

(use-package evil-search-highlight-persist
  :ensure t
  :init
  (global-evil-search-highlight-persist t))

;; (bind-map my-base-leader-map
;;  :keys ("M-m")
;; (bind-map my-elisp-map
;;  :keys ("M-m m" "M-RET")
;;  :major-modes (emacs-lisp-mode
;;                lisp-interaction-mode))

(use-package bind-key
  :ensure t)

;; (bind-keys :prefix-map itsyc/leader-map :prefix "M-SPC")
(use-package bind-map
  :ensure t
  :config
  (bind-map itsyc/leader-map
    :keys ("M-SPC")
    :evil-keys ("SPC")
    :evil-states (normal motion visual))
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
    "b"  'helm-mini
    "s"  'swiper
    ;; "bb" 'ido-switch-buffer
    ;; "jf" 'avy-goto-char-in-line
    ;; "jc" 'avy-goto-char
    ;; "jw" 'avy-goto-word-1
    ;; "jl" 'avy-goto-line
    "cf" 'helm-recentf))

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

;; mac switch meta key
(defun itsyc/mac-switch-meta nil
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

;; 修改后的设定 Mark 的绑定，由于经常忘了放住 Control 键，就给这个功能两个绑定了
(global-set-key (kbd "M-n") 'set-mark-command)

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
  (setq which-key-sort-order 'which-key-key-order))

;; use 'keyfreq-show'
;; @see https://github.com/dacap/keyfreq
(use-package keyfreq
  :ensure t
  :init
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

(require 'org)
;;;; use-package org
;; (use-package org
;;   :ensure t
;;   :init
(setq org-directory "~/notes/")
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-src-fontify-natively t)
(setq org-hide-emphasis-markers t)

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(add-hook 'org-mode-hook (lambda () (setq word-wrap t)))
(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-indent-mode t)
;; @see http://www.howardism.org/Technical/Emacs/orgmode-wordprocessor.html
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-+]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "☀"))))))

(let* ((variable-tuple (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                             ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                             ((x-list-fonts "Verdana")         '(:font "Verdana"))
                             ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                             (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       ;; (headline           `(:inherit default :foreground ,base-font-color))
       (headline           `(:inherit default))
       ;; (headline-1         `(:inherit default :weight bold :foreground ,base-font-color)))
       (headline-1         `(:inherit default :weight bold)))

  (set-face-attribute 'default nil :font "Source Code Pro 14")
  ;; Chinese Font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset (font-spec :family "Hiragino Sans GB" :size 16)))

  ;; (custom-theme-set-faces 'user
  ;; `(org-level-8 ((t (,@headline ,@variable-tuple))))
  ;; `(org-level-7 ((t (,@headline ,@variable-tuple))))
  ;; `(org-level-6 ((t (,@headline ,@variable-tuple))))
  ;; `(org-level-5 ((t (,@headline ,@variable-tuple))))
  ;; `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
  ;; `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
  ;; `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
  ;; `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
  ;; `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))

  ;; (set-face-attribute 'org-level-1 nil :height 1.6 :bold t)
  ;; (set-face-attribute 'org-level-2 nil :height 1.4 :bold t)
  ;; (set-face-attribute 'org-level-3 nil :height 1.2 :bold t)))
  (custom-theme-set-faces 'user
                          `(org-level-8 ((t (,@headline ,@variable-tuple))))
                          `(org-level-7 ((t (,@headline ,@variable-tuple))))
                          `(org-level-6 ((t (,@headline ,@variable-tuple))))
                          `(org-level-5 ((t (,@headline ,@variable-tuple))))
                          `(org-level-4 ((t (,@headline ,@variable-tuple))))
                          `(org-level-3 ((t (,@headline ,@variable-tuple))))
                          `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.1))))
                          `(org-level-1 ((t (,@headline-1 ,@variable-tuple :height 1.5))))
                          `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))
                          `(org-link ((t (:underline t))))
                          ;;                                              `(org-block-begin-line ((t (:background ,"grey98" :foreground ,"grey85" :weight bold))))
                          ;;                                                  `(org-block-end-line ((t (:background ,"grey98" :foreground ,"grey85" :weight bold))))
                          ;; `(org-todo ((t (:weight bold))))
                          ;; `(org-done ((t (:weight bold))))
                          ;; `(org-block ((,'((class color) (min-colors 89)) (:background ,"grey98"))))
                          ;; `(org-block-background ((,class (:background ,"grey98" :foreground ,"grey20"))))
                          ))
;; Keep the headlines expanded in Org-Mode
;; @see http://emacs.stackexchange.com/questions/9709/keep-the-headlines-expanded-in-org-mode
(setq org-startup-folded nil)
;; Disabling underscore-to-subscript in Emacs Org-Mode export
;; @see http://stackoverflow.com/questions/698562/disabling-underscore-to-subscript-in-emacs-org-mode-export/701201#701201
(setq org-export-with-sub-superscripts nil)
 ;;;; use-package org
;; :config
(defcustom org-indent-indentation-per-level 4
  "Indentation per level in number of characters."
  :group 'org-indent
  :type 'integer)
;; (setq org-todo-keywords
;;       '((sequence "TODO" "IN-PROGRESS" "DONE" "CANCELED" "WAITING" "|")))
;; @see -> https://ccdevote.github.io/%E6%8A%80%E6%9C%AF%E5%8D%9A%E5%AE%A2/org-mode-basic-4.html
;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "STARTED" "WAITING(w@/!)" "|" "DONE(d!)" "CANCELLED(c@)")))
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")
              (sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "MAYBE(m)" "|" "DONE(d!/!)")
              (sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
              (sequence "WAITING(w@/!)" "HOLD(h)" "|" "CANCELLED(c@/!)"))))

(setq org-use-fast-todo-selection t)
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("MAYBE" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))
;; 记录时间
(add-hook 'org-mode-hook (lambda () (setq org-log-done 'time)))
;; 记录提示信息
(add-hook 'org-mode-hook (lambda () (setq org-log-done 'note)))
;; Separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
;; Save clock data and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)
;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)
(set-register ?n (cons 'file "~/notes/home.org"))
(set-register ?s (cons 'file "~/notes/draft.org"))
(set-register ?g (cons 'file "~/notes/diary.org"))

(setq org-goto-interface 'outline-path-completion
      org-goto-max-level 10)
;; )  ;; end--> use-package org

(use-package org-bullets
  :ensure t
  :init
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  ;; "◎" "○" "►" "◇" "⊛" "✪" "☯" "⊙" "✪" "➲" "●" "⬤" "⚉"  "⸖" "ͼ" "ͽ" "⚬" "◌""￮""""⚫"
  ;; "☉" "⦾" "◦" "∙" "∘" "⚪" "◯" "⦿" "⌾" "◉"
  (setq org-bullets-bullet-list '("❂" "⊚" "❍")))

(use-package htmlize :ensure t)

;;(require 'org-publish)
(setq org-publish-project-alist
      '(
        ("org-blog-content" ;; 博客内容
         ;; Path to your org files.
         :base-directory "~/notes/"
         :base-extension "org"
         ;; Path to your jekyll project.
         :publishing-directory "~/Applications/nginx/notes/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :html-extension "html"
         :table-of-contents t ;; 导出目录
         :link-home "home.html"
         :html-preamble (concat "INSERT HTML CODE HERE FOR PREAMBLE")
         :html-postamble (concat "INSERT HTML CODE HERE FOR POSTAMBLE")
         ;; :body-only t ;; Only export section between <body></body>
         )
        ("org-blog-static" ;; 静态文件
         :base-directory "~/notes/"
         :base-extension "css\\|ico\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php\\|svg"
         :publishing-directory "~/Applications/nginx/notes/"
         :recursive t
         :publishing-function org-publish-attachment)
        ("blog" :components ("org-blog-content" "org-blog-static"))
        ))

(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

(defun org-toggle-link-display ()
  "Toggle the literal or descriptive display of links."
  (interactive)
  (if org-descriptive-links
      (progn (org-remove-from-invisibility-spec '(org-link))
             (org-restart-font-lock)
             (setq org-descriptive-links nil))
    (progn (add-to-invisibility-spec '(org-link))
           (org-restart-font-lock)
           (setq org-descriptive-links t))))

;; Paste an image on clipboard to Emacs Org mode file
;; @see http://stackoverflow.com/questions/17435995/paste-an-image-on-clipboard-to-emacs-org-mode-file-without-saving-it
(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
    same directory as the org-buffer and insert a link to this file."
  (interactive)
  (org-display-inline-images)
  (setq filename
        (concat
         (make-temp-name
          (concat (file-name-nondirectory (buffer-file-name))
                  "_imgs/"
                  (format-time-string "%Y%m%d_%H%M%S_"))) ".png"))
  (unless (file-exists-p (file-name-directory filename))
    (make-directory (file-name-directory filename)))
                                        ; take screenshot
  (if (eq system-type 'darwin)
      (call-process "screencapture" nil nil nil "-i" filename))
  (if (eq system-type 'gnu/linux)
      (call-process "import" nil nil nil filename))
                                        ; insert into file if correctly taken
  (if (file-exists-p filename)
      (insert (concat "[[file:" filename "]]"))))

;; @see http://orgmode.org/worg/org-hacks.html#orgheadline126
(defun ogrep (search &optional context)
  "Search for word in org files.

    Prefix argument determines number of lines."
  (interactive "sSearch for: \nP")
  (let ((grep-find-ignored-files '("#*" ".#*"))
        (grep-template (concat "grep <X> -i -nH "
                               (when context
                                 (concat "-C" (number-to-string context)))
                               " -e <R> <F>")))
    (lgrep search "*org*" "~/notes/")))

;; http://cachestocaches.com/2016/9/my-workflow-org-agenda/#capture--refile
(setq org-agenda-files '("~/notes/gtd/inbox.org"
                         "~/notes/gtd/gtd.org"
                         "~/notes/gtd/tickler.org"))

(setq org-refile-targets '(("~/notes/gtd/gtd.org" :maxlevel . 3)
                           ("~/notes/gtd/someday.org" :level . 1)
                           ("~/notes/gtd/tickler.org" :maxlevel . 2)))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling

;; auto load markdown-mode when load org-mode
(eval-after-load "org"
  '(require 'ox-md nil t))

;; @see 模板元素说明：https://www.cnblogs.com/holbrook/archive/2012/04/17/2454619.html
;; https://www.gnu.org/software/emacs/manual/html_node/org/Template-elements.html#Template-elements
;; https://www.gnu.org/software/emacs/manual/html_node/org/Template-expansion.html#Template-expansion
(setq org-structure-template-alist
      '(("s" "#+BEGIN_SRC ?\n\n#+END_SRC" "<src lang=\"?\">\n\n</src>")
        ("e" "#+BEGIN_EXAMPLE\n?\n#+END_EXAMPLE" "<example>\n?\n</example>")
        ("q" "#+BEGIN_QUOTE\n?\n#+END_QUOTE" "<quote>\n?\n</quote>")
        ("v" "#+BEGIN_VERSE\n?\n#+END_VERSE" "<verse>\n?\n</verse>")
        ("c" "#+BEGIN_COMMENT\n?\n#+END_COMMENT")
        ("p" "#+BEGIN_PRACTICE\n?\n#+END_PRACTICE")
        ("o" "#+BEGIN_SRC emacs-lisp :tangle yes\n?\n#+END_SRC" "<src lang=\"emacs-lisp\">\n?\n</src>")
        ("l" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC" "<src lang=\"emacs-lisp\">\n?\n</src>")
        ("L" "#+latex: " "<literal style=\"latex\">?</literal>")
        ("h" "#+BEGIN_HTML\n?\n#+END_HTML" "<literal style=\"html\">\n?\n</literal>")
        ("H" "#+html: " "<literal style=\"html\">?</literal>")
        ("a" "#+BEGIN_ASCII\n?\n#+END_ASCII")
        ("A" "#+ascii: ")
        ("i" "#+index: ?" "#+index: ?")
        ("I" "#+include %file ?" "<include file=%file markup=\"?\">")))

;; (use-package org-mac-link
;;   :ensure t
;;   :init
;;   (add-hook 'org-mode-hook (lambda ()
;;                              (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link))))

;; Set default column view headings: Task Total-Time Time-Stamp
(setq org-default-notes-file (concat org-directory "gtd/inbox.org"))
(setq org-columns-default-format "%50ITEM(Task) %10CLOCKSUM %16TIMESTAMP_IA")
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
;; :empty-lines 2
(setq org-capture-templates
      '(("t" "todo [inbox]" entry (file+headline "gtd/inbox.org" "Tasks")
         "* TODO %i%?\n%U\n" :clock-in t :clock-resume t :prepend t :empty-lines 1)
        ;; ("t" "TODO" entry (file (concat org-directory "gtd/inbox.org"))
        ;;  "* TODO %?\n%u\n%a\nDEADLINE: %t" :clock-in t :clock-resume t)
        ("T" "Tickler" entry (file+headline "gtd/tickler.org" "Tickler")
         "* %i%? \n %U")
        ("w" "Work TODO" entry (file+olp "gtd/inbox.org" "Work" "Tasks")
         "* TODO %? :work:\n:PROPERTIES:\n:CREATED: %U\n:END:" :clock-in t :clock-resume t)
        ("a" "Appointment" entry (file  "gtd/inbox.org" "Appointments")
         "* TODO %?\n:PROPERTIES:\n\n:END:\nDEADLINE: %^T \n %i\n")
        ("m" "Meeting" entry (file+headline "gtd/inbox.org" "Meeting")
         "* DONE MEETING with %? :MEETING:\n:SUBJECT:\n%U\n" :clock-in t :clock-resume t)
        ("d" "Diary" entry (file+datetree "diary.org")
         "* %?\n%U\n" :clock-in t :clock-resume t)
        ("i" "Idea" entry (file+headline "Blog Topics:")
         "* %? :IDEA: \n%t" :clock-in t :clock-resume t)
        ("n" "Next Task" entry (file+headline org-default-notes-file "Tasks")
         "** NEXT %? \nDEADLINE: %t")
        ("l" "Link" entry (file+headline "gtd/inbox.org" "Links")
         "* %? %^L %^g \n%T" :prepend t)
        ("l" "A link, for reading later." entry (file+headline "gtd/inbox.org" "Reading List")
         "* %:description\n%u\n\n%c\n\n%i")
        ("n" "Note" entry (file+headline "gtd/inbox.org" "Notes")
         "* Note %?\n%T")
        ("b" "Blog idea" entry (file+headline "gtd/inbox.org" "Blog Topics:")
         "* %?\n%T" :prepend t)
        ("j" "Journal" entry (file+datetree "gtd/inbox.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("s" "Screencast" entry (file "gtd/inbox.org")
         "* %?\n%i\n")
        ("r" "RESPONED" entry  (file (concat org-directory "/refile.org"))
         "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
        ("n" "NOTES" entry  (file (concat org-directory "/notes.org"))
         "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
        ("j" "Journal" entry  (file (concat org-directory "/refile.org"))
         "* %?\n%U\n" :clock-in t :clock-resume t)
        ("w" "org-protocol" entry  (file (concat org-directory "/refile.org"))
         "* TODO Review %c\n%U\n" :immediate-finish t)
        ("p" "Phone call" entry  (file (concat org-directory "/refile.org"))
         "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
        ("h" "Habit" entry  (file (concat org-directory "/refile.org"))
         "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"<%Y-%m-%d %a .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")
        ))

(setq org-fontify-done-headline t)
(custom-set-faces
 '(org-done ((t (:foreground "PaleGreen"
                             :weight normal
                             :strike-through t))))
 '(org-headline-done
   ((((class color) (min-colors 16) (background dark))
     (:foreground "LightSalmon" :strike-through t)))))

(defun modify-org-done-face ()
  (setq org-fontify-done-headline t)
  (set-face-attribute 'org-done nil :strike-through t)
  (set-face-attribute 'org-headline-done nil :strike-through t))

(eval-after-load "org"
  (add-hook 'org-add-hook 'modify-org-done-face))

;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/notes/gtd/inbox.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/应用/MobileOrg")

(use-package org-super-agenda
  :ensure t
  :config (org-super-agenda-mode))

(use-package outline-toc
  :ensure t)

(use-package smex
  :ensure t
  :init
  (smex-initialize)
  :config
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

(use-package ido-vertical-mode
  :ensure t)

(use-package ido
  :ensure t
  :init
  (ido-mode 1)
  (ido-vertical-mode 1)
  (setq ido-use-faces nil)
  (ido-everywhere 1)
  :config
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)
  (global-set-key (kbd "C-x C-f") 'ido-find-file))

(use-package flx-ido
  :ensure t
  :config
  (flx-ido-mode 1)
  ;; disable ido faces to see flx highlights.
  (setq ido-enable-flex-matching t))

(use-package ido-completing-read+
  :ensure t
  :config
  (ido-ubiquitous-mode 1))

(use-package recentf
  :ensure t
  :init
  (recentf-mode 1)
  (setq recentf-max-saved-items 0) ;; just 50 is too recent

  ;; Save a list of recent files visited. (open recent file with C-c f)
  :config
  (defun ido-recentf-open ()
    "Use `ido-completing-read' to \\[find-file] a recent file"
    (interactive)
    (if (find-file (ido-completing-read "Find recent file: " recentf-list))
        (message "Opening file...")
      (message "Aborting")))

  (global-set-key (kbd "C-c f") 'ido-recentf-open))

(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (helm-fuzzier-mode 1)
  (helm-autoresize-mode 1)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 100)
  (set-face-attribute 'helm-selection nil
                      :background "yellow"
                      :foreground "black")
  (define-key helm-map (kbd "C-j") 'helm-next-line)
  (define-key helm-map (kbd "C-k") 'helm-previous-line)
  (define-key helm-map (kbd "C-h") 'helm-next-source)
  (define-key helm-map (kbd "C-S-h") 'describe-key)
  (define-key helm-map (kbd "C-l") (kbd "RET"))
  (define-key helm-map [escape] 'helm-keyboard-quit))

(use-package swoop
  :ensure t)

(use-package helm-swoop
  :ensure t
  :config
  (global-set-key (kbd "M-i") 'helm-swoop)
  (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
  (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
  ;; Save buffer when helm-multi-swoop-edit complete
  (setq helm-multi-swoop-edit-save t)
  ;; Go to the opposite side of line from the end or beginning of line
  (setq helm-swoop-move-to-line-cycle t)
  ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
  (setq helm-swoop-split-direction 'split-window-vertically))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  (setq projectile-indexing-method 'native)
  (setq projectile-enable-caching t)
  )

(use-package helm-fuzzier :ensure t
  :ensure t
  :config
  (helm-fuzzier-mode 1)
  (setq helm-mode-fuzzy-match t)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-recentf-fuzzy-match t))

(use-package ivy
  :ensure t)

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c u") 'swiper-all)
    ;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
    ;; (global-set-key (kbd "<f6>") 'ivy-resume)
    ;; (global-set-key (kbd "M-x") 'counsel-M-x)
    ;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    ;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    ;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    ;; (global-set-key (kbd "<f1> l") 'counsel-load-library)
    ;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    ;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    ;; (global-set-key (kbd "C-c g") 'counsel-git)
    ;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
    ;; (global-set-key (kbd "C-c k") 'counsel-ag)
    ;; (global-set-key (kbd "C-x l") 'counsel-locate)
    ;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    ;; (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package ag
  :ensure t)

(use-package helm-ag
     :ensure t
     :defer t
     :bind ("M-s s" . helm-ag))

(use-package avy
  :ensure t
  :init
  (setq avy-background t))

(use-package ace-jump-mode
  :ensure t
  :bind ("C-c SPC" . ace-jump-mode))

;;; highlight-symbol
(use-package highlight-symbol
  :ensure t
  :diminish ""
  :bind (("M-<f3>" . highlight-symbol-at-point)
         ("<f3>" . highlight-symbol-next)
         ("S-<f3>" . highlight-symbol-prev))
  :config (progn (setq highlight-symbol-idle-delay 0.5)
                 (add-hook 'prog-mode-hook 'highlight-symbol-mode)
                 (highlight-symbol-mode)))

(use-package expand-region
  :ensure t
  :init
  (pending-delete-mode t)
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package selected
  :ensure t
  :commands selected-minor-mode
  :init
  (setq selected-org-mode-map (make-sparse-keymap))
  :bind (:map selected-keymap
              ("q" . selected-off)
              ("u" . upcase-region)
              ("d" . downcase-region)
              ("w" . count-words-region)
              ("m" . apply-macro-to-region-lines)
              :map selected-org-mode-map
              ("t" . org-table-convert-region)))

(defun itsyc/move-file (new-location)
  "Write this file to NEW-LOCATION, and delete the old one."
  (interactive (list (expand-file-name
                      (if buffer-file-name
                          (read-file-name "Move file to: ")
                        (read-file-name "Move file to: "
                                        default-directory
                                        (expand-file-name (file-name-nondirectory (buffer-name))
                                                          default-directory))))))
  (when (file-exists-p new-location)
    (delete-file new-location))
  (let ((old-location (expand-file-name (buffer-file-name))))
    (message "old file is %s and new file is %s"
             old-location
             new-location)
    (write-file new-location t)
    (when (and old-location
               (file-exists-p new-location)
               (not (string-equal old-location new-location)))
      (delete-file old-location))))

(bind-key "C-x C-m" #'itsyc/move-file)

(defun itsyc/dired-open-in-filemanager ()
  "Show current file in OS's file manager."
  (interactive)
  (let ((process-connection-type nil))
    (start-process "" nil "open" ".")))

(use-package multi-term
  :ensure t
  :defer t
  :init
  (setq multi-term-program-switches "--login")
  (when (require 'multi-term nil t)
    (global-set-key (kbd "<C-next>") 'multi-term-next)
    (global-set-key (kbd "<C-prior>") 'multi-term-prev)
    (setq multi-term-buffer-name "term"
          multi-term-program "/bin/zsh"))
  :config
  (when (require 'term nil t) ; only if term can be loaded..
    (setq term-bind-key-alist
          (list (cons "C-c C-c" 'term-interrupt-subjob)
                (cons "C-p" 'previous-line)
                (cons "C-n" 'next-line)
                (cons "M-f" 'term-send-forward-word)
                (cons "M-b" 'term-send-backward-word)
                (cons "C-c C-j" 'term-line-mode)
                (cons "C-c C-k" 'term-char-mode)
                (cons "M-DEL" 'term-send-backward-kill-word)
                (cons "M-d" 'term-send-forward-kill-word)
                (cons "<C-left>" 'term-send-backward-word)
                (cons "<C-right>" 'term-send-forward-word)
                (cons "C-r" 'term-send-reverse-search-history)
                (cons "M-p" 'term-send-raw-meta)
                (cons "M-y" 'term-send-raw-meta)
                (cons "C-y" 'term-send-raw))))
  :bind ("<f5>" . multi-term))

(use-package helm-mt
  :ensure t
  :defer t
  :bind ("C-x t" . helm-mt))

(setq tramp-default-method "ssh")

(use-package helm-descbinds
  :ensure t
  :bind (("C-h b" . helm-descbinds)
         ("C-h h" . helm-descbinds)))

;; highlight git changes
(use-package git-gutter
  :ensure t
  :diminish git-gutter-mode
  :config (global-git-gutter-mode))

;;; magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  :config (progn (add-hook 'magit-log-edit-mode-hook
                           (lambda ()
                             (set-fill-column 72)
                             (auto-fill-mode 1)))
                 ;; (add-hook 'magit-mode-hook '(lambda () (auto-complete-mode 0)))
                 (setq
                  ;; use ido to look for branches
                  magit-completing-read-function 'magit-ido-completing-read
                  ;; don't put "origin-" in front of new branch names by default
                  magit-default-tracking-name-function 'magit-default-tracking-name-branch-only
                  ;; highlight word/letter changes in hunk diffs
                  magit-diff-refine-hunk t
                  ;; don't attempt to save unsaved buffers
                  magit-save-some-buffers nil)
                 (diminish 'magit-auto-revert-mode "")
                 (use-package gitconfig-mode
                   :ensure t)
                 (use-package gitignore-mode
                   :ensure t)))

;; scratch
(use-package scratch
  :ensure t
  :commands (scratch))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2017/bin/x86_64-darwin/"))
(setq exec-path (append exec-path '("/usr/local/texlive/2017/bin/x86_64-darwin/")))

(setq org-latex-pdf-process '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; use minted to highlight code in latex
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq org-latex-classes
      '(("article"
         "
\\documentclass[12pt,a4paper]{article}
\\usepackage[margin=2cm]{geometry}
\\usepackage{fontspec}
\\setromanfont{STSong}
\\usepackage{etoolbox}  % Quote 部份的字型設定
\\newfontfamily\\quotefont{STSong}
\\AtBeginEnvironment{quote}{\\quotefont\\small}
\\setmonofont[Scale=0.9]{Courier} % 等寬字型 [FIXME] Courier 中文會爛掉！
\\font\\cwSong=''STSong'' at 10pt
%\\font\\cwHei=''STSong'' at 10p %不知為何這套字型一用就爆掉...
\\font\\cwYen=''STSong'' at 10pt
\\font\\cwKai=''STSong'' at 10pt
\\font\\cwMing=''STSong'' at 10pt
\\font\\wqyHei=''STSong'' at 10pt
\\font\\wqyHeiMono=''STSong'' at 10pt
\\font\\wqyHeiMicro=''STSong'' at 10pt
\\XeTeXlinebreaklocale ``zh''
\\XeTeXlinebreakskip = 0pt plus 1pt
\\linespread{1.36}
% [FIXME] ox-latex 的設計不良導致 hypersetup 必須在這裡插入
\\usepackage{hyperref}
\\hypersetup{
  colorlinks=true, %把紅框框移掉改用字體顏色不同來顯示連結
  linkcolor=[rgb]{0,0.37,0.53},
  citecolor=[rgb]{0,0.47,0.68},
  filecolor=[rgb]{0,0.37,0.53},
  urlcolor=[rgb]{0,0.37,0.53},
  pagebackref=true,
  linktoc=all,}
"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
        ))
;; [FIXME]
;; 原本是不要讓 org 插入 hypersetup（因為 org-mode 這部份設計成沒辦法自訂，或許可以去 report 一下？）
;; 改成自行插入，但這樣 pdfcreator 沒辦法根據 Emacs 版本插入，pdfkeyword 也會無效...幹。
(setq org-latex-with-hyperref t)
;; 把預設的 fontenc 拿掉
;; 經過測試 XeLaTeX 輸出 PDF 時有 fontenc[T1]的話中文會無法顯示。
;; hyperref 也拿掉，改從 classes 處就插入，原因見上面 org-latex-with-hyperref 的說明。
(setq org-latex-default-packages-alist
      '(("" "hyperref" nil)
        ("AUTO" "inputenc" t)
        ("" "fixltx2e" nil)
        ("" "graphicx" t)
        ("" "longtable" nil)
        ("" "float" nil)
        ("" "wrapfig" nil)
        ("" "rotating" nil)
        ("normalem" "ulem" t)
        ("" "amsmath" t)
        ("" "textcomp" t)
        ("" "marvosym" t)
        ("" "wasysym" t)
        ("" "multicol" t)  ; 這是我另外加的，因為常需要多欄位文件版面。
        ("" "amssymb" t)
        "\\tolerance=1000"))
;; Use XeLaTeX to export PDF in Org-mode
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))
;; 指定你要用什麼外部 app 來開 pdf 之類的檔案。我是偷懶所以直接用 kde-open，你也可以指定其他的。
(setq org-file-apps '((auto-mode . emacs)
                      ("\\.mm\\'" . default)
                      ("\\.x?html?\\'" . "xdg-open %s")
                      ("\\.pdf\\'" . "kde-open %s")
                      ("\\.jpg\\'" . "kde-open %s")))

;; allow for export=>beamer by placing

;; #+LaTeX_CLASS: beamer in org files
;; (unless (boundp 'org-export-latex-classes)
;;   (setq org-export-latex-classes nil))
;; (add-to-list 'org-export-latex-classes
;;              ;; beamer class, for presentations
;;              '("beamer"
;;                "\\documentclass[11pt]{beamer}\n
;;       \\mode<{{{beamermode}}}>\n
;;       \\usetheme{{{{beamertheme}}}}\n
;;       \\usecolortheme{{{{beamercolortheme}}}}\n
;;       \\beamertemplateballitem\n
;;       \\setbeameroption{show notes}
;;       \\usepackage[utf8]{inputenc}\n
;;       \\usepackage[T1]{fontenc}\n
;;       \\usepackage{hyperref}\n
;;       \\usepackage{color}
;;       \\usepackage{listings}
;;       \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
;;   frame=single,
;;   basicstyle=\\small,
;;   showspaces=false,showstringspaces=false,
;;   showtabs=false,
;;   keywordstyle=\\color{blue}\\bfseries,
;;   commentstyle=\\color{red},
;;   }\n
;;       \\usepackage{verbatim}\n
;;       \\institute{{{{beamerinstitute}}}}\n
;;        \\subject{{{{beamersubject}}}}\n"
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\begin{frame}[fragile]\\frametitle{%s}"
;;                 "\\end{frame}"
;;                 "\\begin{frame}[fragile]\\frametitle{%s}"
;;                 "\\end{frame}")))
;; (add-to-list 'org-export-latex-classes
;;              ;; beamer class, for presentations
;;              '("beamer"
;;                "\\documentclass[11pt,professionalfonts]{beamer}
;; \\mode
;; \\usetheme{{{{Warsaw}}}}
;; %\\usecolortheme{{{{beamercolortheme}}}}
;; \\beamertemplateballitem
;; \\setbeameroption{show notes}
;; \\usepackage{graphicx}
;; \\usepackage{tikz}
;; \\usepackage{xcolor}
;; \\usepackage{xeCJK}
;; \\usepackage{amsmath}
;; \\usepackage{lmodern}
;; \\usepackage{fontspec,xunicode,xltxtra}
;; \\usepackage{polyglossia}
;; \\setmainfont{Times New Roman}
;; \\setCJKmainfont{DejaVu Sans YuanTi}
;; \\setCJKmonofont{DejaVu Sans YuanTi Mono}
;; \\usepackage{verbatim}
;; \\usepackage{listings}
;; \\institute{{{{beamerinstitute}}}}
;; \\subject{{{{beamersubject}}}}"
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\begin{frame}[fragile]\\frametitle{%s}"
;;                 "\\end{frame}"
;;                 "\\begin{frame}[fragile]\\frametitle{%s}"
;;                 "\\end{frame}")))

;; (setq ps-paper-type 'a4
;;       ps-font-size 16.0
;;       ps-print-header nil
;;       ps-landscape-mode nil)

;; letter class, for formal letters
;; (add-to-list 'org-export-latex-classes
;;              '("letter"
;;                "\\documentclass[11pt]{letter}\n
;;       \\usepackage[utf8]{inputenc}\n
;;       \\usepackage[T1]{fontenc}\n
;;       \\usepackage{color}"
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq plantuml-java-args (expand-file-name "~/.emacs.d/bin/plantuml.jar"))

(use-package plantuml-mode
  :ensure t
  :config
  ;; Enable plantuml-mode for PlantUML files
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))

  ;; Enable plantuml-mode within an org-mode document
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))

  ;; Use fundamental mode when editing plantuml blocks with C-c '
  (add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

  ;; active Org-babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(;; other Babel languages
     (plantuml . t)))
  )

(add-hook 'org-babel-after-execute-hook 'itsyc/display-inline-images 'append)

(defun itsyc/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

(require 'ox-publish)
(defun org-custom-link-img-follow (path)
  (org-open-file-with-emacs
   (format "../source/assets/%s" path)))   ;the path of the image in local dic

(defun org-custom-link-img-export (path desc format)
  (cond
   ((eq format 'html)
    (format "<img src=\"/assets/%s\" alt=\"%s\"/>" path desc)))) ;the path of the image in webserver

(org-add-link-type "img" 'org-custom-link-img-follow 'org-custom-link-img-export)
