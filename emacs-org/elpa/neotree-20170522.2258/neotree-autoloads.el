;;; neotree-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "neotree" "../../../../.emacs.d/elpa/neotree-20170522.2258/neotree.el"
;;;;;;  "f52c9f87fec061a6d6b03723b413af0f")
;;; Generated autoloads from ../../../../.emacs.d/elpa/neotree-20170522.2258/neotree.el

(autoload 'neotree-find "neotree" "\
Quick select node which specified PATH in NeoTree.
If path is nil and no buffer file name, then use DEFAULT-PATH,

\(fn &optional PATH DEFAULT-PATH)" t nil)

(autoload 'neotree-projectile-action "neotree" "\
Integration with `Projectile'.

Usage:
    (setq projectile-switch-project-action 'neotree-projectile-action).

When running `projectile-switch-project' (C-c p p), `neotree' will change root
automatically.

\(fn)" t nil)

(autoload 'neotree-toggle "neotree" "\
Toggle show the NeoTree window.

\(fn)" t nil)

(autoload 'neotree-show "neotree" "\
Show the NeoTree window.

\(fn)" t nil)

(autoload 'neotree-hide "neotree" "\
Close the NeoTree window.

\(fn)" t nil)

(autoload 'neotree-dir "neotree" "\
Show the NeoTree window, and change root to PATH.

\(fn PATH)" t nil)

(defalias 'neotree 'neotree-show "\
Show the NeoTree window.")

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/neotree-20170522.2258/neotree-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/neotree-20170522.2258/neotree-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/neotree-20170522.2258/neotree.el")
;;;;;;  (22908 19531 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; neotree-autoloads.el ends here
