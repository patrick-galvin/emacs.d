(use-package projectile
  :hook
  (after-init . projectile-global-mode)
  :init
  (setq-default
   projectile-keymap-prefix (kbd "C-c C-c")
   projectile-project-search-path '("~/dev/")
   projectile-cache-file (expand-file-name ".projectile-cache" user-emacs-directory)
   projectile-known-projects-file (expand-file-name ".projectile-bookmarks" user-emacs-directory))
  :custom
  (projectile-enable-caching t))

(use-package git-timemachine
  :ensure t
  :bind ("C-x C-g" . git-timemachine-toggle))

(use-package org-roam
      :hook 
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/documents/memory/")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-show-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))))

(require 'ido)
(ido-mode t)

(require 'ox-reveal)
(setq org-reveal-root "file:///~/opt/reveal")

(require 'symbol-overlay)
(global-set-key (kbd "M-i") 'symbol-overlay-put)
(global-set-key (kbd "M-n") 'symbol-overlay-switch-forward)
(global-set-key (kbd "M-p") 'symbol-overlay-switch-backward)
(global-set-key (kbd "<f7>") 'symbol-overlay-mode)
(global-set-key (kbd "<f8>") 'symbol-overlay-remove-all)

(require 'sgml-mode)

(defun pretty-print-xml ()
  (interactive)
  (save-excursion
    (sgml-pretty-print (point-min) (point-max))
    (indent-region (point-min) (point-max))))

(setq org-taskjuggler-default-project-duration 999)
