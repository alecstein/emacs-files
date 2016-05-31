;; Emacs-specific
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(setq user-mail-address "alecstein@physics.ucla.edu")	;; My email address

(setq package-enable-at-startup nil)
(package-initialize)
(exec-path-from-shell-initialize)		;; Set proper environment variables

(require 'ido)					;; Better buffer management
(ido-mode t)
(setq org-completion-use-ido t)			;; Ido can search org-mode buffers
(setq-default auto-fill-function 'do-auto-fill) ;; Autofill mode

(require 'paren)
(setq show-paren-style 'parenthesis)	;; Highlight matching parentheses
(show-paren-mode +1)
(setq initial-scratch-message "")	;; Don't use messages that you don't read
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)	;; Don't let Emacs hurt your ears
(scroll-bar-mode			;; Who uses the bar to scroll?
(delete-selection-mode t)		;; Overwrite selected text

;; For python
(require 'jedi)
(add-to-list 'ac-sources 'ac-source-jedi-direc)		;; Hook up jedi to autocomplete
(add-hook 'python-mode-hook 'jedi-mode)			;; Enable for python mode
(add-hook 'python-mode-hook 'linum-mode)		;; Number lines when in python mode
(add-hook 'python-mode-hook 'auto-complete-mode)	;; Allow autocomplete to work

;; Org-mode settings
(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "|" "DONE" "CANCELED")))

(global-set-key (kbd "C-c o")
                (lambda () (interactive) (find-file
					  "~/org/home.org")))
(global-set-key (kbd "C-c l")
                (lambda () (interactive) (find-file
					  "~/org/ledger")))

(add-hook 'org-mode-hook 'org-beamer-mode)	;; Enable org-beamer-mode
(add-hook 'org-mode-hook 'flyspell-mode)

(global-set-key "\C-cl" 'org-store-link)	;; Standard org-mode keybindings
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture) 
(global-set-key "\C-cb" 'org-iswitchb)

;; Ledger-mode settings
;; Other ledger settings are stored in ~/.ledgerrc. One of these
;; settings puts the date string into the format %Y-%m-%d. This is
;; necessary for the formatting to work with (org-read-date), which is
;; what pulls the date for the automatic entry. For some reason,
;; formatting the (org-read-date) string to have dashes instead of
;; slashes has proven harder than it ought to be.

(setq org-capture-templates
      (append '(
		("l" "Ledger entries")
		("lg" "Georgia United VISA Credit" plain
		 (file "~/org/ledger")
		 "%(org-read-date) %^{payee}
     liabilities:georgiabank:credit
     expenses:%^{account}  $%^{amount}" :empty-lines 1)
		("ld" "Georgia United VISA Debit" plain
		 (file "~/org/ledger")
		 "%(org-read-date) %^{payee}
    liabilities:georgiabank:debit
    expenses:%^{account}  $%^{amount}" :empty-lines 1)
		("lc" "Cash" plain
		 (file "~/org/ledger")
		 "%(org-read-date) * %^{payee}
    expenses:%^{account}  $%^{amount}
    expenses:cash" :empty-lines 1)
		)))

(defun capture-cleanup ()
    (cond
     ((derived-mode-p 'ledger-mode) (ledger-post-align-dwim))
     (otherwise nil)
     ))

;; Aligns ledger-mode entries after org-capture
(add-hook 'org-capture-before-finalize-hook 'capture-cleanup)
