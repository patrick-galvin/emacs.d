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
(global-flycheck-mode)

(set-face-attribute 'flycheck-error nil :foreground "red2" :underline '(:color "red2" :style wave) :weight 'ultra-bold)
(set-face-attribute 'flycheck-warning nil :foreground "orange2" :underline '(:color "orange2" :style wave))

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-mode-hook 'eldoc-mode)

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(setq cider-repln-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; Automatically save file when loading the buffer
(setq cider-save-file-on-load t)
