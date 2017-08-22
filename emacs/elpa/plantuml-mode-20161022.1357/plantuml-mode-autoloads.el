;;; plantuml-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "plantuml-mode" "plantuml-mode.el" (0 0 0 0))
;;; Generated autoloads from plantuml-mode.el

(autoload 'plantuml-render-region "plantuml-mode" "\
Replace PlantUML at region with rendered UML.

\(fn)" t nil)

(autoload 'plantuml-mode "plantuml-mode" "\
Major mode for plantuml.

Shortcuts             Command Name
\\[plantuml-complete-symbol]      `plantuml-complete-symbol'

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.(plantuml|puml)\\'" . plantuml-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "plantuml-mode" '("plantuml-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; plantuml-mode-autoloads.el ends here