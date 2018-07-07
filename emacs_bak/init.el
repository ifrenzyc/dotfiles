(when (>= emacs-major-version 25)
  (require 'package)
  (setq package-enable-at-startup nil)
  (setq package-archives '(("melpa" . "https://melpa.org/packages/")
                           ("gnu" . "http://elpa.gnu.org/packages/")
                           ("org" . "http://orgmode.org/elpa/")))
  (package-initialize)

  ;; Bootstrap `use-package'
  ;; 更新本地仓库里面的package
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)
    (setq use-package-always-ensure t))

  ;;----------------------------------------------------------------------------
  ;; Allow access from emacsclient
  ;;----------------------------------------------------------------------------
  (require 'server)
  (unless (server-running-p)
    (server-start))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (org . t)
     (shell . t)))

  (org-babel-load-file (expand-file-name "~/.emacs.d/emacs.org")))