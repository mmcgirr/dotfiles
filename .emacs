;; package lists
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Multiple Cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-c ; C-c ;")	'mc/edit-lines)
(global-set-key       (kbd "C-c .")	'mc/mark-next-like-this)
(global-set-key       (kbd "C-c ,")	'mc/mark-previous-like-this)
(global-set-key     (kbd "C-c C-,")	'mc/mark-all-like-this)
;; (global-set-key     (kbd "C-\"")	'mc/skip-to-next-like-this)
;; (global-set-key      (kbd "C-:")     'mc/skip-to-previous-like-this)

;; keybindings
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; ido mode - interesting C-x C-f mod
(require 'ido)
(ido-mode 1)

;; other
(put 'downcase-region 'disabled nil)

;; .emacs symlink git
(setq vc-follow-symlinks t)

;; prevent constant safe-mode prompt for gruber-darker
(load-theme 'gruber-darker t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t)
 '(cua-rectangle-mark-key [C-return])
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" default))
 '(help-window-select t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(org-startup-folded 'show2levels)
 '(package-selected-packages
   '(yasnippet which-key smex multiple-cursors gruber-darker-theme gnu-elpa-keyring-update free-keys company))
 '(ring-bell-function 'ignore)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(visible-bell t)
 '(windmove-default-keybindings '([ignore] shift))
 '(windmove-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; remap M-TAB in org mode
(require 'org)
(define-key org-mode-map (kbd "C-c TAB") 'pcomplete)

(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)
			     (emacs-lisp . t)
			     (python . t)
			     (shell . t)))

;; (add-hook #'org-mode-hook #'org-special-block-extras-mode)
;; (use-package org-special-block-extras
;;    :ensure t
;;    :hook (org-mode . org-special-block-extras-mode)
;;    ;; all relevant functions prefixed with o-
;;    :custom
;;    (o-docs-libraries
;;     '("~/org-special-block-extras/documentation.org")
;;     "The places where I keep '#+documentation'"))

(use-package company
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)))

;; (use-package company-jedi
;;   :ensure t
;;   :config
;;   (progn 
;;     (setq jedi:complete-on-dot t
;;           jedi:use-shortcuts t)
;;     (defun user/python-mode-hook ()
;;       (add-to-list 'company-backends 'company-jedi))
;;     (add-hook 'python-mode-hook 'user/python-mode-hook)))
