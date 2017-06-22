(eval-after-load 'sgml-mode
  '(progn
     (require 'tagedit)

	 (define-key html-mode-map (kbd "S-<right>") 'tagedit-forward-slurp-tag)
	 (define-key html-mode-map (kbd "S-<left>") 'tagedit-forward-barf-tag)
	 (define-key html-mode-map (kbd "M-r") 'tagedit-raise-tag)
	 (define-key html-mode-map (kbd "M-s") 'tagedit-splice-tag)
	 (define-key html-mode-map (kbd "M-J") 'tagedit-join-tags)
	 (define-key html-mode-map (kbd "M-S") 'tagedit-split-tag)
	 (define-key html-mode-map (kbd "M-?") 'tagedit-convolute-tags)
	 (define-key html-mode-map (kbd "C-k") 'tagedit-kill)
	 (define-key html-mode-map (kbd "s-k") 'tagedit-kill-attribute)
	 (define-key html-mode-map (kbd "M-k") 'te/kill-current-tag)

	 (tagedit-add-experimental-features)

     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))
