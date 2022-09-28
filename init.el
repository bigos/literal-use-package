;; accessing a package repo over https on Windows may fail, so we can
;; fallback to http there
(if (eq system-type 'windows-nt)
    (add-to-list 'package-archives
                 '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/") t))

(defvar init-dir (file-name-directory load-file-name)
  "Directory of the Emacs config init.el.")

;; set package-user-dir to be relative to init.el path
(setq package-user-dir (expand-file-name "elpa" init-dir))


(defvar org-config (expand-file-name "literal-config.org" init-dir)
  "Path to the literal configuration..")
(defvar elc-config (expand-file-name "literal-config.elc" init-dir)
  "Path to the tangled and compiled configuration.")

(org-babel-load-file (expand-file-name org-config  user-emacs-directory) t)
(load-file elc-config)

