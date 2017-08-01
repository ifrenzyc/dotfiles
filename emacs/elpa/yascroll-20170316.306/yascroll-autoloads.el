;;; yascroll-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "yascroll" "../../../../.emacs.d/elpa/yascroll-20170316.306/yascroll.el"
;;;;;;  "5b955005e72f9c36335722e4691707bf")
;;; Generated autoloads from ../../../../.emacs.d/elpa/yascroll-20170316.306/yascroll.el

(autoload 'yascroll:show-scroll-bar "yascroll" "\
Show scroll bar in BUFFER.

\(fn)" t nil)

(autoload 'yascroll:hide-scroll-bar "yascroll" "\
Hide scroll bar of BUFFER.

\(fn)" t nil)

(autoload 'yascroll-bar-mode "yascroll" "\
Yet Another Scroll Bar Mode.

\(fn &optional ARG)" t nil)

(defvar global-yascroll-bar-mode nil "\
Non-nil if Global Yascroll-Bar mode is enabled.
See the `global-yascroll-bar-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-yascroll-bar-mode'.")

(custom-autoload 'global-yascroll-bar-mode "yascroll" nil)

(autoload 'global-yascroll-bar-mode "yascroll" "\
Toggle Yascroll-Bar mode in all buffers.
With prefix ARG, enable Global Yascroll-Bar mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Yascroll-Bar mode is enabled in all buffers where
`yascroll:turn-on' would do it.
See `yascroll-bar-mode' for more information on Yascroll-Bar mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/yascroll-20170316.306/yascroll-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/yascroll-20170316.306/yascroll.el")
;;;;;;  (22908 19445 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; yascroll-autoloads.el ends here