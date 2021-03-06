(defconst yc/cache-dir (expand-file-name ".cache" user-emacs-directory)
  "Every cached or moving file should be here like with Spacemacs")

(make-directory yc/cache-dir t)

(setq gc-cons-threshold 268435456) ;; (* 256 1024 1024)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top
(set-language-environment 'utf-8)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook
          '(lambda() (set-fill-column 80)))

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

;; avoid problems with files newer than their byte-compiled counterparts
;; it's better a lower startup than load an outdated and maybe bugged package
(setq load-prefer-newer t)

(when (>= emacs-major-version 25)
  (require 'package)
  (setq package-enable-at-startup nil)
  ;; (setq package-archives '(("gnu"          . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
  ;;                          ("melpa"        . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
  ;;                          ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
  ;;                          ("org"          . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

  ;; (setq package-archives '(("gnu"          . "http://elpa.emacs-china.org/elpa/gnu/")
  ;;                          ("melpa"        . "http://elpa.emacs-china.org/elpa/melpa/")
  ;;                          ("melpa-stable" . "http://elpa.emacs-china.org/elpa/melpa-stable/")
  ;;                          ("org"          . "http://elpa.emacs-china.org/elpa/org/")))

  (setq package-archives
        '(("elpy"         . "http://jorgenschaefer.github.io/packages/")
          ("gnu"          . "http://elpa.gnu.org/packages/")
          ("melpa"        . "http://melpa.org/packages/")
          ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
          ("org"          . "http://orgmode.org/elpa/")))
  )

;; initialize the packages and create the packages list if not exists
(when (not package-archive-contents)
  (package-refresh-contents))

;; install use-package if not exists
;; Bootstrap `use-package'
;; 更新本地仓库里面的 package
(unless (package-installed-p 'use-package)
  (package-install 'use-package)
  (setq use-package-always-ensure t))

(eval-when-compile
  (require 'use-package))
(use-package diminish :ensure t)   ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

(use-package paradox
  :ensure t
  :config
  (setq-default
   paradox-column-width-package 27
   paradox-column-width-version 13
   paradox-execute-asynchronously t
   paradox-github-token t
   paradox-hide-wiki-packages t)
  (remove-hook 'paradox--report-buffer-print 'paradox-after-execute-functions))

(defhydra hydra-system (:color blue)
  "
^
^System^            ^Packages^          ^Processes^
^──────^────────────^────────^──────────^─────────^─────────
_q_ quit            _p_ list            _s_ list
^^                  _P_ upgrade         ^^
^^                  ^^                  ^^
"
  ("q" nil)
  ("p" paradox-list-packages)
  ("P" paradox-upgrade-packages)
  ("s" list-processes))

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
(setq truncate-lines nil)
(auto-fill-mode nil) ;; 不要自动将内容换行

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

;;; respect ansi colors
(ansi-color-for-comint-mode-on)

;;; ansi colors in compilation mode
(ignore-errors
  (defun yc/colorize-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (add-hook 'compilation-filter-hook yc/colorize-compilation-buffer))

(set-frame-parameter nil 'fullscreen (if (eq system-type 'windows-nt)
                                         'fullboth 'maximized))

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))

(hl-line-mode t)
;; (when window-system (global-hl-line-mode t))
;; (when window-system (global-prettify-symbols-mode t))

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;;(add-to-list 'default-frame-alist '(ns-appearance . dark))
;;(add-to-list 'default-frame-alist '(ns-appearance . light))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)
                          (bookmarks . 5))))

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
  :diminish ""
  :init
  (setq whitespace-style '(face tabs tab-mark trailing))
  :config
  (setq whitespace-line-column 120)
  (global-whitespace-mode t)
  (if window-system (progn
                      (set-cursor-color "Gray")
                      ;; make it delete trailing whitespace
                      (add-hook 'before-save-hook 'delete-trailing-whitespace)

                      (add-hook 'after-init-hook
                                (lambda () (set-face-attribute 'whitespace-newline nil
                                                               :foreground "#AAA"
                                                               :weight 'bold)))
                      )))

;;; START TABS CONFIG
;; Enable tabs and set prefered indentation width in spaces
;; (In this case the indent size is 2-spaces wide)
(setq-default indent-tabs-mode nil)
(setq-default standard-indent 4)
(setq-default tab-width 4)

;; Make the backspace properly erase the tab instead of
;; removing 1 space at a time.
(setq backward-delete-char-untabify-method 'hungry)

;; (OPTIONAL) Shift width for evil-mode users
;; For the vim-like motions of ">>" and "<<".
(setq-default evil-shift-width 4)

;; Visualize tabs as a pipe character - "|"
;; This will also show trailing characters as they are useful to spot.
(setq whitespace-style '(face tabs tab-mark trailing))
(custom-set-faces
 '(whitespace-tab ((t (:foreground "#636363")))))
(setq whitespace-display-mappings
      '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
(global-whitespace-mode) ; Enable whitespace mode everywhere

;; Disable tabs and use spaces instead on Lisp and ELisp
;; (defun disable-tabs () (setq indent-tabs-mode nil))
;; (add-hook 'lisp-mode-hook 'disable-tabs)
;; (add-hook 'emacs-lisp-mode-hook 'disable-tabs)
;;; END TABS CONFIG

(use-package dimmer
  :ensure t
  :init
  (dimmer-activate)
  :config
  (setq dimmer-percent 0.40))

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
;; (load-theme  'gruvbox-dark-soft t))
;; (load-theme  'gruvbox-dark-medium t))
;; (load-theme  'gruvbox-dark-hard t))
;; (load-theme  'gruvbox-light-medium t))
(load-theme  'gruvbox-light-soft t))
;; (load-theme  'gruvbox-light-hard t))

;; (use-package leuven-theme
;;   :ensure t
;;   :init
;;   (load-theme 'leuven t)
;;   :config
;;   ;; Fontify the whole line for headings (with a background color).
;;   (setq org-fontify-whole-heading-line t))

;; (use-package doom-themes
;;   :ensure t
;;   :init
;;   ;; Global settings (defaults)
;;   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;         doom-themes-enable-italic t) ; if nil, italics is universally disabled

;;   ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each
;;   ;; theme may have their own settings.
;;   (load-theme 'doom-one t)
;;   :config
;;   ;; Enable flashing mode-line on errors
;;   (doom-themes-visual-bell-config)

;;   ;; Enable custom neotree theme
;;   (doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

;;   ;; Corrects (and improves) org-mode's native fontification.
;;   (doom-themes-org-config)
;;   )

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package mdi
  :demand t
  :load-path "lisp/mdi/")

(use-package diminish
  :ensure t
  :config
  (diminish 'visual-line-mode "↩️ "))

(use-package autorevert
  :diminish (auto-revert-mode . "🔂 "))

(column-number-mode 1)
(line-number-mode 1)
(size-indication-mode t)

;;  (defun yc/powerline-theme ()
;;    "Setup the default mode-line."
;;    (interactive)
;;    (setq-default mode-line-format
;;                  '("%e"
;;                    (:eval
;;                     (let* ((active (powerline-selected-window-active))
;;                            (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
;;                            (mode-line (if active 'mode-line 'mode-line-inactive))
;;                            (face1 (if active 'powerline-active1 'powerline-inactive1))
;;                            (face2 (if active 'powerline-active2 'powerline-inactive2))
;;                            (separator-left (intern (format "powerline-%s-%s"
;;                                                            (powerline-current-separator)
;;                                                            (car powerline-default-separator-dir))))
;;                            (separator-right (intern (format "powerline-%s-%s"
;;                                                             (powerline-current-separator)
;;                                                             (cdr powerline-default-separator-dir))))
;;                            (lhs (list (powerline-raw "%*" mode-line 'l)
;;                                       (powerline-buffer-size mode-line 'l)
;;                                       (powerline-buffer-id mode-line-buffer-id 'l)
;;                                       (powerline-raw " ")
;;                                       (funcall separator-left mode-line face1)
;;                                       (powerline-narrow face1 'l)
;;                                       (powerline-vc face1)))
;;                            (rhs (list (powerline-raw global-mode-string face1 'r)
;;                                       (powerline-raw "%4l" face1 'r)
;;                                       (powerline-raw ":" face1)
;;                                       (powerline-raw "%3c" face1 'r)
;;                                       (funcall separator-right face1 mode-line)
;;                                       (powerline-raw " ")
;;                                       (powerline-raw "%6p" mode-line 'r)
;;                                       (powerline-hud face2 face1)))
;;                            (center (list (powerline-raw " " face1)
;;                                          (funcall separator-left face1 face2)
;;                                          (when (and (boundp 'erc-track-minor-mode) erc-track-minor-mode)
;;                                            (powerline-raw erc-modified-channels-object face2 'l))
;;                                          (powerline-major-mode face2 'l)
;;                                          (powerline-process face2)
;;                                          (powerline-raw " :" face2)
;;                                          (powerline-minor-modes face2 'l)
;;                                          (powerline-raw " " face2)
;;                                          (funcall separator-right face2 mode-line)
;;                                          (powerline-raw " " mode-line)
;;                                          (nyan-create)
;;                                          (funcall separator-right mode-line face2)
;;                                          (powerline-raw " " face2)
;;                                          (funcall separator-right face2 face1))))
;;                       (concat (powerline-render lhs)
;;                               (powerline-fill-center face1 (/ (powerline-width center) 2.0))
;;                               (powerline-render center)
;;                               (powerline-fill face1 (powerline-width rhs))
;;                               (powerline-render rhs)))))))
;;
;;  (defun yc/powerline-separator (&optional random-state)
;;    "Sets the powerline separator to a random one that is cool."
;;    (let ((r-state (or random-state
;;                       (make-random-state t)))
;;          (faves '(arrow brace butt chamfer curve rounded roundstub zigzag))
;;          (day-of-year (string-to-number (format-time-string "%j"))))
;;      (nth (% day-of-year
;;              (length faves))
;;           faves)))
;;
;;  (defun yc/set-random-powerline-separator ()
;;    "Set the powerline separator to something randomly cool"
;;    (setq powerline-default-separator (yc/powerline-separator)))
;;
;;  (use-package powerline
;;               :ensure t
;;               :demand
;;               :init
;;               (yc/set-random-powerline-separator)
;;               (yc/powerline-theme))
;;
;;  (use-package smart-mode-line
;;  :ensure t
;;  :config
;;  (progn
;;    (tool-bar-mode -1)
;;    (setq sml/theme 'respectful)
;;    (setq sml/name-width 40)
;;    (setq sml/mode-width 'full)
;;    (set-face-attribute 'mode-line nil :box nil)))

(use-package powerline
  :ensure t
  :config (progn
            ;; Wave seperators please
            ;; wave
            ;; arrow
            ;; rounded
            ;; zigzag
            ;; These two lines are just examples
            (setq powerline-arrow-shape 'zigzag)
            ;; (setq powerline-default-separator-dir '(right . left))
            ;; (setq powerline-default-separator 'nil)
            (powerline-vim-theme)))

(use-package powerline-evil
  :ensure t
  :config
  (powerline-evil-vim-color-theme))

(use-package nyan-mode
  :ensure t
  :init
  (progn
    (nyan-mode)
    (setq nyan-animate-nyancat t)
    (setq nyan-wavy-trail t)
    (setq nyan-bar-length 10))
  :config (nyan-start-animation))

;; 目前这个有 bug，会导致 emacs 卡死，但不知道具体原因
;; Use spacemacs' mode line
;; @see https://libraries.io/emacs/spaceline
;; @see https://github.com/TeMPOraL/nyan-mode
;; @see https://github.com/TheBB/spaceline
(use-package spaceline
  :ensure t
  :config (progn (use-package spaceline-config
                   :ensure spaceline
                   :config
                   (spaceline-helm-mode 1)
                   (spaceline-spacemacs-theme)
                   ;; (spaceline-emacs-theme)
                   )
                 (require 'spaceline-segments)
                 (spaceline-spacemacs-theme)
                 (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
                 ))

(use-package spaceline-all-the-icons
  :ensure t
  :after spaceline
  :config
  (spaceline-all-the-icons-theme)
  (spaceline-all-the-icons--setup-anzu)            ;; Enable anzu searching
  (spaceline-all-the-icons--setup-package-updates) ;; Enable package update indicator
  (spaceline-all-the-icons--setup-git-ahead)       ;; Enable # of commits ahead of upstream in git
  (spaceline-all-the-icons--setup-paradox)         ;; Enable Paradox mode line
  (spaceline-all-the-icons--setup-neotree)         ;; Enable Neotree mode line)
  )

(use-package all-the-icons-ivy
  :ensure t
  :after ivy
  :config
  (all-the-icons-ivy-setup))

;; (defface my-pl-segment1-active
;;   '((t (:foreground "#000000" :background "#E1B61A")))
;;   "Powerline first segment active face.")
;; (defface my-pl-segment1-inactive
;;   '((t (:foreground "#CEBFF3" :background "#3A2E58")))
;;   "Powerline first segment inactive face.")
;; (defface my-pl-segment2-active
;;   '((t (:foreground "#F5E39F" :background "#8A7119")))
;;   "Powerline second segment active face.")
;; (defface my-pl-segment2-inactive
;;   '((t (:foreground "#CEBFF3" :background "#3A2E58")))
;;   "Powerline second segment inactive face.")
;; (defface my-pl-segment3-active
;;   '((t (:foreground "#CEBFF3" :background "#3A2E58")))
;;   "Powerline third segment active face.")
;; (defface my-pl-segment3-inactive
;;   '((t (:foreground "#CEBFF3" :background "#3A2E58")))
;;   "Powerline third segment inactive face.")

;; (defun air--powerline-default-theme ()
;;   "Set up my custom Powerline with Evil indicators."
;;   (interactive)
;;   (setq-default mode-line-format
;;                 '("%e"
;;                   (:eval
;;                    (let* ((active (powerline-selected-window-active))
;;                           (seg1 (if active 'my-pl-segment1-active 'my-pl-segment1-inactive))
;;                           (seg2 (if active 'my-pl-segment2-active 'my-pl-segment2-inactive))
;;                           (seg3 (if active 'my-pl-segment3-active 'my-pl-segment3-inactive))
;;                           (separator-left (intern (format "powerline-%s-%s"
;;                                                           (powerline-current-separator)
;;                                                           (car powerline-default-separator-dir))))
;;                           (separator-right (intern (format "powerline-%s-%s"
;;                                                            (powerline-current-separator)
;;                                                            (cdr powerline-default-separator-dir))))
;;                           (lhs (list (let ((evil-face (powerline-evil-face)))
;;                                        (if evil-mode
;;                                            (powerline-raw (powerline-evil-tag) evil-face)
;;                                          ))
;;                                      (if evil-mode
;;                                          (funcall separator-left (powerline-evil-face) seg1))
;;                                      ;;(when powerline-display-buffer-size
;;                                      ;;  (powerline-buffer-size nil 'l))
;;                                      ;;(when powerline-display-mule-info
;;                                      ;;  (powerline-raw mode-line-mule-info nil 'l))
;;                                      (powerline-buffer-id seg1 'l)
;;                                      (powerline-raw "[%*]" seg1 'l)
;;                                      (when (and (boundp 'which-func-mode) which-func-mode)
;;                                        (powerline-raw which-func-format seg1 'l))
;;                                      (powerline-raw " " seg1)
;;                                      (funcall separator-left seg1 seg2)
;;                                      (when (boundp 'erc-modified-channels-object)
;;                                        (powerline-raw erc-modified-channels-object seg2 'l))
;;                                      (powerline-major-mode seg2 'l)
;;                                      (powerline-process seg2)
;;                                      (powerline-minor-modes seg2 'l)
;;                                      (powerline-narrow seg2 'l)
;;                                      (powerline-raw " " seg2)
;;                                      (funcall separator-left seg2 seg3)
;;                                      (powerline-vc seg3 'r)
;;                                      (when (bound-and-true-p nyan-mode)
;;                                        (powerline-raw (list (nyan-create)) seg3 'l))))
;;                           (rhs (list (powerline-raw global-mode-string seg3 'r)
;;                                      (funcall separator-right seg3 seg2)
;;                                      (unless window-system
;;                                        (powerline-raw (char-to-string #xe0a1) seg2 'l))
;;                                      (powerline-raw "%4l" seg2 'l)
;;                                      (powerline-raw ":" seg2 'l)
;;                                      (powerline-raw "%3c" seg2 'r)
;;                                      (funcall separator-right seg2 seg1)
;;                                      (powerline-raw " " seg1)
;;                                      (powerline-raw "%6p" seg1 'r)
;;                                      (when powerline-display-hud
;;                                        (powerline-hud seg1 seg3)))))
;;                      (concat (powerline-render lhs)
;;                              (powerline-fill seg3 (powerline-width rhs))
;;                              (powerline-render rhs)))))))

;; (use-package powerline
;;   :ensure t
;;   :config
;;   (powerline-default-theme)
;;   (setq powerline-default-separator (if (display-graphic-p) 'slant
;;                                       nil))
;;   (air--powerline-default-theme)
;;   )

(use-package smartparens
  :ensure t
  :diminish ""
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

;; (use-package fill-column-indicator
;;   :ensure t
;;   :config
;;   (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
;;   (add-hook 'org-mode-hook
;;             '(lambda ()
;;                (fci-mode 1)))
;;   (setq fci-rule-character-color "#383838")
;;   (setq-default fci-rule-column 119)
;;   (global-fci-mode -1))

(use-package highlight-indentation
  :ensure t
  :init
  (highlight-indentation-mode t)
  :config
  (set-face-background 'highlight-indentation-face "#e3e3d3")
  (set-face-background 'highlight-indentation-current-column-face "#c3b3b3"))

(use-package zoom-window
  :ensure t
  :config
  (global-set-key (kbd "C-x C-z") 'zoom-window-zoom)
  (setq zoom-window-mode-line-color "DarkGreen"))

;;; ace-window
(use-package ace-window
  :ensure t
  :bind ("C-x o" . ace-window))

(use-package eyebrowse
  :ensure t
  :defer 1
  :bind
  ("<f5>" . eyebrowse-switch-to-window-config-1)
  ("<f6>" . eyebrowse-switch-to-window-config-2)
  ("<f7>" . eyebrowse-switch-to-window-config-3)
  ("<f8>" . eyebrowse-switch-to-window-config-4)
  :config
  (eyebrowse-mode 1)
  (setq-default eyebrowse-new-workspace t))

(defhydra hydra-eyebrowse (:color blue)
  "
^
^Eyebrowse^         ^Do^                ^Switch^
^─────────^─────────^──^────────────────^──────^────────────
_q_ quit            _c_ create          _<_ previous
^^                  _k_ kill            _>_ next
^^                  _r_ rename          _e_ last
^^                  ^^                  _s_ switch
^^                  ^^                  ^^
"
  ("q" nil)
  ("<" eyebrowse-prev-window-config :color red)
  (">" eyebrowse-next-window-config :color red)
  ("c" eyebrowse-create-window-config)
  ("e" eyebrowse-last-window-config)
  ("k" eyebrowse-close-window-config :color red)
  ("r" eyebrowse-rename-window-config)
  ("s" eyebrowse-switch-to-window-config))

(when (fboundp 'winner-mode)
      (winner-mode 1))

(use-package winum
  :ensure t
  :init
  (winum-mode)
  (setq winum-keymap
        (let ((map (make-sparse-keymap)))
          (define-key map (kbd "C-`") 'winum-select-window-by-number)
          (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
          (define-key map (kbd "M-1") 'winum-select-window-1)
          (define-key map (kbd "M-2") 'winum-select-window-2)
          (define-key map (kbd "M-3") 'winum-select-window-3)
          (define-key map (kbd "M-4") 'winum-select-window-4)
          (define-key map (kbd "M-5") 'winum-select-window-5)
          (define-key map (kbd "M-6") 'winum-select-window-6)
          (define-key map (kbd "M-7") 'winum-select-window-7)
          (define-key map (kbd "M-8") 'winum-select-window-8)
          map))
  :config
  (setq winum-auto-setup-mode-line nil))

(use-package rainbow-mode
  :hook prog-mode
  :config (setq-default rainbow-x-colors-major-mode-list '()))

;; frame font
;; Setting English Font
;; (if (member "Monaco" (font-family-list))
;;    (set-face-attribute
;;     'default nil :font "Monaco 13"))
(if (member "Source Code Pro" (font-family-list))
    (set-face-attribute
     'default nil :font "Source Code Pro 14"))

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

;; (set-face-attribute 'mode-line nil :font "Source Code Pro 13")
;; (set-face-attribute 'mode-line nil :font "DejaVu Sans Mono-12")

(use-package pcache ;; Required by unicode-fonts
  :ensure t
  :init
  ;; Mentioned here to redirect directory
  (setq pcache-directory (expand-file-name "pcache/" yc/cache-dir)))

(use-package unicode-fonts
  :ensure t
  :demand t
  :config
  (unicode-fonts-setup))

(use-package all-the-icons :ensure t)

;; @see http://coldnew.github.io/blog/2013/05-20_5cbb7/
(use-package pangu-spacing
  :ensure t
  :diminish ""
  :config
  (global-pangu-spacing-mode 1)
  (add-hook 'org-mode-hook
            '(lambda ()
               (set (make-local-variable 'pangu-spacing-real-insert-separtor) t))))

(use-package autothemer :ensure t)

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :init
  (which-key-mode)
  (which-key-setup-minibuffer)
  (which-key-setup-side-window-bottom)
  :config
  (setq which-key-sort-order 'which-key-key-order-alpha)
  (setq which-key-use-C-h-commands nil)
  (setq which-key-idle-delay 0.2)
  (add-to-list 'which-key-key-replacement-alist '("TAB" . "↹"))
  (add-to-list 'which-key-key-replacement-alist '("RET" . "⏎"))
  (add-to-list 'which-key-key-replacement-alist '("DEL" . "⇤"))
  (add-to-list 'which-key-key-replacement-alist '("SPC" . "␣")))

(setq evil-want-integration nil)

;; @see http://wikemacs.org/wiki/Evil
(use-package evil
  :ensure t
  :init
  (evil-mode 1)
  :config

  ;; @see http://nathantypanski.com/blog/2014-08-03-a-vim-like-emacs-config.html
  ;; (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  ;; (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  ;; (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  ;; (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

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
  (defun yc/evil-paste-last-insertion ()
    (interactive)
    (evil-paste-from-register ?.))

  (eval-after-load 'evil-maps
    '(define-key evil-insert-state-map (kbd "C-a") 'yc/evil-paste-last-insertion))

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
  (global-set-key (kbd "M-/") 'evilnc-comment-or-uncomment-lines)
  (global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
  (global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
  (global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

  ;; (evil-leader/set-key
  ;;   "ci" 'evilnc-comment-or-uncomment-lines
  ;;   "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  ;;   "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  ;;   "cc" 'evilnc-copy-and-comment-lines
  ;;   "cp" 'evilnc-comment-or-uncomment-paragraphs
  ;;   "cr" 'comment-or-uncomment-region
  ;;   "cv" 'evilnc-toggle-invert-comment-line-by-line
  ;;   "\\" 'evilnc-comment-operator ; if you prefer backslash key
  ;;   )
)

(use-package evil-surround
  :ensure t
  :after org
  :init
  (global-evil-surround-mode 1))

(use-package evil-goggles
  :ensure t
  :diminish ""
  :after org
  :config
  (evil-goggles-mode))

(use-package evil-search-highlight-persist
  :ensure t
  :init
  (global-evil-search-highlight-persist t))

;; mac switch meta key
(defun yc/mac-switch-meta nil
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

;; use 'keyfreq-show'
;; @see https://github.com/dacap/keyfreq
(use-package keyfreq
  :ensure t
  :init
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

(use-package general
  :ensure t
  :init
  (general-def :states '(normal motion emacs) "SPC" nil)
  :config
  (general-evil-setup t)

  (general-define-key
   :states '(normal motion visual)
   :prefix "SPC"
   :global-prefix "C-SPC"
   "SPC" 'helm-M-x
   "TAB" 'mode-line-other-buffer
   "a"   '(:ignore t :which-key "applications")
   "ai"  '(:ignore t :which-key "irc")
   "as"  '(:ignore t :which-key "shells")
   "ar" '(ranger :which-key "call ranger")
   "b"   '(:ignore t :which-key "buffers")
   "bb" 'helm-mini
   "bk" 'kill-this-buffer
   "be" 'ibuffer
   "c"   '(:ignore t :which-key "compile/comments")
   "C"   '(:ignore t :which-key "capture/colors")
   "cl" 'evilnc-comment-or-uncomment-lines
   "e"   '(:ignore t :which-key "errors")
   "f"   '(:ignore t :which-key "files")
   "fC"  '(:ignore t :which-key "files/convert")
   "fe"  '(:ignore t :which-key "emacs(spacemacs)")
   "fv"  '(:ignore t :which-key "variables")
   "fh"  'helm-find-files
   "fc" 'helm-recentf
   "ff" 'ido-find-file
   "ft" 'neotree-toggle
   "fs" 'save-buffer
   "fo" 'yc/dired-open-in-finder
   "g"   '(:ignore t :which-key "git/versions-control")
   "gs" '(magit-status :which-key "git status")
   "gt"  '(git-timemachine-toggle :which-key "git timemachine")
   ;; "gs"  'magit-status
   "h"   '(:ignore t :which-key "help")
   "hb" 'helm-descbinds
   "hd"  '(:ignore t :which-key "help-describe")
   "i"   '(:ignore t :which-key "insertion")
   "j"   '(:ignore t :which-key "jump/join/split")
   "jj" 'avy-goto-word-or-subword-1
   "jk"  'avy-goto-char
   "jl"  'avy-goto-line
   "uu"  'undo-tree-visualize
   "k"   '(:ignore t :which-key "lisp")
   "kd"  '(:ignore t :which-key "delete")
   "kD"  '(:ignore t :which-key "delete-backward")
   "k`"  '(:ignore t :which-key "hybrid")
   "n"   '(:ignore t :which-key "narrow/numbers")
   "p"   '(:ignore t :which-key "projects")
   "p$"  '(:ignore t :which-key "projects/shell")
   "pf" 'projectile-find-file
   "ps" 'helm-projectile-switch-project
   "q"   '(:ignore t :which-key "quit")
   "qq"  'delete-window
   "r"   '(:ignore t :which-key "registers/rings/resume")
   "Re"  '(:ignore t :which-key "elisp")
   "Rp"  '(:ignore t :which-key "pcre")
   "s"   '(:ignore t :which-key "search/symbol")
   "sa"  '(:ignore t :which-key "ag")
   "sg"  '(:ignore t :which-key "grep")
   "sk"  '(:ignore t :which-key "ack")
   "st"  '(:ignore t :which-key "pt")
   "sw"  '(:ignore t :which-key "web")
   "saa" 'ag
   "sap" 'ag-project
   "sas" 'helm-ag
   "saf" 'helm-do-ag
   "sap" 'helm-do-ag-project-root
   "sc"  'evil-search-highlight-persist-remove-all
   "ss"  'helm-swoop
   "sS" 'helm-swoop-region-or-symbol
   "w"   '(:ignore t :which-key "windows")
   "wp"  '(:ignore t :which-key "popup")
   "wh" 'windmove-left
   "wl" 'windmove-right
   "wk" 'windmove-up
   "wj" 'windmove-down
   "w/" 'split-window-right
   "w-" 'split-window-below
   "wc" 'delete-window
   "wd" 'delete-frame
   "t"   '(:ignore t :which-key "toggles")
   "tC"  '(:ignore t :which-key "colors")
   "tE"  '(:ignore t :which-key "editing-styles")
   "th"  '(:ignore t :which-key "highlight")
   "tm"  '(:ignore t :which-key "modeline")
   "T"   '(:ignore t :which-key "UI toggles/themes")
   "Tf" 'toggle-frame-fullscreen
   "Tm" 'toggle-frame-maximized
   "x"   '(:ignore t :which-key "text")
   "xa"  '(:ignore t :which-key "align")
   "xd"  '(:ignore t :which-key "delete")
   "xg"  '(:ignore t :which-key "google-translate")
   "xl"  '(:ignore t :which-key "lines")
   "xm"  '(:ignore t :which-key "move")
   "xt"  '(:ignore t :which-key "transpose")
   "xw"  '(:ignore t :which-key "words")
   "z"   '(:ignore t :which-key "zoom")
   "C-t" '(:ignore t :which-key "other toggles")
   ))

(defun yc/new-buffer-frame ()
  "Create a new frame with a new empty buffer."
  (interactive)
  (let ((buffer (generate-new-buffer "Untitled")))
    (set-buffer-major-mode buffer)
    (display-buffer buffer '(display-buffer-pop-up-frame . nil))))

(global-set-key (kbd "C-c n") #'yc/new-buffer-frame)

(use-package desktop
  :ensure t
  :demand t
  :config
  (desktop-save-mode 1)
  (add-to-list 'desktop-globals-to-save 'golden-ratio-adjust-factor))

(use-package direx
  :ensure t
  :init
  (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory))

(use-package projectile
  :ensure t
  :commands (projectile-project-root)
  ;; :init (projectile-global-mode)
  :config (progn (setq projectile-mode-line '(:eval (format " Proj[%s]" (projectile-project-name))))

                 (setq projectile-enable-caching t)
                 (setq projectile-completion-system 'default)
                 (setq projectile-indexing-method 'alien)

                 ;; add to the globally ignored files
                 (dolist (file-name '("*~" "*.elc"))
                   (add-to-list 'projectile-globally-ignored-files file-name))))

(defun yc/helm-project-do-ag ()
  "Search in current project with `ag'."
  (interactive)
  (let ((dir (projectile-project-root)))
    (if dir
        (helm-do-ag dir)
      (message "error: Not in a project."))))

(use-package neotree
  :ensure t
  :diminish ""
  :config
  (setq neo-smart-open t)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (setq neo-window-fixed-size nil)  ; 通过设置该参数，可以手动调整 neotree 窗口大小
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
  ;; Disable line-numbers minor mode for neotree
  (add-hook 'neo-after-create-hook (lambda (&optional dummy) (display-line-numbers-mode -1)))
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

(defun neotree-resize-window (&rest _args)
  "Resize neotree window.
https://github.com/jaypei/emacs-neotree/pull/110"
  (interactive)
  (neo-buffer--with-resizable-window
   (let ((fit-window-to-buffer-horizontally t))
     (fit-window-to-buffer))))

(add-hook 'neo-change-root-hook #'neotree-resize-window)
(add-hook 'neo-enter-hook #'neotree-resize-window)

(use-package go-mode
  :ensure t
  :mode ("\\.go" . go-mode)
  :commands go-mode
  :init (add-to-list 'auto-mode-alist '("\\.go$" . go-mode))
  :config (progn (use-package company-go
                   :ensure t
                   :after go-mode company
                   :commands company-go
                   :if (executable-find "gocode")
                   :init (add-hook 'after-init-hook
                                   (lambda ()(add-to-list 'company-backends 'company-go))))
                 (use-package go-direx
                   :ensure t
                   :after go-mode
                   :init
                   (define-key go-mode-map (kbd "C-c C-j") 'go-direx-pop-to-buffer))
                 (use-package go-eldoc
                   :ensure t
                   :after go-mode
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
                             (setq indent-tabs-mode nil))))
  )

(use-package go-complete
  :ensure t
  :after go-mode)
(use-package go-errcheck
  :ensure t
  :after go-mode)
(use-package go-gopath
  :ensure t
  :after go-mode)
(use-package go-impl :ensure t)
(use-package go-projectile
  :ensure t
  :after go-mode projectile)
(use-package go-snippets
  :ensure go-snippets
  :after go-mode company
  :init (go-snippets-initialize))
(use-package go-rename
  :ensure t
  :after go-mode)

;; Quick run current buffer
(defun yc/go ()
  "run current buffer"
  (interactive)
  (compile (concat "go run " (buffer-file-name))))

;; use goimports instead of gofmt ::super
(setq gofmt-command "goimports")

(defun yc/go-run-tests (args)
  (interactive)
  (save-selected-window
    (async-shell-command (concat "go test " args))))

(defun yc/go-run-package-tests ()
  (interactive)
  (yc/go-run-tests ""))

(defun yc/go-run-package-tests-nested ()
  (interactive)
  (yc/go-run-tests "./..."))

(defun yc/go-run-test-current-function ()
  (interactive)
  (if (string-match "_test\\.go" buffer-file-name)
      (let ((test-method (if go-use-gocheck-for-testing
                             "-check.f"
                           "-run")))
        (save-excursion
          (re-search-backward "^func[ ]+\\(([[:alnum:]]*?[ ]?[*]?[[:alnum:]]+)[ ]+\\)?\\(Test[[:alnum:]_]+\\)(.*)")
          (yc/go-run-tests (concat test-method "='" (match-string-no-properties 2) "'"))))
    (message "Must be in a _test.go file to run go-run-test-current-function")))

(defun yc/go-run-test-current-suite ()
  (interactive)
  (if (string-match "_test\.go" buffer-file-name)
      (if go-use-gocheck-for-testing
          (save-excursion
            (re-search-backward "^func[ ]+\\(([[:alnum:]]*?[ ]?[*]?\\([[:alnum:]]+\\))[ ]+\\)?Test[[:alnum:]_]+(.*)")
            (yc/go-run-tests (concat "-check.f='" (match-string-no-properties 2) "'")))
        (message "Gocheck is needed to test the current suite"))
    (message "Must be in a _test.go file to run go-test-current-suite")))

(defun yc/go-run-main ()
  (interactive)
  (shell-command
   (format "go run %s"
           (shell-quote-argument (buffer-file-name)))))

(general-define-key
 :keymaps 'go-mode-map
 :states '(normal motion visual)
 :prefix "SPC"
 :global-prefix "C-SPC"
 "m" '(:ignore t :which-key "major-mode-cmd")
 "mh" '(:ignore t :which-key "help")
 "mhh" 'godoc-at-point
 "mi" '(:ignore t :which-key "imports")
 "mig" 'go-goto-imports
 "mia" 'go-import-add
 "mir" 'go-remove-unused-imports
 "me" '(:ignore t :which-key "playground")
 "meb" 'go-play-buffer
 "mer" 'go-play-region
 "med" 'go-download-play
 "mx" '(:ignore t :which-key "execute")
 "mxx" 'yc/go-run-main
 "mg" '(:ignore t :which-key "goto")
 "mga" 'ff-find-other-file
 "mgc" 'go-coverage
 "mt" '(:ignore t :which-key "test")
 "mtt" 'yc/go-run-test-current-function
 "mts" 'yc/go-run-test-current-suite
 "mtp" 'yc/go-run-package-tests
 "mtP" 'yc/go-run-package-tests-nested
 "mf" '(:ignore t :which-key "guru")
 "mfd" 'go-guru-describe
 "mff" 'go-guru-freevars
 "mfi" 'go-guru-implements
 "mfc" 'go-guru-peers
 "mfr" 'go-guru-referrers
 "mfj" 'go-guru-definition
 "mfp" 'go-guru-pointsto
 "mfs" 'go-guru-callstack
 "mfe" 'go-guru-whicherrs
 "mf<" 'go-guru-callers
 "mf>" 'go-guru-callees
 "mfo" 'go-guru-set-scope
 "mr" '(:ignore t :which-key "rename")
 "mrn" 'go-rename)

(use-package exec-path-from-shell
  :ensure t
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(defun yc/run-current-file ()
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

(use-package python
  :ensure t
  :config

  ;; use IPython
  (setq-default py-shell-name "ipython")
  (setq-default py-which-bufname "IPython")
  ;; use the wx backend, for both mayavi and matplotlib
  (setq py-python-command-args
        '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
  (setq py-force-py-shell-name-p t)

  ;; switch to the interpreter after executing code
  (setq py-shell-switch-buffers-on-execute-p t)
  (setq py-switch-buffers-on-execute-p t)
  ;; don't split windows
  (setq py-split-windows-on-execute-p nil)
  ;; try to automagically figure out indentation
  (setq py-smart-indentation t))

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(use-package anaconda-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  (use-package company-anaconda
    :ensure t
    :config
    (eval-after-load "company"
      '(add-to-list 'company-backends '(company-anaconda :with company-capf)))))

(general-define-key
 :keymaps 'python-mode-map
 :states '(normal motion visual)
 :prefix "SPC"
 :global-prefix "C-SPC"
 "m"   '(:ignore t :which-key "major-mode-cmd")
 "m'"  'python-start-or-switch-repl
 "m="  'yapfify-buffer
 "mc"  '(:ignore t :which-key "execute")
 "mcc" 'python-execute-file
 "mcC" 'python-execute-file-focus
 "md"  '(:ignore t :which-key "debug")
 "mdb" 'python-toggle-breakpoint  ; check in spacemacs
 "mh"  '(:ignore t :which-key "help")
 "mhh" 'anaconda-mode-show-doc
 "mhd" 'helm-pydoc
 "mg"  '(:ignore t :which-key "goto")
 "mga" 'anaconda-mode-find-assignments
 "mgb" 'anaconda-mode-go-back
 "mgu" 'anaconda-mode-find-references
 "ms"  '(:ignore t :which-key "send to REPL")
 "msB" 'python-shell-send-buffer-switch
 "msb" 'python-shell-send-buffer
 "msF" 'python-shell-send-defun-switch
 "msf" 'python-shell-send-defun
 "msi" 'python-start-or-switch-repl
 "msR" 'python-shell-send-region-switch
 "msr" 'python-shell-send-region
 "mr"  '(:ignore t :which-key "refactor")
 "mri" 'python-remove-unused-imports  ; in spacemacs
 "mrI" 'py-isort-buffer
 "mv"  '(:ignore t :which-key "pyenv")
 "mvu" 'pyenv-mode-unset
 "mvs" 'pyenv-mode-set
 "mV"  '(:ignore t :which-key "pyvenv")
 "mVa" 'pyvenv-activate
 "mVd" 'pyvenv-deactivate
 "mVw" 'pyvenv-workon)

(use-package helm-pydoc :defer t)

(use-package pyenv-mode
  :if (executable-find "pyenv")
  :commands (pyenv-mode-versions))

(use-package pyvenv
  :ensure t
  :defer t)

(use-package py-isort
  :ensure t
  :defer t)

(use-package yapfify
  :ensure t
  :defer t)

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

;; (use-package typescript :ensure t)

(use-package ng2-mode
  :ensure t)

(use-package tide
  :ensure t
  :config
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    ;; company is an optional dependency. You have to
    ;; install it separately via package-install
    ;; `M-x package-install [ret] company`
    (company-mode +1))

  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)

  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save)

  (add-hook 'typescript-mode-hook #'setup-tide-mode)
  (setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil)))

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
  (setq web-mode-auto-close-style 2)
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
  (add-hook 'web-mode-hook
            (lambda ()
              (when (string-equal "jsx" (file-name-extension buffer-file-name))
                (setup-tide-mode))))
  ;; configure jsx-tide checker to run after your default jsx checker
  (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append))

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
  (setq markdown-command "/usr/local/Cellar/multimarkdown/6*/bin/multimarkdown")
  :config
  ;; Turn on flyspell mode when editing markdown files
  (add-hook 'markdown-mode-hook 'flyspell-mode)
  (add-hook 'gfm-mode-hook 'flyspell-mode)
  :preface
  (defun yc/markdown-set-ongoing-hydra-body ()
    (setq yc/ongoing-hydra-body #'hydra-markdown/body))
  :hook (markdown-mode . yc/markdown-set-ongoing-hydra-body)
  )

(use-package markdown-toc :ensure t)
(use-package markdown-mode+ :ensure t)

(use-package markdownfmt
  :ensure t
  :config
  ;; (add-hook 'markdown-mode-hook #'markdownfmt-enable-on-save)
  :bind
  (:map markdown-mode-map ("C-c C-f" . markdownfmt-format-buffer)))

(use-package smex
  :ensure t
  :init
  (smex-initialize)
  :config
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

(use-package helm
  :ensure t
  :diminish ""
  :config
  (helm-mode 1)
  (helm-autoresize-mode 1)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 100)
  (set-face-attribute 'helm-selection nil :background "yellow" :foreground "black")
  (define-key helm-map (kbd "C-j") 'helm-next-line)
  (define-key helm-map (kbd "C-k") 'helm-previous-line)
  (define-key helm-map (kbd "C-h") 'helm-next-source)
  (define-key helm-map (kbd "C-S-h") 'describe-key)
  (define-key helm-map (kbd "C-l") (kbd "RET"))
  (define-key helm-map [escape] 'helm-keyboard-quit))

(use-package company
  :ensure t
  :defer t
  :commands global-company-mode
  :diminish ""
  :init
  (global-company-mode t)
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-show-numbers t)
  (setq company-require-match nil)
  (setq company-dabbrev-downcase nil) ;; make company-complete care about case
  (setq company-dabbrev-ignore-case nil) ;; fix case-sensitive, default is keep-prefix
  :config
  (setq company-idle-delay 0.2)
  (setq company-tooltip-flip-when-above t)
  (setq company-selection-wrap-around t)
  (define-key company-active-map [tab] 'company-select-next)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map [return] 'company-complete-selection)
  (define-key company-active-map (kbd "C-/") 'helm-company)

  ;; (global-set-key (kbd "M-/") 'hippie-expand)
  ;; (define-key evil-insert-state-map [remap evil-complete-previous] 'hippie-expand)
  (setq hippie-expand-try-functions-list
        '(
          ;; Try to expand word "dynamically", searching the current buffer.
          try-expand-dabbrev
          ;; Try to expand word "dynamically", searching all other buffers.
          try-expand-dabbrev-all-buffers
          ;; Try to expand word "dynamically", searching the kill ring.
          try-expand-dabbrev-from-kill
          ;; Try to complete text as a file name, as many characters as unique.
          try-complete-file-name-partially
          ;; Try to complete text as a file name.
          try-complete-file-name
          ;; Try to expand word before point according to all abbrev tables.
          try-expand-all-abbrevs
          ;; Try to complete the current line to an entire line in the buffer.
          try-expand-list
          ;; Try to complete the current line to an entire line in the buffer.
          try-expand-line
          ;; Try to complete as an Emacs Lisp symbol, as many characters as
          ;; unique.
          try-complete-lisp-symbol-partially
          ;; Try to complete word as an Emacs Lisp symbol.
          try-complete-lisp-symbol))
  )

(use-package fuzzy :defer t)

;; (use-package company-box
;;   :ensure t
;;   :after company
;;   :diminish
;;   :hook (company-mode . company-box-mode))

(use-package company-quickhelp
  :ensure t
  :after company
  :config
  (company-quickhelp-mode t))

(use-package company-statistics
  :ensure t
  :after company
  :config
  (company-statistics-mode))

;; @see - http://oremacs.com/2017/12/27/company-numbers/
(let ((map company-active-map))
  (mapc
   (lambda (x)
     (define-key map (format "%d" x) 'ora-company-number))
   (number-sequence 0 9))
  (define-key map " " (lambda ()
                        (interactive)
                        (company-abort)
                        (self-insert-command 1)))
  (define-key map (kbd "<return>") nil))

(defun ora-company-number ()
  "Forward to `company-complete-number'.

Unless the number is potentially part of the candidate.
In that case, insert the number."
  (interactive)
  (let* ((k (this-command-keys))
         (re (concat "^" company-prefix k)))
    (if (cl-find-if (lambda (s) (string-match re s))
                    company-candidates)
        (self-insert-command 1)
      (company-complete-number (string-to-number k)))))

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
  :diminish ""
  :commands global-flycheck-mode
  :config (progn (use-package popup
                   :ensure t)
                 (use-package flycheck-pos-tip
                   :ensure t)
                 (add-to-list 'flycheck-disabled-checkers 'emacs-lisp-checkdoc)
                 (setq flycheck-display-errors-function 'flycheck-pos-tip-error-messages)
                 (global-flycheck-mode)))

(require 'org)
(require 'org-mouse)

(use-package org
  :ensure nil
  :delight org-mode "Org"
  :preface
  (defun yc/org-set-ongoing-hydra-body ()
    (setq yc/ongoing-hydra-body #'hydra-org/body))
  :hook
  (org-mode . yc/org-set-ongoing-hydra-body)
)
(setq org-directory "/Users/yangc/Dropbox/itsycnotes")
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
       (headline           `(:inherit default))
       (headline-1         `(:inherit default :weight bold)))

  (set-face-attribute 'default nil :font "Source Code Pro 14")
  ;; Chinese Font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset (font-spec :family "Hiragino Sans GB" :size 16)))

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
                          ))
;; Keep the headlines expanded in Org-Mode
;; @see http://emacs.stackexchange.com/questions/9709/keep-the-headlines-expanded-in-org-mode
(setq org-startup-folded nil)
;; Disabling underscore-to-subscript in Emacs Org-Mode export
;; @see http://stackoverflow.com/questions/698562/disabling-underscore-to-subscript-in-emacs-org-mode-export/701201#701201
(setq org-export-with-sub-superscripts nil)
(defcustom org-indent-indentation-per-level 4
  "Indentation per level in number of characters."
  :group 'org-indent
  :type 'integer)
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
(set-register ?n (cons 'file "/Users/yangc/Dropbox/itsycnotes/home.org"))
(set-register ?s (cons 'file "/Users/yangc/Dropbox/itsycnotes/draft.org"))
(set-register ?g (cons 'file "/Users/yangc/Dropbox/itsycnotes/diary.org"))

(setq org-goto-interface 'outline-path-completion org-goto-max-level 10)

(use-package org-bullets
  :ensure t
  :after org
  :init
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  ;; "◎" "○" "►" "◇" "⊛" "✪" "☯" "⊙" "✪" "➲" "●" "⬤" "⚉"  "⸖" "ͼ" "ͽ" "⚬" "◌""￮""""⚫"
  ;; "☉" "⦾" "◦" "∙" "∘" "⚪" "◯" "⦿" "⌾" "◉"
  ;; (setq org-bullets-bullet-list '("❂" "⊚" "❍"))
  (setq org-bullets-bullet-list '("◉" "❂" "✸" "✿" "☼" "⚬")))

(use-package htmlize :ensure t)

(setq org-publish-project-alist
      '(
        ("org-blog-content" ;; 博客内容
         ;; Path to your org files.
         :base-directory "/Users/yangc/Dropbox/itsycnotes/"
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
         :base-directory "/Users/yangc/Dropbox/itsycnotes/"
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

(defun yc/org-toggle-link-display ()
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
(defun yc/org-screenshot ()
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

(setq org-image-actual-width 800)

(use-package org-attach-screenshot :ensure t)

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
    (lgrep search "*org*" "/Users/yangc/Dropbox/itsycnotes/")))

;; http://cachestocaches.com/2016/9/my-workflow-org-agenda/#capture--refile
(setq org-agenda-files '("/Users/yangc/Dropbox/itsycnotes/gtd.org"))

(setq org-refile-targets '(("/Users/yangc/Dropbox/itsycnotes/gtd.org" :maxlevel . 3)
                           ("/Users/yangc/Dropbox/itsycnotes/someday.org" :level . 1)
                           ("/Users/yangc/Dropbox/itsycnotes/tickler.org" :maxlevel . 2)))
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
(setq org-default-notes-file (concat org-directory "gtd.org"))
(setq org-columns-default-format "%50ITEM(Task) %10CLOCKSUM %16TIMESTAMP_IA")
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
;; :empty-lines 2
(setq org-capture-templates
      '(("t" "todo [inbox]" entry (file+headline "gtd.org" "Tasks")
         "* TODO %i%?\n%U\n" :clock-in t :clock-resume t :prepend t :empty-lines 1)
        ("T" "Tickler" entry (file+headline "gtd/tickler.org" "Tickler")
         "* %i%? \n %U")
        ("w" "Work TODO" entry (file+olp "gtd.org" "Work" "Tasks")
         "* TODO %? :work:\n:PROPERTIES:\n:CREATED: %U\n:END:" :clock-in t :clock-resume t)
        ("a" "Appointment" entry (file  "gtd.org" "Appointments")
         "* TODO %?\n:PROPERTIES:\n\n:END:\nDEADLINE: %^T \n %i\n")
        ("m" "Meeting" entry (file+headline "gtd.org" "Meeting")
         "* DONE MEETING with %? :MEETING:\n:SUBJECT:\n%U\n" :clock-in t :clock-resume t)
        ("d" "Diary" entry (file+datetree "diary.org")
         "* %?\n%U\n" :clock-in t :clock-resume t)
        ("i" "Idea" entry (file+headline "Blog Topics:")
         "* %? :IDEA: \n%t" :clock-in t :clock-resume t)
        ("n" "Next Task" entry (file+headline org-default-notes-file "Tasks")
         "** NEXT %? \nDEADLINE: %t")
        ("l" "Link" entry (file+headline "gtd.org" "Links")
         "* %? %^L %^g \n%T" :prepend t)
        ("l" "A link, for reading later." entry (file+headline "gtd.org" "Reading List")
         "* %:description\n%u\n\n%c\n\n%i")
        ("n" "Note" entry (file+headline "gtd.org" "Notes")
         "* Note %?\n%T")
        ("b" "Blog idea" entry (file+headline "gtd.org" "Blog Topics:")
         "* %?\n%T" :prepend t)
        ("j" "Journal" entry (file+datetree "gtd.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("s" "Screencast" entry (file "gtd.org")
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

;; (use-package org-capture-pop-frame :ensure t)

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

;; (custom-set-faces
;;  '(org-block-begin-line
;;    ((t (:underline "#A7A6AA" :foreground "#333333" :background "#444444" :height 0.9 :slant italic :weight semi-bold))))
;;  '(org-block-end-line
;;    ((t (:overline "#A7A6AA" :foreground "#333333" :background "#444444" :height 0.9 :slant italic :weight semi-bold))))
;;  '(org-block
;;    ((t (:background "#333333"))))
;;  '(org-block-background
;;    ((t (:background "#333333"))))
;;  )

(custom-set-faces
 '(org-block-begin-line
   ((t (:underline "#A7A6AA" :foreground "#666666" :background "#EBDAB4" :height 0.9 :slant italic :weight semi-bold))))
 '(org-block-end-line
   ((t (:overline "#A7A6AA" :foreground "#666666" :background "#EBDAB4" :height 0.9 :slant italic :weight semi-bold))))
 '(org-block
   ((t (:background "#F2E4BE"))))
 '(org-block-background
   ((t (:background "#F2E4BE"))))
 )

;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "/Users/yangc/Dropbox/itsycnotes/gtd.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/应用/MobileOrg")

(use-package org-super-agenda
  :ensure t
  :config (org-super-agenda-mode))

(use-package outline-toc :ensure t)

(use-package ob-go :ensure t)

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

(use-package helm-fuzzier
  :ensure t
  :config
  (helm-fuzzier-mode 1)
  (setq helm-mode-fuzzy-match t)
  (setq helm-M-x-fuzzy-match t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-recentf-fuzzy-match t))

(use-package ivy
  :ensure t
  :diminish "")

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c u") 'swiper-all)
    ))

(use-package counsel-projectile
  :ensure t
  :after counsel
  :bind ("C-x C-p" . counsel-projectile-switch-project))

(use-package counsel-osx-app
  :after counsel
  :bind ("s-o" . counsel-osx-app))

(use-package ag :ensure t)

(use-package helm-ag
     :ensure t
     :defer t)

(use-package avy
  :ensure t
  :init
  (setq avy-background t))

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

(use-package iedit :ensure t)

(use-package vimish-fold
  :ensure t
  :defer 1
  :bind
  (:map vimish-fold-folded-keymap ("<tab>" . vimish-fold-unfold)
   :map vimish-fold-unfolded-keymap ("<tab>" . vimish-fold-refold))
  :init
  (setq-default vimish-fold-dir (expand-file-name ".vimish-fold/" user-emacs-directory))
  (vimish-fold-global-mode)
  :config
  (setq-default vimish-fold-header-width 119))

(use-package pulse :ensure t)

(use-package anzu
  :ensure t
  :defer 1
  :bind ([remap query-replace] . anzu-query-replace-regexp)
  :config
  (global-anzu-mode 1)
  (setq-default
   anzu-cons-mode-line-p nil
   anzu-replace-to-string-separator (mdi "arrow-right" t))
  )

(defun yc/move-file (new-location)
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

(bind-key "C-x C-m" #'yc/move-file)

(defun yc/dired-open-in-finder ()
  "Show current file in OS's file manager."
  (interactive)
  (let ((process-connection-type nil))
    (start-process "" nil "open" ".")))

(use-package hydra
  :ensure t
  :defer 2
  :preface
  (defvar-local yc/ongoing-hydra-body nil)
  (defun yc/ongoing-hydra ()
    (interactive)
    (if yc/ongoing-hydra-body
        (funcall yc/ongoing-hydra-body)
      (user-error "yc/ongoing-hydra: yc/ongoing-hydra-body is not set")))
  :config
  (defun hydra-move-splitter-left (arg)
    "Move window splitter left."
    (interactive "p")
    (if (let ((windmove-wrap-around))
          (windmove-find-other-window 'right))
        (shrink-window-horizontally arg)
      (enlarge-window-horizontally arg)))

  (defun hydra-move-splitter-right (arg)
    "Move window splitter right."
    (interactive "p")
    (if (let ((windmove-wrap-around))
          (windmove-find-other-window 'right))
        (enlarge-window-horizontally arg)
      (shrink-window-horizontally arg)))

  (defun hydra-move-splitter-up (arg)
    "Move window splitter up."
    (interactive "p")
    (if (let ((windmove-wrap-around))
          (windmove-find-other-window 'up))
        (enlarge-window arg)
      (shrink-window arg)))

  (defun hydra-move-splitter-down (arg)
    "Move window splitter down."
    (interactive "p")
    (if (let ((windmove-wrap-around))
          (windmove-find-other-window 'up))
        (shrink-window arg)
      (enlarge-window arg)))
  :bind
  ("C-c <tab>" . hydra-fold/body)
  ("C-c d" . hydra-dates/body)
  ("C-c e" . hydra-eyebrowse/body)
  ;; ("C-c f" . hydra-flycheck/body)
  ;; ("C-c g" . hydra-magit/body)
  ("C-c h" . hydra-helm/body)
  ("C-c o" . yc/ongoing-hydra)
  ;; ("C-c p" . hydra-projectile/body)
  ("C-c p" . hydra-system/body)
  ("C-c w" . hydra-windows/body)
)

(defhydra hydra-zoom (global-map "<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out")
  ;; ("0" (text-scale-set 0) "reset" :exit t)
  ("0" (text-scale-adjust 0) "reset")
  ("q" nil "quit" :color blue))

(defhydra hydra-org (:color red :columns 3)
  "Org Mode Movements"
  ("n" outline-next-visible-heading "next heading")
  ("p" outline-previous-visible-heading "prev heading")
  ("N" org-forward-heading-same-level "next heading at same level")
  ("P" org-backward-heading-same-level "prev heading at same level")
  ("u" outline-up-heading "up heading")
  ("g" org-goto "goto" :exit t))

(defhydra hydra-window ()
  "
    Movement^   ^Split^         ^Switch^       ^^^Resize^         ^Window Purpose^
    ------------------------------------------------------------------------------------------------------
    _h_ ←        _|_ vertical    ^_b_uffer       _H_  X←          choose window _P_urpose
    _j_ ↓        _-_ horizontal  ^_f_ind files   _J_  X↓          switch to _B_uffer w/ same purpose
    _k_ ↑        _u_ undo        ^_a_ce window   _K_  X↑          Purpose-dedication(_!_)
    _l_ →        _r_ reset       ^_s_wap         _K_  X→          Buffer-dedication(_#_)
    ^^^^^^^                                      _M_aximize
    ^^^^^^^                                      _d_elete
    _x_ M-x      _q_ quit
    "
  ("h" windmove-left)
  ("j" windmove-down)
  ("k" windmove-up)
  ("l" windmove-right)
  ("|" (lambda ()
         (interactive)
         (split-window-right)
         (windmove-right)))
  ("-" (lambda ()
         (interactive)
         (split-window-below)
         (windmove-down)))
  ("u" (progn
         (winner-undo)
         (setq this-command 'winner-undo)))
  ("r" winner-redo)
  ("b" ivy-purpose-switch-buffer-without-purpose)
  ("f" counsel-find-file)
  ("a" (lambda ()
         (interactive)
         (ace-window 1)
         (add-hook 'ace-window-end-once-hook
                   'hydra-window/body)))
  ("s" (lambda ()
         (interactive)
         (ace-swap-window)
         (add-hook 'ace-window-end-once-hook
                   'hydra-window/body)))
  ("H" hydra-move-splitter-left)
  ("J" hydra-move-splitter-down)
  ("K" hydra-move-splitter-up)
  ("L" hydra-move-splitter-right)
  ("M" delete-other-windows)
  ("d" delete-window)

  ("P" purpose-set-window-purpose)
  ("B" ivy-purpose-switch-buffer-with-purpose)
  ("!" purpose-toggle-window-purpose-dedicated)
  ("#" purpose-toggle-window-buffer-dedicated)

  ("K" ace-delete-other-windows)
  ("S" save-buffer)
  ("d" delete-window)
  ("D" (lambda ()
         (interactive)
         (ace-delete-window)
         (add-hook 'ace-window-end-once-hook
                   'hydra-window/body))
   )

  ("x" counsel-M-x)
  ("q" nil)
  )
(global-set-key (kbd "<f1>") 'hydra-window/body)

(defhydra hydra-clock (:color blue)
  "
    ^
    ^Clock^             ^Do^
    ^─────^─────────────^──^─────────
    _q_ quit            _c_ cancel
    ^^                  _d_ display
    ^^                  _e_ effort
    ^^                  _i_ in
    ^^                  _j_ jump
    ^^                  _o_ out
    ^^                  _r_ report
    ^^                  ^^
    "
  ("q" nil)
  ("c" org-clock-cancel :color pink)
  ("d" org-clock-display)
  ("e" org-clock-modify-effort-estimate)
  ("i" org-clock-in)
  ("j" org-clock-goto)
  ("o" org-clock-out)
  ("r" org-clock-report))

(defhydra hydra-helm (:hint nil :color pink)
        "
                                                                          ╭──────┐
   Navigation   Other  Sources     Mark             Do             Help   │ Helm │
  ╭───────────────────────────────────────────────────────────────────────┴──────╯
        ^_k_^         _K_       _p_   [_m_] mark         [_v_] view         [_H_] helm help
        ^^↑^^         ^↑^       ^↑^   [_t_] toggle all   [_d_] delete       [_s_] source help
    _h_ ←   → _l_     _c_       ^ ^   [_u_] unmark all   [_f_] follow: %(helm-attr 'follow)
        ^^↓^^         ^↓^       ^↓^    ^ ^               [_y_] yank selection
        ^_j_^         _J_       _n_    ^ ^               [_w_] toggle windows
  --------------------------------------------------------------------------------
        "
        ("<tab>" helm-keyboard-quit "back" :exit t)
        ("<escape>" nil "quit")
        ("\\" (insert "\\") "\\" :color blue)
        ("h" helm-beginning-of-buffer)
        ("j" helm-next-line)
        ("k" helm-previous-line)
        ("l" helm-end-of-buffer)
        ("g" helm-beginning-of-buffer)
        ("G" helm-end-of-buffer)
        ("n" helm-next-source)
        ("p" helm-previous-source)
        ("K" helm-scroll-other-window-down)
        ("J" helm-scroll-other-window)
        ("c" helm-recenter-top-bottom-other-window)
        ("m" helm-toggle-visible-mark)
        ("t" helm-toggle-all-marks)
        ("u" helm-unmark-all)
        ("H" helm-help)
        ("s" helm-buffer-help)
        ("v" helm-execute-persistent-action)
        ("d" helm-persistent-delete-marked)
        ("y" helm-yank-selection)
        ("w" helm-toggle-resplit-and-swap-windows)
        ("f" helm-follow-mode))

(defhydra hydra-fold (:color pink)
  "
^
^Fold^              ^Do^                ^Jump^              ^Toggle^
^────^──────────────^──^────────────────^────^──────────────^──────^────────────
_q_ quit            _f_ fold            _<_ previous        _<tab>_ current
^^                  _k_ kill            _>_ next            _S-<tab>_ all
^^                  _K_ kill all        ^^                  ^^
^^                  ^^                  ^^                  ^^
"
  ("q" nil)
  ("<tab>" vimish-fold-toggle)
  ("S-<tab>" vimish-fold-toggle-all)
  ("<" vimish-fold-previous-fold)
  (">" vimish-fold-next-fold)
  ("f" vimish-fold)
  ("k" vimish-fold-delete)
  ("K" vimish-fold-delete-all))

(defhydra hydra-dates (:color blue)
  "
^
^Dates^             ^Insert^            ^Insert with Time^
^─────^─────────────^──────^────────────^────────────────^──
_q_ quit            _d_ short           _D_ short
^^                  _i_ iso             _I_ iso
^^                  _l_ long            _L_ long
^^                  ^^                  ^^
"
  ("q" nil)
  ("d" me/date-short)
  ("D" me/date-short-with-time)
  ("i" me/date-iso)
  ("I" me/date-iso-with-time)
  ("l" me/date-long)
  ("L" me/date-long-with-time))

(defhydra hydra-markdown (:color pink)
  "
^
^Markdown^          ^Table Columns^     ^Table Rows^
^────────^──────────^─────────────^─────^──────────^────────
_q_ quit            _c_ insert          _r_ insert
^^                  _C_ delete          _R_ delete
^^                  _M-<left>_ left     _M-<down>_ down
^^                  _M-<right>_ right   _M-<up>_ up
^^                  ^^                  ^^
"
  ("q" nil)
  ("c" markdown-table-insert-column)
  ("C" markdown-table-delete-column)
  ("r" markdown-table-insert-row)
  ("R" markdown-table-delete-row)
  ("M-<left>" markdown-table-move-column-left)
  ("M-<right>" markdown-table-move-column-right)
  ("M-<down>" markdown-table-move-row-down)
  ("M-<up>" markdown-table-move-row-up))

(defhydra hydra-windows (:color pink)
  "
^
^Windows^           ^Window^            ^Zoom^
^───────^───────────^──────^────────────^────^──────────────
_q_ quit            _b_ balance         _-_ out
^^                  _i_ heighten        _+_ in
^^                  _j_ narrow          _=_ reset
^^                  _k_ lower           ^^
^^                  _l_ widen           ^^
^^                  ^^                  ^^
"
  ("q" nil)
  ("b" balance-windows)
  ("i" enlarge-window)
  ("j" shrink-window-horizontally)
  ("k" shrink-window)
  ("l" enlarge-window-horizontally)
  ("-" text-scale-decrease)
  ("+" text-scale-increase)
  ("=" (text-scale-increase 0)))

(setq-default shell-file-name "/bin/bash")

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

(use-package company-shell
  :ensure t
  :after company
  :init
  (add-hook 'sh-mode-hook 'company-mode)
  :config
  (add-to-list 'company-backends 'company-shell))

(use-package eshell
  :ensure t
  :defer t
  :config
  (defun yc/eshell-prompt-function ()
    "My eshell prompt function."
    (concat " λ "))

  (setq eshell-highlight-prompt nil
     eshell-hist-ignoredups t
     eshell-directory-name (expand-file-name "eshell" yc/cache-dir)
     eshell-prefer-lisp-functions t
     eshell-prompt-function #'yc/eshell-prompt-function))

(use-package better-shell
    :ensure t
    :bind (("C-'" . better-shell-shell)
           ("C-;" . better-shell-remote-open)))

(use-package tramp
  :init
  (setq tramp-default-method "ssh")
  (setq password-cache-expiry nil)
  :config
  (setq tramp-auto-save-directory "~/.emacs.d/tramp-autosave-dir")
  (setq tramp-backup-directory-alist `(("." . "~/.saves_tramp")))
  ;; Make SSH work faster by reusing connections
  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no"))

(use-package counsel-tramp
  :ensure t
  :config
  (setq tramp-default-method "ssh")
  (define-key global-map (kbd "C-c s") 'counsel-tramp)
  (eval-after-load 'tramp '(setenv "SHELL" "/bin/bash")))

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

(use-package git-timemachine :ensure t)

(eval-after-load 'git-timemachine
  '(progn
     (evil-make-overriding-map git-timemachine-mode-map 'normal)
     ;; force update evil keymaps after git-timemachine-mode loaded
     (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps)))

(defhydra hydra-git-timemachine ()
  "Git timemachine"
  ("p" git-timemachine-show-previous-revision "previous revision")
  ("n" git-timemachine-show-next-revision "next revision")
  ("q" nil "quit"))

;; scratch
(use-package scratch
  :ensure t
  :commands (scratch))

(use-package scratch-ext
  :ensure t
  :after scratch
  :config
  (setq scratch-ext-log-directory (expand-file-name ".scratch" yc/cache-dir)))

(use-package ox-reveal
  :ensure ox-reveal
  :config
  (setq org-reveal-root "https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.6.0")
  (setq org-reveal-mathjax t))

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

(add-hook 'org-babel-after-execute-hook 'yc/display-inline-images 'append)

(defun yc/display-inline-images ()
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

(use-package easy-hugo
  :ensure t
  :init
  (setq easy-hugo-basedir "/Users/yangc/src/yangc/yangcblog/")
  (setq easy-hugo-url "https://ifrenzyc.github.io")
  (setq easy-hugo-root "/Users/yangc/src/yangc/yangcblog/")
  (setq easy-hugo-previewtime "300")
  :config
  (setq easy-hugo-default-ext ".org")
  :bind ("C-c C-e" . easy-hugo))

(use-package dokuwiki-mode
  :ensure t
  :config
  (use-package outline-magic :ensure t))

(use-package dokuwiki
  :ensure t
  :init
  (use-package xml-rpc :ensure t))

(use-package server
  :ensure t
  :defer 1
  :config
  (unless (server-running-p)
    (server-start)))

(use-package restart-emacs
  :ensure t
  :defer t
  :bind ("C-c Q" . restart-emacs)
  :config (emacs-restore-frames t))

(use-package restclient
  :ensure t)

(use-package ob-restclient
  :ensure t
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((restclient . t))))

(use-package company-restclient
  :ensure t
  :after company restclient-mode
  :init
  (add-to-list 'company-backends 'company-restclient))
