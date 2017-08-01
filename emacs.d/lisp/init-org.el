(use-package org
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
  (setq org-src-fontify-natively t)
  (setq org-bullets-bullet-list
	'("⚫" "◉" "◎" "○" "►" "◇"))
  (setq org-todo-keywords
	'((sequence "☛ TODO" "○ IN-PROGRESS" "⚑ WAITING" "|" "✗ CANCELED" "✓ DONE")))
  ;;  (setq org-blank-before-new-entry '((heading . t)
  ;;                                     (plain-list-item . t)))
  (setq org-capture-templates
        '(("a" "My TODO task format." entry
           (file "todo.org")
           "* ☛ TODO %? DEADLINE: %t")))
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


;;(require 'org-publish)
(setq org-publish-project-alist
      '(
	("org-blog-content" ;; 博客内容
	 ;; Path to your org files.
	 :base-directory "~/Documents/notes/"
	 :base-extension "org"
	 ;; Path to your jekyll project.
	 :publishing-directory "~/Documents/notes/_pub/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4
	 :html-extension "html"
	 :table-of-contents t ;; 导出目录
	 ;; :body-only t ;; Only export section between <body></body>
	 )
	("org-blog-static" ;; 静态文件
	 :base-directory "~/Documents/notes/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php\\|svg"
	 :publishing-directory "~/Documents/notes/"
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
    (insert (format "#+begin_src %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+end_src\n")
    (previous-line 2)
    (org-edit-src-code)))

(provide 'init-org)
