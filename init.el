;; run this first to make the initialization look smooth
(add-to-list 'default-frame-alist '(height . 64))
(add-to-list 'default-frame-alist '(width . 140))

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; add Melpa package library

(require 'package)

(add-to-list 'package-archives
             '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; note: the following lines set the theme. the second theme in the list
;; specifies tab colors
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(modus-vivendi))
 '(fancy-splash-image "~/.emacs.d/Emacs_256x256x32.png")
 '(flycheck-checker-error-threshold 1000)
 '(ns-auto-hide-menu-bar nil)
 '(package-selected-packages
   '(lsp-mode csharp-mode flycheck-rust rust-mode exec-path-from-shell flycheck company tramp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; remove ugly buttons at the top of the UI
(tool-bar-mode -1)

;; don't do annoying thing in dired where new windows/buffers
;; are always opened when selecting a folder
(require 'dired)
(put 'dired-find-alternate-file 'disabled nil)
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(define-key dired-mode-map (kbd "o") 'dired-find-file)
(define-key dired-mode-map [mouse-3] 'dired-mouse-find-file)
(define-key dired-mode-map (kbd "<mouse-2>") 'dired-find-alternate-file)

;; tabs corresponding to each buffer
(require 'tab-line)
(global-tab-line-mode t)
(setq tab-line-new-button-show nil)
(setq tab-line-close-button-show nil)
(setq tab-line-separator " ")

(blink-cursor-mode 1)

;; autocomplete menus
(add-hook 'after-init-hook 'global-company-mode)

;; rust-mode
(require 'rust-mode)

(with-eval-after-load 'flycheck
  (flycheck-add-mode 'rust 'rust-mode))
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))


;; flycheck (requires melpa)
(add-hook 'after-init-hook #'global-flycheck-mode)
(exec-path-from-shell-initialize)
(require 'flycheck)
(flycheck-add-next-checker 'python-pylint 'python-pycompile)

(require 'lsp-mode)
