(setq package-enable-at-startup nil)
(package-initialize)

;; Set proper environment variables
(exec-path-from-shell-initialize)

(setq custom-file "~/.emacs.d/custom-init.el")
(load custom-file)

;; Highlight matching parentheses
(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)

;; Overwrite selected text
(delete-selection-mode t)
(setq display-battery-mode t) ; Battery in modeline

;; For python
(require 'jedi)
;; Hook up jedi to autocomplete
(add-to-list 'ac-sources 'ac-source-jedi-direc)
;; Enable for python mode
(add-hook 'python-mode-hook 'jedi-mode)
;; Number lines when in python mode
(add-hook 'python-mode-hook 'linum-mode)
;; Allow autocomplete to work
(add-hook 'python-mode-hook 'auto-complete-mode)

;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
;; Don't let Emacs hurt your ears
(setq visible-bell t)

;; You need to set `inhibit-startup-echo-area-message' from the
;; customization interface:
;; M-x customize-variable RET inhibit-startup-echo-area-message RET
;; then enter your username
(setq inhibit-startup-echo-area-message "dirac")

;; Who use the bar to scroll?
(scroll-bar-mode 0)

;; Better buffer management
(require 'ido)
(ido-mode t)
;; Ido can search org-mode buffers
(setq org-completion-use-ido t)

;; Turn off the bell
(setq ring-bell-function 'ignore)

;; Add email address
(setq user-mail-address "alecstein@physics.ucla.edu")

;; Autofill mode
(setq-default auto-fill-function 'do-auto-fill)

;; Org-mode settings
(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "|" "DONE" "CANCELED")))

(global-set-key (kbd "C-c o") 
                (lambda () (interactive) (find-file
					  "~/org/home.org")))

(global-set-key (kbd "C-c l") 
                (lambda () (interactive) (find-file
					  "~/org/ledger")))

;; Automatically turn on org-beamer-mode
(add-hook 'org-mode-hook 'org-beamer-mode)
(add-hook 'org-mode-hook 'flyspell-mode)

;; Standard org-mode keybindings
; (global-set-key "\C-cl" 'org-store-link) ; I don't use this one
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; Ledger-mode settings

(defun ledger-read-date ()
"Parse date for capturing ledger entries via org mode"
(replace-regexp-in-string "-" "/" (org-read-date)))

(defun capture-cleanup ()
    (cond
     ((derived-mode-p 'ledger-mode) (ledger-post-align-dwim))
     (otherwise nil)
     ))
 
;; Aligns ledger-mode entries after org-capture
(add-hook 'org-capture-before-finalize-hook 'capture-cleanup)

;; Aligns ledger-mode entries after org-capture
(add-hook 'org-capture-before-finalize-hook 'capture-cleanup)

(setq org-capture-templates
      '(
	("l" "Ledger entries")
	("lg" "Georgia United VISA Credit" plain
	 (file "~/org/ledger")
	 "%(ledger-read-date) %^{payee}
     liabilities:georgiabank:credit
     expenses:%^{account}  $%^{amount}" :empty-lines 1)
	("ld" "Georgia United VISA Debit" plain
	 (file "~/org/ledger")
	 "%(ledger-read-date) %^{payee}
    liabilities:georgiabank:debit
    expenses:%^{account}  $%^{amount}" :empty-lines 1)
	("lc" "Cash" plain
	 (file "~/org/ledger")
	 "%(ledger-read-date) * %^{payee}
    expenses:%^{account}  $%^{amount}
    expenses:cash" :empty-lines 1)
	))
