;;; pangu-spacing-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "pangu-spacing" "../../../../.emacs.d/elpa/pangu-spacing-20170317.1657/pangu-spacing.el"
;;;;;;  "978ba3e3b7cf81902bb4fa69c84eae43")
;;; Generated autoloads from ../../../../.emacs.d/elpa/pangu-spacing-20170317.1657/pangu-spacing.el

(autoload 'pangu-spacing-space-current-buffer "pangu-spacing" "\
Space current buffer.
It will really insert separator, no matter what
`pangu-spacing-real-insert-separtor' is.

\(fn)" t nil)

(autoload 'pangu-spacing-mode "pangu-spacing" "\
Toggle pangu-spacing-mode

\(fn &optional ARG)" t nil)

(defvar global-pangu-spacing-mode nil "\
Non-nil if Global Pangu-Spacing mode is enabled.
See the `global-pangu-spacing-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-pangu-spacing-mode'.")

(custom-autoload 'global-pangu-spacing-mode "pangu-spacing" nil)

(autoload 'global-pangu-spacing-mode "pangu-spacing" "\
Toggle Pangu-Spacing mode in all buffers.
With prefix ARG, enable Global Pangu-Spacing mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Pangu-Spacing mode is enabled in all buffers where
`pangu-spacing-mode' would do it.
See `pangu-spacing-mode' for more information on Pangu-Spacing mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/pangu-spacing-20170317.1657/pangu-spacing-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/pangu-spacing-20170317.1657/pangu-spacing.el")
;;;;;;  (22908 19535 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; pangu-spacing-autoloads.el ends here
