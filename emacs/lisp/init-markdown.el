;;; Markdown mode
;;; (autoload 'gfm-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
;;; (setq auto-mode-alist (cons '("\\.text$" . gfm-mode) auto-mode-alist))
;;; (setq auto-mode-alist (cons '("\\.md$" . gfm-mode) auto-mode-alist))
;;; (setq auto-mode-alist (cons '("\\.mdown$" . gfm-mode) auto-mode-alist))
;;; (setq auto-mode-alist (cons '("\\.mdt$" . gfm-mode) auto-mode-alist))
;;; (setq auto-mode-alist (cons '("\\.markdown$" . gfm-mode) auto-mode-alist))
;;; (autoload 'markdown-mode "markdown-mode"
;;;		     "Major mode for editing Markdown files" t)
;;; (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
					; (autoload 'gfm-mode "markdown-mode"
					; "Major mode for editing Markdown files" t)
					; (add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode))
					; ;;; Use visual-line-mode in gfm-mode
					; (defun my-gfm-mode-hook ()
					; (visual-line-mode 1))
					; (add-hook 'gfm-mode-hook 'my-gfm-mode-hook)

;; Config for setting markdown mode and stuff
;;
;; Markdown mode
(use-package markdown-mode
  :ensure t
  :config
  (autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
  (setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("\\.mkd" . markdown-mode) auto-mode-alist))
  (setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist)))


;; Enable gfm-mode (github-flavoured-markdown) if it's a README.md
;; file inside of a git repository
(add-hook
 'find-file-hook
 (lambda ()
   (when (and (string-match "*.md" (buffer-name)))
     (gfm-mode))))


;; Turn on flyspell mode when editing markdown files
(add-hook 'markdown-mode-hook 'flyspell-mode)
(add-hook 'gfm-mode-hook 'flyspell-mode)

(use-package markdown-mode+ :ensure t)
(use-package markdown-toc :ensure t)


(provide 'init-markdown)
