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

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/scripts/")

(require 'c-stuff)
(require 'typescript)
(require 'haskell-conf)

(require 'unbound)

(global-set-key (kbd "C-h u") 'describe-unbound-keys)

(require 'linum-relative)
(linum-on)
(linum-relative-global-mode)

(require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "M-l") 'mc/mark-next-like-this)
(global-set-key (kbd "M-<up>") 'mc/mark-previous-like-this)
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

(require 'xterm-color)
(require 'eshell)

(add-hook 'eshell-mode-hook
          (lambda ()
            (setq xterm-color-preserve-properties t)))

(add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
(setq eshell-output-filter-functions (remove 'eshell-handle-ansi-color eshell-output-filter-functions))

;; comint install
(progn (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
       (setq comint-output-filter-functions (remove 'ansi-color-process-output comint-output-filter-functions)))

;; comint uninstall
(progn (remove-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
       (add-to-list 'comint-output-filter-functions 'ansi-color-process-output))


(setq compilation-environment '("TERM=xterm-256color"))

(desktop-save-mode 1)

(defun set-window-width (n)
  "Set the selected window's width."
  (adjust-window-trailing-edge (selected-window) (- n (window-width)) t))

(defun set-80-columns ()
  "Set the selected window to 80 columns."
  (interactive)
  (set-window-width 80))

(global-set-key (kbd "C-x w") 'set-80-columns)

;;; TODO put in tide-specific
(global-set-key (kbd "C-o") 'tide-jump-to-definition)
(global-set-key (kbd "M-o") 'tide-jump-back)

(global-set-key (kbd "C-x C-o") 'save-buffer)


										; Keyboard movement
(global-set-key (kbd "M-<delete>") 'kill-word)
(global-set-key (kbd "M-<backspace>") 'backward-kill-word)

(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-v") 'yank)

(global-set-key (kbd "M-w") 'delete-window)

(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-S-<tab>") (lambda () (interactive) (other-window -1)))

(global-set-key (kbd "<home>") 'beginning-of-line-text)
(global-set-key (kbd "<end>") 'end-of-line)

(global-set-key (kbd "M-f") 'isearch-forward)
(define-key isearch-mode-map "\M-f" 'isearch-repeat-forward)

(define-key key-translation-map [?\C-x] [?\C-u])
(define-key key-translation-map [?\C-u] [?\C-x])

(define-key key-translation-map [?\M-x] [?\M-u])
(define-key key-translation-map [?\M-u] [?\M-x])

(global-set-key (kbd "C-x M-o") 'other-frame)

(global-set-key (kbd "C-x c") 'comment-region)
(global-set-key (kbd "C-x M-c") 'uncomment-region)

(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(global-set-key (kbd "C-M-z") 'revert-buffer)

(global-set-key (kbd "C-x <C-m>") 'switch-to-buffer-other-window)

(global-set-key (kbd "C-S-z") nil)

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))


(setenv "ANDROID_HOME" "/Users/jona/programmering/android")
(setenv "GUILE_LOAD_PATH" "$GUILE_LOAD_PATH:/Users/jona/programmering/guile/guile-opengl:/Users/jona/programmering/guile/guile-sdl2/:/Users/jona/programmering/guile/chickadee:/Users/jona/programmering/guile/guile-json")
(setenv "NVM_DIR" "$HOME/.nvm")

(add-to-list 'auto-mode-alist '("\\.jarl\\'" . lisp-mode))

(add-to-list 'exec-path "/usr/local/bin")

;;; Rust

(fset 'goto-rust-error
   [?\C-u right ?\C-r ?- ?- ?> return M-right M-left ?\C-  M-right M-right right right right ?\M-w ?\C-u left ?\C-u ?\C-f backspace backspace backspace backspace ?\C-y return ?\C-u right right M-S-right ?\M-w ?\C-u left ?\M-g ?\M-g ?\C-y return ?\C-u right right M-S-right ?\M-w ?\M-m ?\C-u left])

(global-set-key (kbd "C-M-\'") 'goto-rust-error)

(fset 'delete-rowbreak
	  (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([1 134217820 backspace] 0 "%d")) arg)))
(global-set-key (kbd "M-h") 'delete-rowbreak)

(global-set-key (kbd "C-c r") 'mark-paragraph)

;;; Paredit

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(eval-after-load 'paredit
  '(progn
	 (define-key paredit-mode-map (kbd "{") 'paredit-open-curly)
	 (define-key paredit-mode-map (kbd "}") 'paredit-close-curly)

	 (define-key paredit-mode-map (kbd "S-<right>") 'paredit-forward-slurp-sexp)
	 (define-key paredit-mode-map (kbd "S-<left>") 'paredit-forward-barf-sexp)

	 (define-key paredit-mode-map (kbd "M-i") 'paredit-splice-sexp)
	 (define-key paredit-mode-map (kbd "M-j") 'paredit-split-sexp)

	 (define-key paredit-mode-map (kbd "M-<delete>") 'paredit-forward-kill-word)
	 (define-key paredit-mode-map (kbd "M-<backspace>") 'paredit-backward-kill-word)

	 (define-key paredit-mode-map (kbd "M-s") nil)))

(eval-after-load 'tide
  '(progn
	 (define-key tide-mode-map (kbd "C-x t") 'tide-fix)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (leuven)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(line-number-mode nil)
 '(mouse-scroll-delay 0.25)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
 '(ns-alternate-modifier (quote none))
 '(ns-command-modifier (quote meta))
 '(ns-right-alternate-modifier (quote meta))
 '(package-selected-packages
   (quote
	(haskell-mode tagedit cider ensime xterm-color whitespace-cleanup-mode web-mode visible-mark tide relative-line-numbers racer paredit multiple-cursors markdown-mode magit linum-relative json-mode inf-php gh-md exec-path-from-shell company-php ac-php ac-geiser)))
 '(tab-width 4))
