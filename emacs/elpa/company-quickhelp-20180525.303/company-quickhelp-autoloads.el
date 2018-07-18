;;; company-quickhelp-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "company-quickhelp" "../../../../.emacs.d/elpa/company-quickhelp-20180525.303/company-quickhelp.el"
;;;;;;  "24e74d145f1653233cea25f5ff830d84")
;;; Generated autoloads from ../../../../.emacs.d/elpa/company-quickhelp-20180525.303/company-quickhelp.el

(autoload 'company-quickhelp-local-mode "company-quickhelp" "\
Provides documentation popups for `company-mode' using `pos-tip'.

If called interactively, enable Company-Quickhelp-Local mode if ARG is positive, and
disable it if ARG is zero or negative.  If called from Lisp,
also enable the mode if ARG is omitted or nil, and toggle it
if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(defvar company-quickhelp-mode nil "\
Non-nil if Company-Quickhelp mode is enabled.
See the `company-quickhelp-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `company-quickhelp-mode'.")

(custom-autoload 'company-quickhelp-mode "company-quickhelp" nil)

(autoload 'company-quickhelp-mode "company-quickhelp" "\
Toggle Company-Quickhelp-Local mode in all buffers.
With prefix ARG, enable Company-Quickhelp mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Company-Quickhelp-Local mode is enabled in all buffers where
`company-quickhelp-local-mode' would do it.
See `company-quickhelp-local-mode' for more information on Company-Quickhelp-Local mode.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "company-quickhelp"
;;;;;;  "../../../../.emacs.d/elpa/company-quickhelp-20180525.303/company-quickhelp.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/company-quickhelp-20180525.303/company-quickhelp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "company-quickhelp" '("company-quickhelp-")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/company-quickhelp-20180525.303/company-quickhelp-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/company-quickhelp-20180525.303/company-quickhelp.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; company-quickhelp-autoloads.el ends here
