(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(defconst *is-a-mac* (eq system-type 'darwin))

(when (>= emacs-major-version 24)
  (require 'package)
  ;; Archives from which to fetch.
  ;; (setq package-archives
	;; ;; ("melpa" . "http://melpa.milkbox.net/packages/")
	;; (append '(("popkit" . "http://elpa.popkit.org/packages/"))
	;; 	package-archives))
	(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
													 ("marmalade" . "http://marmalade-repo.org/packages/")
													 ("melpa" . "http://melpa.milkbox.net/packages/")))


	;; On-demand installation of packages
  (defun require-package (package &optional min-version no-refresh)
    "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
    (if (package-installed-p package min-version)
	t
      (if (or (assoc package package-archive-contents) no-refresh)
	  (if (boundp 'package-selected-packages)
	      ;; Record this as a package the user installed explicitly
	      (package-install package nil)
	    (package-install package))
	(progn
	  (package-refresh-contents)
	  (require-package package min-version t)))))

  (defun ensure-package-installed (&rest packages)
    "Assure every package is installed, ask for installation if it’s not.
  Return a list of installed packages or nil for every skipped package."
    (mapcar
     (lambda (package)
       (if (package-installed-p package)
	   nil
	 (if (y-or-n-p (format "Package %s is missing. Install it? " package))
	     (package-install package)
	   package)))
     packages))

  ;; Make sure to have downloaded archive description.
  (or (file-exists-p package-user-dir)
      (package-refresh-contents))

  (setq package-enable-at-startup nil)
  (package-initialize))


(ensure-package-installed 'evil
			  'evil-leader
			  'undo-tree
			  'ido
			  'ido-ubiquitous
			  'ido-vertical-mode
			  'flx-ido
			  'smex
			  'helm
			  'helm-swoop
			  'company
			  'neotree
			  'expand-region
			  'yascroll
			  'sublimity
			  'rainbow-delimiters
			  'indent-guide
			  'linum-relative
			  'highlight-indentation
			  'bind-map
			  'which-key
			  'org
			  'org-bullets
			  'markdown-mode
			  'markdown-mode+
			  'markdown-toc
			  'powerline
			  'powerline-evil
			  'smart-mode-line
			  'zenburn-theme
			  'hc-zenburn-theme
			  'pangu-spacing
			  'magit
			  'go-mode
			  'go-complete
			  'go-direx
			  'go-errcheck
			  'go-gopath
			  'go-impl
			  'go-projectile
			  'go-snippets)

(require-package 'use-package)
(setq use-package-always-ensure t)

(require 'init-evil)
(require 'init-keys)
(require 'init-gui)
(require 'init-font)
(require 'init-backup)
(require 'init-ido)
(require 'init-smex)
(require 'init-helm)
(require 'init-org)  ; orgmode 这里设置有点问题，应该在加载 theme 之前加载好，考虑改用 hook 方式
(require 'init-markdown)
(require 'init-company)
(require 'init-neotree)
(require 'init-expand-region)
(require 'init-which-key)
(require 'init-indent-guide)
(require 'init-themes)
(require 'init-powerline)
(require 'init-panguspacing)
(require 'init-magit)
(require 'init-go)


;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))


;;设置个人信息
(setq user-full-name "Yang Chuang")
(setq user-mail-address "ifrenzyc@gmail.com")

;; 自动的在文件末增加一新行
(setq require-final-newline t)


(setq default-tab-width 2)
(setq js-indent-level 2)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
	 (quote
		("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(nrepl-message-colors
	 (quote
		("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(sml/mode-width
	 (if
			 (eq
				(powerline-current-separator)
				(quote arrow))
			 (quote right)
		 (quote full)))
 '(sml/pos-id-separator
	 (quote
		(""
		 (:propertize " " face powerline-active1)
		 (:eval
			(propertize " "
									(quote display)
									(funcall
									 (intern
										(format "powerline-%s-%s"
														(powerline-current-separator)
														(car powerline-default-separator-dir)))
									 (quote powerline-active1)
									 (quote powerline-active2))))
		 (:propertize " " face powerline-active2))))
 '(sml/pos-minor-modes-separator
	 (quote
		(""
		 (:propertize " " face powerline-active1)
		 (:eval
			(propertize " "
									(quote display)
									(funcall
									 (intern
										(format "powerline-%s-%s"
														(powerline-current-separator)
														(cdr powerline-default-separator-dir)))
									 (quote powerline-active1)
									 nil)))
		 (:propertize " " face sml/global))))
 '(sml/pre-id-separator
	 (quote
		(""
		 (:propertize " " face sml/global)
		 (:eval
			(propertize " "
									(quote display)
									(funcall
									 (intern
										(format "powerline-%s-%s"
														(powerline-current-separator)
														(car powerline-default-separator-dir)))
									 nil
									 (quote powerline-active1))))
		 (:propertize " " face powerline-active1))))
 '(sml/pre-minor-modes-separator
	 (quote
		(""
		 (:propertize " " face powerline-active2)
		 (:eval
			(propertize " "
									(quote display)
									(funcall
									 (intern
										(format "powerline-%s-%s"
														(powerline-current-separator)
														(cdr powerline-default-separator-dir)))
									 (quote powerline-active2)
									 (quote powerline-active1))))
		 (:propertize " " face powerline-active1))))
 '(sml/pre-modes-separator (propertize " " (quote face) (quote sml/modes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:inherit default :font "Lucida Grande" :height 1.5 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :font "Lucida Grande" :height 1.5))))
 '(org-level-2 ((t (:inherit default :font "Lucida Grande" :height 1.1))))
 '(org-level-3 ((t (:inherit default :font "Lucida Grande"))))
 '(org-level-4 ((t (:inherit default :font "Lucida Grande"))))
 '(org-level-5 ((t (:inherit default :font "Lucida Grande"))))
 '(org-level-6 ((t (:inherit default :font "Lucida Grande"))))
 '(org-level-7 ((t (:inherit default :font "Lucida Grande"))))
 '(org-level-8 ((t (:inherit default :font "Lucida Grande")))))
