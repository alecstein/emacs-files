;; -*- fill-column: 120; -*-
; Emacs-specific
(setq user-mail-address "alecstein@physics.ucla.edu")	; My email address

;(setq package-enable-at-startup nil) ; Why is this here?
(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")		; Customizations must be loaded after (package-initialize)
(load custom-file)

(global-set-key (kbd "C-x C-b") 'ibuffer)		; Enable ibuffer mode
(autoload 'ibuffer "ibuffer" "List buffers." t)

(exec-path-from-shell-initialize)			; Set proper environment variables

(require 'ido)						; Better buffer management
(ido-mode t)
(setq org-completion-use-ido t)				; Ido can search org-mode buffers
(setq-default auto-fill-function 'do-auto-fill)		; Autofill mode

(setq
   backup-by-copying t					; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs_backups"))			; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)					; use versioned backups


(require 'paren)
(setq show-paren-style 'parenthesis)			; Highlight matching parentheses
(show-paren-mode +1)
(setq initial-scratch-message "")			; Don't use messages that you don't read
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)			; Don't let Emacs hurt your ears
(scroll-bar-mode 0)					; Who uses the bar to scroll?
(delete-selection-mode t)				; Overwrite selected text
(fset 'yes-or-no-p 'y-or-n-p)				; Replace yes/no prompts with y/n
(set-frame-parameter nil 'fullscreen 'fullboth)		; Enable pseudo fullscreen

							; For python
(require 'jedi)
(add-to-list 'ac-sources 'ac-source-jedi-direc)		; Hook up jedi to autocomplete		
;(add-hook 'python-mode-hook 'linum-mode)		; Number lines when in python mode
(add-hook 'python-mode-hook 'auto-complete-mode)	; Allow autocomplete to work
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq py-python-command "/usr/local/bin/python3")	; Tell python which compiler to use

							; Org-mode settings
(setq org-hide-emphasis-markers t)                      ; Make /this/ look nice
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "|" "DONE" "CANCELED")))

(add-hook 'org-mode-hook 'org-beamer-mode)		; Enable org-beamer-mode
(add-hook 'org-mode-hook 'flyspell-mode)

(global-set-key "\C-cl" 'org-store-link)		; Standard org-mode keybindings
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture) 
(global-set-key "\C-cb" 'org-iswitchb)

(require 'org-inlinetask)                               ; Enable inline tasks

; Ledger-mode settings
; Other ledger settings are stored in ~/.ledgerrc. One of these
; settings puts the date string into the format %Y-%m-%d. This is
; necessary for the formatting to work with (org-read-date), which is
; what pulls the date for the automatic entry. For some reason,
; formatting the (org-read-date) string to have dashes instead of
; slashes has proven harder than it ought to be.

(setq org-capture-templates
      '(
	("t" "Quicknote" plain
	 (file "~/org/notes"))
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
	)
      )

(defun capture-cleanup ()
    (cond
     ((derived-mode-p 'ledger-mode) (ledger-post-align-dwim))
     ))

; Aligns ledger-mode entries after org-capture
(add-hook 'org-capture-before-finalize-hook 'capture-cleanup)

(put 'dired-find-alternate-file 'disabled nil)

; eBib settings
(global-set-key "\C-ce" 'ebib)
