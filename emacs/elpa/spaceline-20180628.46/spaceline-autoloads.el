;;; spaceline-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads "actual autoloads are elsewhere" "spaceline" "../../../../.emacs.d/elpa/spaceline-20180628.46/spaceline.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/spaceline-20180628.46/spaceline.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "spaceline" '("spaceline-")))

;;;***

;;;### (autoloads nil "spaceline-config" "../../../../.emacs.d/elpa/spaceline-20180628.46/spaceline-config.el"
;;;;;;  "f74a33caa332d3f2e2e685e80dfafbe9")
;;; Generated autoloads from ../../../../.emacs.d/elpa/spaceline-20180628.46/spaceline-config.el

(autoload 'spaceline-spacemacs-theme "spaceline-config" "\
Install the modeline used by Spacemacs.

ADDITIONAL-SEGMENTS are inserted on the right, between `global' and
`buffer-position'.

\(fn &rest ADDITIONAL-SEGMENTS)" nil nil)

(autoload 'spaceline-emacs-theme "spaceline-config" "\
Install a modeline close to the one used by Spacemacs, but which
looks better without third-party dependencies.

ADDITIONAL-SEGMENTS are inserted on the right, between `global' and
`buffer-position'.

\(fn &rest ADDITIONAL-SEGMENTS)" nil nil)

(defvar spaceline-helm-mode nil "\
Non-nil if Spaceline-Helm mode is enabled.
See the `spaceline-helm-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `spaceline-helm-mode'.")

(custom-autoload 'spaceline-helm-mode "spaceline-config" nil)

(autoload 'spaceline-helm-mode "spaceline-config" "\
Customize the mode-line in helm.

\(fn &optional ARG)" t nil)

(defvar spaceline-info-mode nil "\
Non-nil if Spaceline-Info mode is enabled.
See the `spaceline-info-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `spaceline-info-mode'.")

(custom-autoload 'spaceline-info-mode "spaceline-config" nil)

(autoload 'spaceline-info-mode "spaceline-config" "\
Customize the mode-line in info.
This minor mode requires info+.

\(fn &optional ARG)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "spaceline-config"
;;;;;;  "../../../../.emacs.d/elpa/spaceline-20180628.46/spaceline-config.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/spaceline-20180628.46/spaceline-config.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "spaceline-config" '("spaceline--")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "spaceline-segments"
;;;;;;  "../../../../.emacs.d/elpa/spaceline-20180628.46/spaceline-segments.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/spaceline-20180628.46/spaceline-segments.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "spaceline-segments" '("spaceline-")))

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/spaceline-20180628.46/spaceline-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/spaceline-20180628.46/spaceline-config.el"
;;;;;;  "../../../../.emacs.d/elpa/spaceline-20180628.46/spaceline-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/spaceline-20180628.46/spaceline-segments.el"
;;;;;;  "../../../../.emacs.d/elpa/spaceline-20180628.46/spaceline.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; spaceline-autoloads.el ends here
