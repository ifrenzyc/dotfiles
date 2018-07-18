;;; go-errcheck-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "go-errcheck" "../../../../.emacs.d/elpa/go-errcheck-20160722.1743/go-errcheck.el"
;;;;;;  "d1e2ebf22ddbea4f221614acde8cc9c9")
;;; Generated autoloads from ../../../../.emacs.d/elpa/go-errcheck-20160722.1743/go-errcheck.el

(autoload 'go-errcheck "go-errcheck" "\
Run errcheck on the current buffer's directory and display the
  output in a compilation buffer.

If ARG is non-nil, go-errcheck will query for the values of
IGNOREPKG and IGNORE which will override any defaults or file
local variables.

When called non-interactively, DIRECTORY, IGNOREPKG and IGNORE
can be specified as arguments. If DIRECTORY is nil, it will
default to the buffer's directory.

\(fn DIRECTORY IGNOREPKG IGNORE)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "go-errcheck"
;;;;;;  "../../../../.emacs.d/elpa/go-errcheck-20160722.1743/go-errcheck.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/go-errcheck-20160722.1743/go-errcheck.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "go-errcheck" '("go-")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/go-errcheck-20160722.1743/go-errcheck-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/go-errcheck-20160722.1743/go-errcheck.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; go-errcheck-autoloads.el ends here
