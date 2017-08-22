;;; auto-package-update-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "auto-package-update" "../../../../.emacs.d/elpa/auto-package-update-20170803.1005/auto-package-update.el"
;;;;;;  "c8d904b0b430d260bb637a80a87d51f1")
;;; Generated autoloads from ../../../../.emacs.d/elpa/auto-package-update-20170803.1005/auto-package-update.el

(autoload 'auto-package-update-now "auto-package-update" "\
Update installed Emacs packages.

\(fn)" t nil)

(autoload 'auto-package-update-at-time "auto-package-update" "\
Try to update every day at the specified TIME.

\(fn TIME)" nil nil)

(autoload 'auto-package-update-maybe "auto-package-update" "\
Update installed Emacs packages if at least `auto-package-update-interval' days have passed since the last update.

\(fn)" nil nil)

;;;### (autoloads "actual autoloads are elsewhere" "auto-package-update"
;;;;;;  "../../../../.emacs.d/elpa/auto-package-update-20170803.1005/auto-package-update.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/auto-package-update-20170803.1005/auto-package-update.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "auto-package-update" '("apu--" "auto-package-update-")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/auto-package-update-20170803.1005/auto-package-update-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/auto-package-update-20170803.1005/auto-package-update.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; auto-package-update-autoloads.el ends here
