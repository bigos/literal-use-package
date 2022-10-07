;; accessing a package repo over https on Windows may fail, so we can
;; fallback to http there
(require 'package)
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

;; because org config may fail, we set Melpa archive and folders in the above
;; this comment
(org-babel-load-file (expand-file-name org-config  user-emacs-directory) t)
