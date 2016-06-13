(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(ansi-term-color-vector
   [unspecified "#14191f" "#d15120" "#81af34" "#deae3e" "#7e9fc9" "#a878b5" "#7e9fc9" "#dcdddd"] t)
 '(backup-directory-alist nil)
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(custom-file "~/.emacs.d/custom.el")
 '(custom-safe-themes
   (quote
    ("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "afbb40954f67924d3153f27b6d3399df221b2050f2a72eb2cfa8d29ca783c5a8" "b25040da50ef56b81165676fdf1aecab6eb2c928fac8a1861c5e7295d2a8d4dd" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(diary-file "~/org/diary")
 '(doc-view-resolution 90)
 '(ebib-layout (quote index-only))
 '(ebib-popup-entry-window t)
 '(ebib-preload-bib-files (quote ("/Users/dirac/org/thesis/bib/thesis_bib.bib")))
 '(ebib-window-vertical-split nil)
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(fci-rule-character-color "#192028")
 '(fci-rule-color "#c7c7c7")
 '(gnus-logo-colors (quote ("#2fdbde" "#c0c0c0")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
 '(holiday-other-holidays
   (quote
    ((holiday-fixed 6 10 "UCLA spring quarter ends")
     (holiday-fixed 6 20 "UCLA Session A begins")
     (holiday-fixed 8 1 "UCLA Session C begins")
     (holiday-fixed 9 19 "UCLA winter quarter begins"))))
 '(inhibit-startup-echo-area-message "dirac")
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(ledger-reports
   (quote
    (("bal" "ledger -f %(ledger-file) bal")
     ("reg" "ledger -f %(ledger-file) reg")
     ("payee" "ledger -f %(ledger-file) reg @%(payee)")
     ("account" "ledger -f %(ledger-file) reg %(account)"))))
 '(line-number-mode nil)
 '(max-specpdl-size 1500)
 '(nrepl-message-colors
   (quote
    ("#336c6c" "#205070" "#0f2050" "#806080" "#401440" "#6c1f1c" "#6b400c" "#23733c")))
 '(org-agenda-custom-commands
   (quote
    (("n" "Agenda and all TODOs"
      ((agenda ""
	       ((org-agenda-span 14)))
       (alltodo "" nil))
      nil))))
 '(org-agenda-diary-file (quote diary-file))
 '(org-agenda-files "~/org/.agenda_files")
 '(org-agenda-include-diary t)
 '(org-agenda-todo-list-sublevels nil)
 '(org-babel-load-languages
   (quote
    ((dot . t)
     (ledger . t)
     (python . t)
     (shell . t)
     (emacs-lisp . t))))
 '(org-capture-use-agenda-date t)
 '(org-datetree-add-timestamp (quote inactive))
 '(org-highlight-latex-and-related (quote (latex)))
 '(org-pretty-entities t)
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 3))))
 '(org-reverse-note-order t)
 '(org-tags-column -70)
 '(package-archives
   (quote
    (("melpa-stable" . "https://stable.melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-unstable" . "http://melpa.org/packages/"))))
 '(pdf-view-use-imagemagick t)
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(rainbow-identifiers-cie-l*a*b*-lightness 25)
 '(rainbow-identifiers-cie-l*a*b*-saturation 40)
 '(vc-annotate-background "#d4d4d4")
 '(vc-annotate-color-map
   (quote
    ((20 . "#437c7c")
     (40 . "#336c6c")
     (60 . "#205070")
     (80 . "#2f4070")
     (100 . "#1f3060")
     (120 . "#0f2050")
     (140 . "#a080a0")
     (160 . "#806080")
     (180 . "#704d70")
     (200 . "#603a60")
     (220 . "#502750")
     (240 . "#401440")
     (260 . "#6c1f1c")
     (280 . "#935f5c")
     (300 . "#834744")
     (320 . "#732f2c")
     (340 . "#6b400c")
     (360 . "#23733c"))))
 '(vc-annotate-very-old-color "#23733c")
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray89" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Menlo"))))
 '(biblio-results-header-face ((t (:inherit font-lock-preprocessor-face :weight bold))))
 '(helm-source-header ((t (:background "#abd7f0" :foreground "black" :weight bold :family "Sans Serif"))))
 '(org-date ((t (:foreground "dark cyan"))))
 '(org-document-title ((t (:foreground "#de935f" :height 1))))
 '(org-latex-and-related ((t (:foreground "DarkSeaGreen4")))))
