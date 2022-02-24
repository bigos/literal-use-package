(defvar init-dir (file-name-directory load-file-name)
  "Directory of the Emacs config init.el.")

(defvar org-config (expand-file-name "literal-config.org" init-dir)
  "Path to the literal configuration..")
(defvar elc-config (expand-file-name "literal-config.elc" init-dir)
  "Path to the tangled and compiled configuration.")

(if (file-newer-than-file-p org-config elc-config)
    (progn
      (message "going to tangle literal config.")
      (org-babel-load-file (expand-file-name org-config  user-emacs-directory) 1))
  (load-file elc-config)) 


