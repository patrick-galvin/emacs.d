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

(require 'ox-reveal)
(setq org-reveal-root "file:///home/patrick/opt/reveal")
