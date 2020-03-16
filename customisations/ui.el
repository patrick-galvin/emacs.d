(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(load-theme 'hc-zenburn t)

(setq column-number-mode t)
(setq explicit-shell-file-name "/bin/zsh")
(setq auto-window-vscroll nil)
(set-default-coding-systems 'utf-8)
(fringe-mode 0)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)

(setq-default
 fill-column 80
 scroll-margin 10
 tab-width 4
 scroll-conservatively most-positive-fixnum
 inhibit-startup-screen t)


(setq split-height-threshold 1200)
(setq split-width-threshold 2000)
(bind-key* "M-l" 'next-buffer)
(bind-key* "M-k" 'previous-buffer)
(global-set-key (kbd "C-.") #'other-window)
(global-set-key (kbd "C-,") #'previous-multiframe-window)
(global-set-key [remap kill-buffer] #'kill-this-buffer)
(add-hook 'focus-out-hook #'garbage-collect)
(cd "~/dev")
