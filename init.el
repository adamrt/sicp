;;; Setup package.el
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(unless package--initialized (package-initialize))

;;; Setup use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;;; Defaults
(setq ring-bell-function 'ignore) ; Disable bell sound
(setq inhibit-startup-message t)  ; Show the scratch buffer on startup
(fset 'yes-or-no-p 'y-or-n-p)     ; y-or-n-p makes answering questions faster
(show-paren-mode 1)               ; Show closing parens by default
(global-auto-revert-mode t)       ; Auto-update buffer if file has changed on disk

;;; Mandatory Steve Yegge Keybindings
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-w") 'backward-kill-word)

(use-package syntax-subword
  :config (global-syntax-subword-mode))

(use-package magit
  :bind (("C-x g" . magit-status)))
