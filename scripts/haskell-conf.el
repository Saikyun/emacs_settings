(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(custom-set-variables '(haskell-process-type 'cabal-repl)
					  '(haskell-process-suggest-remove-import-lines t)
					  '(haskell-process-auto-import-loaded-modules t)
					  '(haskell-process-log t))

(eval-after-load 'haskell-mode
  '(progn
	 (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
	 (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
	 (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
	 (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
	 (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
	 (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
	 (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
	 ))

(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))


(provide 'haskell-conf)
