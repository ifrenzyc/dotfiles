;;; helm-mt-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "helm-mt" "../../../../.emacs.d/elpa/helm-mt-20160918.1252/helm-mt.el"
;;;;;;  "e16a8a8988a5a3b197ecebc44531f1ae")
;;; Generated autoloads from ../../../../.emacs.d/elpa/helm-mt-20160918.1252/helm-mt.el

(autoload 'helm-mt/reroute-terminal-functions "helm-mt" "\
Advise terminal functions to run `helm-mt' instead when called interactively.
If ARG is t, then activate the advice; otherwise, remove it.

\(fn ARG)" nil nil)

(autoload 'helm-mt "helm-mt" "\
Custom helm buffer for terminals only.
PREFIX is passed on to `helm-mt/term-source-terminal-not-found'.

\(fn &optional PREFIX)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/helm-mt-20160918.1252/helm-mt-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/helm-mt-20160918.1252/helm-mt.el")
;;;;;;  (22908 19547 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; helm-mt-autoloads.el ends here
