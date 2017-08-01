(when (>= emacs-major-version 24)
  (require 'package)
  ;; Archives from which to fetch.
  (setq package-archives
	(append '(("melpa" . "http://melpa.milkbox.net/packages/")
		  ("gnu" . "http://elpa.gnu.org/packages/")
		  ("original" . "http://tromey.com/elpa/")
		  ("org" . "http://orgmode.org/elpa/")
		  ("marmalade" . "http://marmalade-repo.org/packages/"))
		package-archives))

;;; On-demand installation of packages
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (if (boundp 'package-selected-packages)
            ;; Record this as a package the user installed explicitly
            (package-install package nil)
          (package-install package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.
  Return a list of installed packages or nil for every skipped package."
  (mapcar
	(lambda (package)
	  (if (package-installed-p package)
		nil
		(if (y-or-n-p (format "Package %s is missing. Install it? " package))
		  (package-install package)
		  package)))
	packages))

  ;; Make sure to have downloaded archive description.
  (or (file-exists-p package-user-dir)
	  (package-refresh-contents))

  (setq package-enable-at-startup nil)
  (package-initialize))

;; Assuming you wish to install "iedit" and "magit"

(ensure-package-installed 'avy
			  'ag
			  'helm
			  'helm-company
			  'helm-fuzzier
			  'helm-swoop
			  'helm-ag
			  'ibuffer
			  'projectile
			  'helm-projectile
			  'company
			  'bind-map
			  'guide-key
			  'which-key
			  'keyfreq
			  'org
			  'markdown-mode
			  'smex
			  'powerline
			  'smooth-scrolling
			  'color-theme-sanityinc-solarized
			  'color-theme-sanityinc-tomorrow
			  'zenburn-theme
			  'rainbow-delimiters
			  'ido
			  'ido-ubiquitous
			  'flx-ido
			  'ido-vertical-mode
			  'expand-region
			  'ediff
			  'back-button
			  'go-mode
			  'go-complete        
			  'go-direx           
			  'go-errcheck        
			  'go-gopath          
			  'go-impl            
			  'go-projectile      
			  'go-snippets        
			  )

(provide 'init-packages)
