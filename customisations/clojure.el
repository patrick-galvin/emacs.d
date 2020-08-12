(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook 'snoopy-mode)

(require 'clj-refactor)

(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(use-package clojure-mode
  :ensure t
  :config
  (require 'flycheck-clj-kondo))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
(add-hook 'clojure-mode #'display-line-numbers-mode)
(global-company-mode)
(define-key company-active-map (kbd "C-n") 'company-select-next-or-abort)
(define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)
(setq company-minimum-prefix-length 2)
(global-set-key "\t" 'company-complete-common)
(global-flycheck-mode)
(show-paren-mode 1)
(set-face-attribute 'show-paren-match nil :weight 'ultra-bold :background nil :foreground "orange")
(set-face-attribute 'flycheck-error nil :foreground "red2" :underline '(:color "red2" :style wave) :weight 'ultra-bold)
(set-face-attribute 'flycheck-warning nil :foreground "orange2" :underline '(:color "orange2" :style wave))

(defun cider-mode-hooks ()
  (eldoc-mode 1)
  (paredit-mode 1)
  (snoopy-mode 1))

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'cider-mode-hooks)

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-display-help-banner nil)
(setq cider-font-lock-dynamically '(macro core function var))

;; Where to store the cider history.
(setq cider-repln-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; Automatically save file when loading the buffer
(setq cider-save-file-on-load t)
