;;; evil-nerd-commenter-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "evil-nerd-commenter" "../../../../.emacs.d/elpa/evil-nerd-commenter-20170814.1947/evil-nerd-commenter.el"
;;;;;;  "b1006d99179d5000c8a687ce6c36e750")
;;; Generated autoloads from ../../../../.emacs.d/elpa/evil-nerd-commenter-20170814.1947/evil-nerd-commenter.el

(autoload 'evilnc-comment-or-uncomment-paragraphs "evil-nerd-commenter" "\
Comment or uncomment NUM paragraph(s).
A paragraph is a continuation non-empty lines.
Paragraphs are separated by empty lines.

\(fn &optional NUM)" t nil)

(autoload 'evilnc-comment-or-uncomment-to-the-line "evil-nerd-commenter" "\
Comment or uncomment from current line to LINENUM line.

\(fn &optional LINENUM)" t nil)

(autoload 'evilnc-quick-comment-or-uncomment-to-the-line "evil-nerd-commenter" "\
Comment/uncomment to line number by last digit(s) whose value is UNITS.
For exmaple, you can use either \\<M-53>\\[evilnc-quick-comment-or-uncomment-to-the-line] or \\<M-3>\\[evilnc-quick-comment-or-uncomment-to-the-line] to comment to the line 6453

\(fn &optional UNITS)" t nil)

(autoload 'evilnc-toggle-invert-comment-line-by-line "evil-nerd-commenter" "\
Please note this command may NOT work on complex evil text objects.

\(fn)" t nil)

(autoload 'evilnc-toggle-comment-empty-lines "evil-nerd-commenter" "\
Toggle the flag which decide wether empty line will be commented.

\(fn)" t nil)

(autoload 'evilnc-comment-or-uncomment-lines "evil-nerd-commenter" "\
Comment or uncomment NUM lines.  NUM could be negative.

Case 1: If no region selected, comment/uncomment on current line.
If NUM>1, comment/uncomment extra N-1 lines from next line.

Case 2: Selected region is expanded to make it contain whole lines.
Then we comment/uncomment the expanded region.  NUM is ignored.

Case 3: If a region inside of ONE line is selected,
we comment/uncomment that region.
CORRECT comment syntax will be used for C++/Java/Javascript.

\(fn &optional NUM)" t nil)

(autoload 'evilnc-copy-and-comment-lines "evil-nerd-commenter" "\
Copy&paste NUM lines and comment out original lines.
NUM could be negative.

Case 1: If no region selected, operate on current line.
if NUM>1, comment/uncomment extra N-1 lines from next line

Case 2: Selected region is expanded to make it contain whole lines.
Then we operate the expanded region.  NUM is ignored.

\(fn &optional NUM)" t nil)

(autoload 'evilnc-comment-and-kill-ring-save "evil-nerd-commenter" "\
Comment lines save origin lines into `kill-ring'.
NUM could be negative.

Case 1: If no region selected, operate on current line.
;; if NUM>1, comment/uncomment extra N-1 lines from next line

Case 2: Selected region is expanded to make it contain whole lines.
Then we operate the expanded region.  NUM is ignored.

\(fn &optional NUM)" t nil)

(autoload 'evilnc-copy-to-line "evil-nerd-commenter" "\
Copy from current line to LINENUM line. For non-evil user only.

\(fn &optional LINENUM)" t nil)

(autoload 'evilnc-kill-to-line "evil-nerd-commenter" "\
Kill from the current line to the LINENUM line.  For non-evil user only.

\(fn &optional LINENUM)" t nil)

(autoload 'evilnc-version "evil-nerd-commenter" "\
The version number.

\(fn)" t nil)

(autoload 'evilnc-default-hotkeys "evil-nerd-commenter" "\
Set up the key bindings of evil-nerd-comment.
If NO-EVIL-KEYBINDINGS is t, we don't define keybindings in evil-mode.

\(fn &optional NO-EVIL-KEYBINDINGS)" t nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-nerd-commenter"
;;;;;;  "../../../../.emacs.d/elpa/evil-nerd-commenter-20170814.1947/evil-nerd-commenter.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/evil-nerd-commenter-20170814.1947/evil-nerd-commenter.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-nerd-commenter" '("evilnc-")))

;;;***

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "evil-nerd-commenter-operator"
;;;;;;  "../../../../.emacs.d/elpa/evil-nerd-commenter-20170814.1947/evil-nerd-commenter-operator.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/evil-nerd-commenter-20170814.1947/evil-nerd-commenter-operator.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-nerd-commenter-operator" '("evilnc-")))

;;;***

;;;### (autoloads "actual autoloads are elsewhere" "evil-nerd-commenter-sdk"
;;;;;;  "../../../../.emacs.d/elpa/evil-nerd-commenter-20170814.1947/evil-nerd-commenter-sdk.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/evil-nerd-commenter-20170814.1947/evil-nerd-commenter-sdk.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-nerd-commenter-sdk" '("evilnc-")))

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/evil-nerd-commenter-20170814.1947/evil-nerd-commenter-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/evil-nerd-commenter-20170814.1947/evil-nerd-commenter-operator.el"
;;;;;;  "../../../../.emacs.d/elpa/evil-nerd-commenter-20170814.1947/evil-nerd-commenter-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/evil-nerd-commenter-20170814.1947/evil-nerd-commenter-sdk.el"
;;;;;;  "../../../../.emacs.d/elpa/evil-nerd-commenter-20170814.1947/evil-nerd-commenter.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; evil-nerd-commenter-autoloads.el ends here
