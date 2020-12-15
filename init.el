(require 'package)

 
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
 (package-refresh-contents)
(package-initialize)


(setq package-enable-at-startup nil)

(set-face-attribute 'default nil :family "Fira Mono Medium")
(set-face-attribute 'default nil :height 155)


;; zenburn

(unless (package-installed-p 'zenburn-theme)
  (package-install 'zenburn-theme))

(load-theme 'zenburn t)

;; undo-tree

(unless (package-installed-p 'undo-tree)
  (package-install 'undo-tree))

(global-undo-tree-mode)

;; evil

(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)
;; ivy

(unless (package-installed-p 'ivy)
  (package-install 'ivy))

(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d ")

;; smex

(unless (package-installed-p 'smex)
  (package-install 'smex))

(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; projectile

(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-completion-system 'ivy)
(projectile-mode +1)

;; magit

(unless (package-installed-p 'magit)
  (package-install 'magit))

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)


;; flycheck

(unless (package-installed-p 'flycheck)
  (package-install 'flycheck))

(global-flycheck-mode)

;; company-mode

(unless (package-installed-p 'company)
  (package-install 'company))

(global-company-mode)
(setq company-idle-delay nil)
(global-set-key (kbd "M-TAB") #'company-complete)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)

;; clojure-mode

(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode)
  (package-install 'clojure-mode-extra-font-locking))

(require 'clojure-mode-extra-font-locking)

(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'subword-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)

;; cider

(unless (package-installed-p 'cider)
  (package-install 'cider))

(add-hook 'cider-repl-mode-hook #'subword-mode)
(add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook #'aggressive-indent-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(setq cider-repl-wrap-history t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(setq cider-save-file-on-load t)
(setq cider-font-lock-dynamically '(macro core function var))

;; clj-refactor

(unless (package-installed-p 'clj-refactor)
  (package-install 'clj-refactor))

(require 'clj-refactor)

(defun clj-ref-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1))

(add-hook 'clojure-mode-hook #'clj-ref-clojure-mode-hook)

;; flycheck-clj-kondo

(unless (package-installed-p 'flycheck-clj-kondo)
  (package-install 'flycheck-clj-kondo))

(require 'flycheck-clj-kondo)

;; which-key

(unless (package-installed-p 'which-key)
  (package-install 'which-key))

(which-key-mode)

;; editing

(show-paren-mode 1)
(global-hl-line-mode 1)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(setq-default indent-tabs-mode nil)

;; UI
(menu-bar-mode -1)
(global-linum-mode)
(scroll-bar-mode -1)
(setq-default frame-title-format "%b (%f)")
(setq ring-bell-function 'ignore)


;; misc

(fset 'yes-or-no-p 'y-or-n-p)
(setq create-lockfiles nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(ivy-mode t)
 '(package-selected-packages
   (quote
    (company company-mode undo-tree flycheck-clj-kondo clojure-mode-extra-font-locking clojure-mode flycheck magit projectile smex ivy aggressive-indent smartparens rainbow-delimiters zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
