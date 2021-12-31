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

(setq cljr-ignore-analyzer-errors t)
(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
(add-hook 'clojure-mode #'display-line-numbers-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-hook 'clojure-mode-hook 'lsp)	    ;;
;; (add-hook 'clojurescript-mode-hook 'lsp) ;;
;; (add-hook 'clojurec-mode-hook 'lsp)	    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq gc-cons-threshold (* 100 1024 1024)
;;       read-process-output-max (* 1024 1024)
;;       treemacs-space-between-root-nodes nil
;; 	  lsp-idle-delay 1.000
;; 	  lsp-log-io nil
;;       company-minimum-prefix-length 1
;;       lsp-lens-enable t
;;       lsp-signature-auto-activate nil
;;       ; lsp-enable-indentation nil ; uncomment to use cider indentation instead of lsp
;;       ; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
;;       )

;; (add-hook 'lsp-mode-hook
;;           (lambda ()
;;             (when (-contains? '(clojure-mode clojurescript-mode clojurec-mode) major-mode)
;;               (setq-local company-backends '(company-lsp)))))



(set-variable 'cider-lein-parameters "with-profile +dev repl")
(global-company-mode)
(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)
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
  (cider-auto-test-mode 1)
  (paredit-mode 1)
  (snoopy-mode 1))

;; provides minibuffer documentation for the code you're typing into the repl
(add-hook 'cider-repl-mode-hook 'cider-mode-hooks)

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-test-show-report-on-success nil)
(setq cider-show-error-buffer 'only-in-repl)
(setq cider-repl-buffer-size-limit 100000)
(setq cider-test-default-exclude-selectors '("integration" "flakey"))
(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-display-help-banner nil)
(setq cider-font-lock-dynamically '(macro core function var))
(setq cljr-warn-on-eval nil)

;; Where to store the cider history.
(setq cider-repln-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; Automatically save file when loading the buffer
(setq cider-save-file-on-load t)
