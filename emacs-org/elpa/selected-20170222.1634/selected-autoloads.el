;;; selected-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "selected" "../../../../.emacs.d/elpa/selected-20170222.1634/selected.el"
;;;;;;  "2418281b503ee4bb389a69ef40aa0bf0")
;;; Generated autoloads from ../../../../.emacs.d/elpa/selected-20170222.1634/selected.el

(autoload 'selected-minor-mode "selected" "\
If enabled activates the `selected-keymap' when the region is active.

\(fn &optional ARG)" t nil)

(defvar selected-global-mode nil "\
Non-nil if Selected-Global mode is enabled.
See the `selected-global-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `selected-global-mode'.")

(custom-autoload 'selected-global-mode "selected" nil)

(autoload 'selected-global-mode "selected" "\
Toggle Selected minor mode in all buffers.
With prefix ARG, enable Selected-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Selected minor mode is enabled in all buffers where
`selected--global-on-p' would do it.
See `selected-minor-mode' for more information on Selected minor mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/selected-20170222.1634/selected-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/selected-20170222.1634/selected.el")
;;;;;;  (22908 19475 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; selected-autoloads.el ends here
