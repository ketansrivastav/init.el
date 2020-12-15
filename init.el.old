
(require 'package)

(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(magit . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(flycheck . "melpa-stable") t)

(package-initialize)
(setq package-enable-at-startup nil)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(
    paredit
    clojure-mode
    clojure-mode-extra-font-locking
    cider
    clj-refactor
                                        ;  ido-ubiquitous
  smex
  projectile
   rainbow-delimiters
   tagedit
   magit
					;crux
   company
   aggressive-indent
   web-mode
   git-gutter
   use-package
   flycheck
   try
   which-key
   ace-window
  evil
  docker-compose-mode
   dockerfile-mode

   monokai-theme 
   ))

  (dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

  (add-to-list 'load-path "~/.emacs.d/vendor")
;;company
; from https://github.com/purcell/emacs.d/blob/master/lisp/init-company.el


(company-mode t)
(add-hook 'after-init-hook 'global-company-mode)

;; UI
(load-theme 'monokai t)
(menu-bar-mode -1)
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
(setq initial-frame-alist '((top . 0) (left . 0)
                            (width . 272) (height . 77)))

;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)

;;================================================
;;editing
;; Highlights matching parenthesis
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

(setq-default indent-tabs-mode nil)
(setq-default frame-title-format "%b (%f)")
(setq ns-pop-up-frames nil)
(global-display-line-numbers-mode)


;; misc
;; Enable Evil
(require 'evil)
(evil-mode 1)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)
(global-set-key (kbd "C-x g") 'magit-status)
(use-package which-key
  :ensure t
  :config
  (which-key-mode))


;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode 1)
(use-package counsel
:ensure t
)

(use-package swiper
:ensure try
:config
(progn
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-load-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
))


(use-package ace-window
:ensure t
:init
(progn
(global-set-key [remap other-window] 'ace-window)
(custom-set-faces
'(aw-leading-char-face
((t (:inherit ace-jump-face-foreground :height 3.0)))))
))
;;==================================================

  ;; clojure
  (require 'clojure-mode-extra-font-locking)
  (setq clojure-indent-style :align-arguments)

  (add-hook 'clojure-mode-hook
          (lambda ()
            (setq show-trailing-whitespace t)
            ;; (setq inferior-lisp-program "lein repl")
            (put-clojure-indent 'reg-event-db 1)
            (put-clojure-indent 'reg-event-fx 1)
            (put-clojure-indent 'reg-fx 1)
            (put-clojure-indent 'reg-cofx 1)

            (put-clojure-indent 'reg-sub 1)
            (put-clojure-indent 'bind-relations 1)
            (put-clojure-indent 'react-method 1)
            (put-clojure-indent 'render 1)
            (put-clojure-indent 'componentDidMount 1)
            (put-clojure-indent 'componentWillUnmount 1)
            (put-clojure-indent 'componentDidUpdate 1)

            (put-clojure-indent 'expect-with-temp 1)
            (put-clojure-indent 'strict-extend 1)

            (put-clojure-indent 'POST 2)
            (put-clojure-indent 'DELETE 2)
            (put-clojure-indent 'GET 2)
            (put-clojure-indent 'PATCH 2)
            (put-clojure-indent 'checking 2)

            (put-clojure-indent 'rr 2)

            (enable-paredit-mode)
            (subword-mode)
            (flycheck-mode)))

  (add-hook 'clojure-mode-hook #'aggressive-indent-mode)
  (add-hook 'clojurescript-mode-hook #'aggressive-indent-mode)

  (add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)
(add-hook 'cider-repl-mode-hook (lambda ()
                                  (aggressive-indent-mode nil)
                                  (aggressive-indent-mode 'toggle)))
(setq cider-dynamic-indentation nil)

;; autocomplete
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(setq cider-repl-wrap-history t)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(defun clj-refactor-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import
    (cljr-add-keybindings-with-prefix "C-c C-,"))

(add-hook 'clojure-mode-hook #'clj-refactor-hook)

;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
;; (add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '(".cljs.hl$" . clojurescript-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))
;; Automatically load paredit when editing a lisp file
;; More at http://www.emacswiki.org/emacs/ParEdit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; js
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-hook 'js-mode-hook 'subword-mode)
(add-hook 'html-mode-hook 'subword-mode)
(setq js-indent-level 2)
(eval-after-load "sgml-mode"
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))
