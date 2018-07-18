;;; init.el --- Emacs Initialization File

;;; Commentary:

;; Copyright (c) 2016-2018 Yang Chuang
;;
;; Author: Yang Chuang <ifrenzyc@gmail.com>
;; URL: https://github.com/ifrenzyc
;;
;; This file is not part of GNU Emacs.
;;
;; License: GPLv3

;;; Code:

;; Added by package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; (package-initialize)

(require 'org)
(require 'ob-tangle)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (org . t)
   (shell . t)))

(org-babel-load-file (expand-file-name "~/.emacs.d/emacs.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org-download org-attach-screenshot exec-path-from-shell rainbow-mode company-restclient ob-restclient restclient restart-emacs dokuwiki outline-magic dokuwiki-mode easy-hugo plantuml-mode ox-reveal scratch-ext scratch git-timemachine magit git-gutter helm-descbinds counsel-tramp better-shell company-shell helm-mt multi-term anzu vimish-fold iedit selected expand-region highlight-symbol helm-ag ag counsel-projectile swiper helm-fuzzier helm-projectile helm-swoop swoop ido-completing-read+ flx-ido ido-vertical-mode ob-go outline-toc org-super-agenda htmlize org-bullets flycheck-pos-tip company-statistics company-quickhelp helm smex markdownfmt markdown-mode+ markdown-toc markdown-mode logstash-conf yaml-mode json-mode emmet-mode web-mode js-comint angular-snippets tide ng2-mode typescript js2-mode clojure-mode yapfify py-isort company-anaconda anaconda-mode elpy zoom-window yascroll winum which-key use-package unicode-fonts spaceline-all-the-icons smooth-scrolling smartparens rainbow-delimiters powerline-evil paradox pangu-spacing nyan-mode neotree keyfreq key-chord highlight-indentation gruvbox-theme go-snippets go-projectile go-impl go-gopath go-errcheck go-direx go-complete general eyebrowse evil-surround evil-search-highlight-persist evil-nerd-commenter evil-goggles dimmer diminish dashboard company-go beacon ace-window)))
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
 '(org-link ((t (:underline t))))
 '(whitespace-tab ((t (:foreground "#636363")))))
