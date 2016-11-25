(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq backup-directory-alist `(("." . "~/.backups")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(setq backup-directory-alist
	  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
	  `((".*" ,temporary-file-directory t)))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95"
	"#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (leuven)))
 '(line-number-mode nil)
 '(mouse-scroll-delay 0.25)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
 '(ns-alternate-modifier (quote none))
 '(ns-command-modifier (quote meta))
 '(ns-right-alternate-modifier (quote super))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun insert-rowbreak-above ()
  (interactive)
  (point-to-register 'start-pos)
  (beginning-of-line)
  (insert "\n")
  (jump-to-register 'start-pos))

(global-set-key (kbd "C-S-o") 'insert-rowbreak-above)

(add-to-list 'load-path "~/.emacs.d/scripts/")

(require 'unbound)

(global-set-key (kbd "C-h u") 'describe-unbound-keys)

(require 'linum-relative)
(linum-on)
(linum-relative-global-mode)

(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(put 'scroll-left 'disabled nil)

(global-set-key (kbd "M-n") 'kmacro-call-macro)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

(setq visible-mark-faces '(visible-mark-face-2 visible-mark-face1))
(setq visible-mark-max 2)

(require 'visible-mark)
(global-visible-mark-mode 1)

(setq racer-cmd "~/programmering/racer/target/release/racer")
(setq racer-rust-src-path "~/programmering/rust/rust/src/")

(require 'rust-mode)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(add-hook 'racer-mode-hook #'company-mode)

(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(set-default-font
 "-*-Gabriele Light Ribbon FG-light-normal-normal-*-14-*-*-*-p-0-iso10646-1")

(add-hook 'php-mode-hook
          '(lambda ()
             (require 'company-php)
             (company-mode t)
             (add-to-list 'company-backends 'company-ac-php-backend)))
(put 'downcase-region 'disabled nil)

										; Keyboard movement
(define-key input-decode-map [?\C-i] [C-i])              ; if we don't do this, tab will be previous-logical-line
(global-set-key (kbd "<C-i>") 'previous-logical-line)
(global-set-key (kbd "C-j") 'next-logical-line)

(global-set-key (kbd "C-å") (kbd "/"))

(global-set-key (kbd "C-o") 'backward-char)
(global-set-key (kbd "C-p") 'forward-char)
(global-set-key (kbd "C-n") 'delete-backward-char)
(define-key input-decode-map [?\C-m] [C-m])              ; if we don't do this, enter will delete-forward-char
(global-set-key (kbd "<C-m>") 'delete-forward-char)

(global-set-key (kbd "M-i") 'previous-logical-line)	
(global-set-key (kbd "C-j") 'next-logical-line)

(global-set-key (kbd "M-o") 'backward-word)
(global-set-key (kbd "M-p") 'forward-word)
(global-set-key (kbd "M-n") 'backward-kill-word)
(global-set-key (kbd "M-m") 'kill-word)
(global-set-key (kbd "C-f") 'newline)

(add-hook 'minibuffer-setup-hook
          (lambda ()
			(define-key input-decode-map [?\C-i] [C-i])              ; if we don't do this, tab will be previous-logical-line
			(local-set-key (kbd "<C-i>") 'previous-logical-line)
			(local-set-key (kbd "C-j") 'next-logical-line)

			(local-set-key (kbd "C-å") (kbd "/"))

			(local-set-key (kbd "C-o") 'backward-char)
			(local-set-key (kbd "C-p") 'forward-char)
			(local-set-key (kbd "C-n") 'delete-backward-char)
			(define-key input-decode-map [?\C-m] [C-m])              ; if we don't do this, enter will delete-forward-char
			(local-set-key (kbd "<C-m>") 'delete-forward-char)

			(local-set-key (kbd "M-i") 'previous-logical-line)	
			(local-set-key (kbd "C-j") 'next-logical-line)

			(local-set-key (kbd "M-o") 'backward-word)
			(local-set-key (kbd "M-p") 'forward-word)
			(local-set-key (kbd "M-n") 'backward-kill-word)
			(local-set-key (kbd "M-m") 'kill-word)
			(local-set-key (kbd "C-f") 'newline)))
