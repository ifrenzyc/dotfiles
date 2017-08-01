(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "elpa/eink" user-emacs-directory))
(defconst *is-a-mac* (eq system-type 'darwin))

(when (>= emacs-major-version 24)
  (require 'package)
  ;; Archives from which to fetch.
  ;; (setq package-archives
  ;; ;; ("melpa" . "http://melpa.milkbox.net/packages/")
  ;; (append '(("popkit" . "http://elpa.popkit.org/packages/"))
  ;; 	package-archives))
	(setq package-archives '(("melpa" . "https://melpa.org/packages/")
													 ("gnu" . "http://elpa.gnu.org/packages/")
													 ("marmalade" . "http://marmalade-repo.org/packages/")
													 ))


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
			  ;; 'powerline-evil
			  ;; 'smart-mode-line
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
(require 'init-indent-guide)
(require 'init-themes)
(require 'init-panguspacing)
(require 'init-magit)
(require 'init-go)
(require 'init-swiper)


;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))

;; @see http://stackoverflow.com/questions/12558019/shortcut-to-open-a-specific-file-in-emacs
(set-register ?e (cons 'file "~/.dotfiles/emacs/init.el"))

;;设置个人信息
(setq user-full-name "Yang Chuang")
(setq user-mail-address "ifrenzyc@gmail.com")

;; 自动的在文件末增加一新行
(setq require-final-newline t)


(setq default-tab-width 2)
(setq js-indent-level 2)

(provide 'init)
