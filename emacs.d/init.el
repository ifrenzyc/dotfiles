(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(defconst *is-a-mac* (eq system-type 'darwin))

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

;; frame font
;; Setting English Font
(if (member "Monaco" (font-family-list))
    (set-face-attribute
     'default nil :font "Monaco 13"))

(require 'init-packages)

(require-package 'use-package)
(setq use-package-always-ensure t)
(require 'init-keys)
(require 'init-themes)
(require 'init-powerline)
(require 'init-org)
(require 'init-markdown)
(require 'init-macosx)
(require 'init-guide-key)
(require 'init-projectile)
(require 'init-helm)
(require 'init-ag)
(require 'init-ido)
(require 'init-smex)
(require 'init-smooth-scrolling)
(require 'init-company)
(require 'init-avy)
(require 'init-neotree)
(require 'init-expand-region)
(require 'init-go)
;;; (require 'init-flycheck)

;; use 'keyfreq-show'
;; @see https://github.com/dacap/keyfreq
(use-package keyfreq
  :ensure t
  :init
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)
  )


;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))

;; 取消滚动栏
(use-package yascroll
  :ensure t
  :config
  (set-scroll-bar-mode nil)
  (global-yascroll-bar-mode 1)  
  )

; (set-frame-parameter nil 'fullscreen 'fullboth) 

;; 取消工具栏
(tool-bar-mode nil)

;; 启动自动最大化(数据自己调整，注意格式，如(top . 0)，圆点前后都要留有空格)
					; (setq initial-frame-alist '((top . 0) (left . 0) (width . 120) (height . 36)))

;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示行列号
(global-linum-mode t)

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

;; 设定不产生备份文件
(setq make-backup-files nil)
(setq-default make-backup-files nil)  ; 不生成临时文件
  
;; 取消自动保存模式
(setq auto-save-mode nil)
  
(setq backup-by-copying nil)

(setq visible-bell t)
(setq ring-bell-function 'ignore)  ;; visible-bell doesn’t work well on OS X, so disable those notifications completely

;; Save a list of recent files visited. (open recent file with C-x f)
(recentf-mode 1)
(setq recentf-max-saved-items 100) ;; just 20 is too recent

;;设置个人信息
(setq user-full-name "Yang Chuang")
(setq user-mail-address "ifrenzyc@gmail.com")

;; 自动的在文件末增加一新行
(setq require-final-newline t)

;;设置mark-set快捷键
(global-set-key (kbd "S-SPC") 'set-mark-command)

(provide 'init)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
