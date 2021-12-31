(require 'package)

;(add-to-list 'package-archives
;  '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-archives
	  '(("melpa" . "https://melpa.org/packages/")
		("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(setq org-roam-v2-ack t)

(add-to-list 'load-path "~/.emacs.d/customisations")

;; Initialize all the ELPA packages (what is installed using the packages commands)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#313131" "#D9A0A0" "#8CAC8C" "#FDECBC" "#99DDE0" "#E090C7" "#A0EDF0" "#DCDCCC"])
 '(custom-safe-themes
   '("834cbeacb6837f3ddca4a1a7b19b1af3834f36a701e8b15b628cad3d85c970ff" default))
 '(fci-rule-color "#5E5E5E")
 '(package-selected-packages
   '(idle-highlight-mode snoopy org-contrib clj-refactor all-the-icons auto-package-update git-timemachine symbol-overlay magit org-roam which-key ox-reveal use-package hc-zenburn-theme company aggressive-indent rainbow-delimiters paredit projectile clojure-mode-extra-font-locking cider flycheck-clj-kondo))
 '(safe-local-variable-values
   '((cider-repl-init-code "(start)")
	 (cider-ns-refresh-after-fn . "dev-extras/resume")
	 (cider-ns-refresh-before-fn . "dev-extras/suspend")
	 (cider-ns-refresh-after-fn . "integrant.repl/resume")
	 (cider-ns-refresh-before-fn . "integrant.repl/suspend")))
 '(vc-annotate-background "#202020")
 '(vc-annotate-color-map
   '((20 . "#C99090")
	 (40 . "#D9A0A0")
	 (60 . "#ECBC9C")
	 (80 . "#DDCC9C")
	 (100 . "#EDDCAC")
	 (120 . "#FDECBC")
	 (140 . "#6C8C6C")
	 (160 . "#8CAC8C")
	 (180 . "#9CBF9C")
	 (200 . "#ACD2AC")
	 (220 . "#BCE5BC")
	 (240 . "#CCF8CC")
	 (260 . "#A0EDF0")
	 (280 . "#79ADB0")
	 (300 . "#89C5C8")
	 (320 . "#99DDE0")
	 (340 . "#9CC7FB")
	 (360 . "#E090C7")))
 '(vc-annotate-very-old-color "#E090C7"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(load "ui")
(load "clojure")
(load "general")
(load "projects")
