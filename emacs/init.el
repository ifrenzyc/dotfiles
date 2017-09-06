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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-anaconda anaconda-mode elpy swoop keyfreq zoom-window yascroll yaml-mode which-key web-mode use-package typescript try tide sublimity smooth-scrolling smex smartparens smart-mode-line-powerline-theme selected scratch rainbow-delimiters quasi-monochrome-theme powerline-evil plantuml-mode phoenix-dark-mono-theme paper-theme pangu-spacing outline-toc org-super-agenda org-bullets nyan-mode ng2-mode neotree markdown-toc markdown-mode+ magit logstash-conf linum-relative key-chord json-mode js2-mode js-comint indent-guide ido-vertical-mode ido-ubiquitous htmlize highlight-symbol highlight-indentation helm-swoop helm-projectile helm-mt helm-fuzzier helm-descbinds helm-ag hc-zenburn-theme gruvbox-theme go-snippets go-projectile go-impl go-gopath go-errcheck go-direx go-complete gitignore-mode gitconfig-mode git-gutter flycheck-pos-tip flx-ido expand-region exec-path-from-shell evil-surround evil-search-highlight-persist evil-nerd-commenter evil-leader evil-goggles evil-easymotion emmet-mode eink-theme diredful dashboard counsel-projectile company-go clojure-mode bind-map basic-theme base16-theme auto-package-update auto-dim-other-buffers angular-snippets all-the-icons airline-themes ag ace-window ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((t (:background "#333333"))))
 '(org-block-background ((t (:background "#333333"))))
 '(org-block-begin-line ((t (:underline "#A7A6AA" :foreground "#3D4A41" :background "#9EAC8C" :height 0.9 :slant italic :weight semi-bold))))
 '(org-block-end-line ((t (:overline "#A7A6AA" :foreground "#3D4A41" :background "#9EAC8C" :height 0.9 :slant italic :weight semi-bold))))
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
