;;; swoop-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "swoop" "../../../../.emacs.d/elpa/swoop-20160120.915/swoop.el"
;;;;;;  "e3a7c3aff5d10243bdcffedbbf1305a1")
;;; Generated autoloads from ../../../../.emacs.d/elpa/swoop-20160120.915/swoop.el

(autoload 'swoop "swoop" "\
Search through words within the current buffer.

\(fn &optional $QUERY)" t nil)

(autoload 'swoop-multi "swoop" "\
Search words across currently opened multiple buffers.
Ignore non file buffer.

\(fn &optional $QUERY)" t nil)

(autoload 'swoop-pcre-regexp "swoop" "\
Use PCRE like regexp to swoop.

\(fn &optional $QUERY)" t nil)

(autoload 'swoop-migemo "swoop" "\
Japanese words matching with the alphabet.

\(fn &optional $QUERY)" t nil)

(autoload 'swoop-line-length-over80 "swoop" "\
Get over 80 colomn number linees.

\(fn)" t nil)

(autoload 'swoop-from-isearch "swoop" "\
During isearch, switch over to swoop.

\(fn)" t nil)

(autoload 'swoop-function "swoop" "\
Show function list in buffer judging from major-mode and regexp.
Currently c-mode only.

\(fn &optional $QUERY)" t nil)

(autoload 'swoop-from-evil-search "swoop" "\
During evil-search, switch over to swoop.

\(fn)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "swoop" "../../../../.emacs.d/elpa/swoop-20160120.915/swoop.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/swoop-20160120.915/swoop.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "swoop" '("swoop-")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "swoop-edit" "../../../../.emacs.d/elpa/swoop-20160120.915/swoop-edit.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/swoop-20160120.915/swoop-edit.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "swoop-edit" '("swoop-")))

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "swoop-lib" "../../../../.emacs.d/elpa/swoop-20160120.915/swoop-lib.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/swoop-20160120.915/swoop-lib.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "swoop-lib" '("swoop-")))

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/swoop-20160120.915/swoop-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/swoop-20160120.915/swoop-edit.el"
;;;;;;  "../../../../.emacs.d/elpa/swoop-20160120.915/swoop-lib.el"
;;;;;;  "../../../../.emacs.d/elpa/swoop-20160120.915/swoop-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/swoop-20160120.915/swoop.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; swoop-autoloads.el ends here
