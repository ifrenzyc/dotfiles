(when (>= emacs-major-version 25)
  (require 'package)
  (setq package-enable-at-startup nil)
  (setq package-archives '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			   ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			   ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
  ;; (setq package-archives
  ;;       '(("elpy" . "http://jorgenschaefer.github.io/packages/")
  ;;         ("org"         . "http://orgmode.org/elpa/")
  ;;         ("gnu"         . "http://elpa.gnu.org/packages/")
  ;;         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
  ;;         ("melpa" . "http://melpa.org/packages/")))
  (package-initialize)

  ;; Bootstrap `use-package'
  ;; 更新本地仓库里面的package
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)
    (setq use-package-always-ensure t))


  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (org . t)
     (shell . t)))

  (org-babel-load-file (expand-file-name "~/.emacs.d/emacs.org")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(mdi anzu vimish-fold org-src scratch-ext company-shell unicode-fonts pcache restart-emacs edit-server desktop+ eyebrowse winum hydras zoom-window yascroll yapfify yaml-mode which-key web-mode use-package typescript tide swoop spaceline-all-the-icons smooth-scrolling smex smartparens selected scratch rainbow-delimiters pyenv-mode py-isort powerline-evil plantuml-mode paradox pangu-spacing outline-toc outline-magic org-super-agenda org-bullets ob-restclient nyan-mode ng2-mode neotree markdownfmt markdown-toc markdown-mode+ magit logstash-conf keyfreq key-chord json-mode js2-mode js-comint iedit ido-vertical-mode ido-completing-read+ htmlize highlight-symbol helm-swoop helm-pydoc helm-projectile helm-mt helm-fuzzier helm-descbinds helm-ag gruvbox-theme go-snippets go-projectile go-impl go-gopath go-errcheck go-direx go-complete gitignore-mode gitconfig-mode git-gutter general fuzzy flycheck-pos-tip flx-ido expand-region exec-path-from-shell evil-surround evil-search-highlight-persist evil-nerd-commenter evil-goggles evil-collection emmet-mode elpy easy-hugo doom-themes dokuwiki-mode dokuwiki diminish dashboard counsel-tramp counsel-projectile company-tern company-statistics company-restclient company-quickhelp company-go company-anaconda clojure-mode beacon auto-package-update angular-snippets ag ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((t (:background "#F2E4BE"))))
 '(org-block-background ((t (:background "#F2E4BE"))))
 '(org-block-begin-line ((t (:underline "#A7A6AA" :foreground "#666666" :background "#EBDAB4" :height 0.9 :slant italic :weight semi-bold))))
 '(org-block-end-line ((t (:overline "#A7A6AA" :foreground "#666666" :background "#EBDAB4" :height 0.9 :slant italic :weight semi-bold))))
 '(org-document-title ((t (:inherit default :font "Lucida Grande" :height 1.5 :underline nil))))
 '(org-done ((t (:foreground "PaleGreen" :weight normal :strike-through t))))
 '(org-headline-done ((((class color) (min-colors 16) (background dark)) (:foreground "LightSalmon" :strike-through t))))
 '(org-level-1 ((t (:inherit default :weight bold :font "Lucida Grande" :height 1.5))))
 '(org-level-2 ((t (:inherit default :font "Lucida Grande" :height 1.1))))
 '(org-level-3 ((t (:inherit default :font "Lucida Grande"))))
 '(org-level-4 ((t (:inherit default :font "Lucida Grande"))))
 '(org-level-5 ((t (:inherit default :font "Lucida Grande"))))
 '(org-level-6 ((t (:inherit default :font "Lucida Grande"))))
 '(org-level-7 ((t (:inherit default :font "Lucida Grande"))))
 '(org-level-8 ((t (:inherit default :font "Lucida Grande"))))
 '(org-link ((t (:underline t)))))
