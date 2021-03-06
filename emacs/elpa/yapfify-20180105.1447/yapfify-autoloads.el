;;; yapfify-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "yapfify" "../../../../.emacs.d/elpa/yapfify-20180105.1447/yapfify.el"
;;;;;;  "d48939c2dc2ec699d6ce22d8facf2787")
;;; Generated autoloads from ../../../../.emacs.d/elpa/yapfify-20180105.1447/yapfify.el

(autoload 'yapfify-region "yapfify" "\
Try to yapfify the current region.

If yapf exits with an error, the output will be shown in a help-window.

\(fn BEGINNING END)" t nil)

(autoload 'yapfify-buffer "yapfify" "\
Yapfify whole buffer.

\(fn)" t nil)

(autoload 'yapf-mode "yapfify" "\
Automatically run YAPF before saving.

If called interactively, enable Yapf mode if ARG is positive, and
disable it if ARG is zero or negative.  If called from Lisp,
also enable the mode if ARG is omitted or nil, and toggle it
if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "yapfify" "../../../../.emacs.d/elpa/yapfify-20180105.1447/yapfify.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/yapfify-20180105.1447/yapfify.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "yapfify" '("get-buffer-string" "yapfify-call-bin")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/yapfify-20180105.1447/yapfify-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/yapfify-20180105.1447/yapfify.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; yapfify-autoloads.el ends here
