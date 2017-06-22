(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-enable-at-startup nil)
  (setq package-archives '(("popkit" . "http://elpa.popkit.org/packages/")  ;; 选用国内源
                           ("melpa" . "https://melpa.org/packages/")
                           ("gnu" . "http://elpa.gnu.org/packages/")
                           ("org" . "http://orgmode.org/elpa/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")))
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
     (sh . t)))

  (org-babel-load-file (expand-file-name "~/.emacs.d/emacs.org")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zoom-window zenburn-theme yascroll yaml-mode which-key use-package try swiper sublimity spaceline smooth-scrolling smex selected scratch rich-minority rainbow-delimiters quasi-monochrome-theme powerline-evil plantuml-mode phoenix-dark-mono-theme paper-theme pangu-spacing org-mac-link org-capture-pop-frame org-bullets nyan-mode noflet neotree monochrome-theme molokai-theme minimal-theme markdown-toc magit logstash-conf linum-relative leuven-theme key-chord indent-guide ido-vertical-mode ido-ubiquitous htmlize highlight-indentation helm-swoop helm-mt helm-descbinds helm-ag hc-zenburn-theme go-snippets go-projectile go-impl go-gopath go-errcheck go-direx go-complete git-gutter flx-ido expand-region evil-surround evil-search-highlight-persist evil-nerd-commenter evil-leader evil-goggles evil-easymotion elscreen eink-theme dashboard company color-theme-solarized color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized bind-map basic-theme base16-theme ace-jump-mode 0blayout))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:inherit default :font "Lucida Grande" :height 1.5 :underline nil)))))
