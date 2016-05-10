(use-package org
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  (setq org-src-fontify-natively t)
  (setq org-bullets-bullet-list
	'("ͽ" "❂" "☀" "⌾" "◌" "◉"))
  ;; "◎" "○" "►" "◇" "⊛" "✪" "☯" "⊙" "✪" "➲" "⚫" "●" "⬤" "⚉" "￮" "⦾" "⦿" "⦾" "⸖" "ͼ" "￮"
  (setq org-todo-keywords
	'((sequence "☛ TODO" "► IN-PROGRESS" "⚑ WAITING" "|" "✗ CANCELED" "✓ DONE")))
  ;;  (setq org-blank-before-new-entry '((heading . t)
  ;;                                     (plain-list-item . t)))
  (setq org-capture-templates
	'(("a" "My TODO task format." entry
	   (file "todo.org")
	   "* ☛ TODO %? DEADLINE: %t")))
;;; @see http://www.howardism.org/Technical/Emacs/orgmode-wordprocessor.html
  (font-lock-add-keywords 'org-mode
			  '(("^ +\\([-*]\\) "
			     (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "⚫"))))))

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
			    `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil))))))
  (setq org-indent-mode t)
  :config
  (add-hook 'org-mode-hook 'org-indent-mode)
  (defcustom org-indent-indentation-per-level 2
    "Indentation per level in number of characters."
    :group 'org-indent
    :type 'integer)
  )


(use-package org-bullets
  :ensure t
  :init
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )

;; ;; @see http://coldnew.github.io/blog/2013/11-16_d2f3a/
;;(defvar emacs-english-font "Monaco"
;; "The font name of English.")

;; (defvar emacs-cjk-font "WenQuanYi Micro Hei Mono"
;; "The font name for CJK.")
;; (defvar emacs-font-size-pair '(12 . 14)
;; "Default font size pair for (english . chinese)")

;; (defvar emacs-font-size-pair-list
;; '(( 5 .  6) (10 . 12)
;; (13 . 16) (15 . 18) (17 . 20)
;; (19 . 22) (20 . 24) (21 . 26)
;; (24 . 28) (26 . 32) (28 . 34)
;; (30 . 36) (34 . 40) (36 . 44))
;; "This list is used to store matching (englis . chinese) font-size.")
;; (defun font-exist-p (fontname)
;; "Test if this font is exist or not."
;; (if (or (not fontname) (string= fontname ""))
;; nil
;; (if (not (x-list-fonts fontname)) nil t)))
;;
;; (defun set-font (english chinese size-pair)
;; "Setup emacs English and Chinese font on x window-system."
;;
;; (if (font-exist-p english)
;; (set-frame-font (format "%s:pixelsize=%d" english (car size-pair)) t))
;;
;; (if (font-exist-p chinese)
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;; (set-fontset-font (frame-parameter nil 'font) charset
;; (font-spec :family chinese :size (cdr size-pair))))))
;; ;; Setup font size based on emacs-font-size-pair
;; (set-font emacs-english-font emacs-cjk-font emacs-font-size-pair)
;;
;; (defun emacs-step-font-size (step)
;; "Increase/Decrease emacs's font size."
;; (let ((scale-steps emacs-font-size-pair-list))
;; (if (< step 0) (setq scale-steps (reverse scale-steps)))
;; (setq emacs-font-size-pair
;; (or (cadr (member emacs-font-size-pair scale-steps))
;; emacs-font-size-pair))
;; (when emacs-font-size-pair
;; (message "emacs font size set to %.1f" (car emacs-font-size-pair))
;; (set-font emacs-english-font emacs-cjk-font emacs-font-size-pair))))
;;
;; (defun increase-emacs-font-size ()
;; "Decrease emacs's font-size acording emacs-font-size-pair-list."
;; (interactive) (emacs-step-font-size 1))
;;
;; (defun decrease-emacs-font-size ()
;; "Increase emacs's font-size acording emacs-font-size-pair-list."
;; (interactive) (emacs-step-font-size -1))

;; @see http://www.cnblogs.com/galaxy-gao/p/4445757.html
;; @see http://www.sunyour.org/blog/2016/03/07/spacemacs%E9%87%8Corg-mode%E4%B8%AD%E8%8B%B1%E6%96%87%E8%A1%A8%E6%A0%BC%E5%AF%B9%E9%BD%90/
;;;中文与英文字体设置
;; Setting English Font
;; "Source Code Pro" "Hiragino Sans GB" 14 16
(set-face-attribute 'default nil :font "Source Code Pro 14")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset (font-spec :family "Hiragino Sans GB" :size 16)))

(use-package htmlize :ensure t)

;;(require 'org-publish)
(setq org-publish-project-alist
      '(
	("org-blog-content" ;; 博客内容
	 ;; Path to your org files.
	 :base-directory "~/OneDrive/itsycnotes/"
	 :base-extension "org"
	 ;; Path to your jekyll project.
	 :publishing-directory "~/Applications/nginx/notes/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4
	 :html-extension "html"
	 :table-of-contents t ;; 导出目录
	 ;; :body-only t ;; Only export section between <body></body>
	 )
	("org-blog-static" ;; 静态文件
	 :base-directory "~/OneDrive/itsycnotes/"
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

(provide 'init-org)
