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

(require 'ox-reveal)
(setq org-reveal-root "file:///~/opt/reveal")
