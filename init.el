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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(recentf use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
