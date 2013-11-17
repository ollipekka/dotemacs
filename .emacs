;; Hide tool bar
(if (functionp 'tool-bar-mode) (tool-bar-mode 0))

; disable scroll bars
(if (functionp 'tool-bar-mode) (scroll-bar-mode -1))

; turn on paren match highlighting
(show-paren-mode 1)

; highlight entire bracket expression
(setq show-paren-style 'expression)

; display line numbers in margin. Emacs 23 only.
(global-linum-mode 1)

;  delete seleted text when typing
(delete-selection-mode 1)

; no start up screen
(setq inhibit-startup-message t)

; Start in home dir instead of root.
(setq default-directory "~/")

; never use tabs
(setq-default indent-tabs-mode nil)

; always use tab width of 4
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

; comment region
(global-set-key (kbd "C-c n") 'comment-region)
(global-set-key (kbd "C-c m") 'uncomment-region)

;; js2-mode for javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

; Remove trailing whitepsace on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; line number mode
(setq line-number-mode t)

; column number mode
(setq column-number-mode t)

; stop creating those backup~ files
(setq make-backup-files nil)

; stop creating those #autosave# files
(setq auto-save-default nil)

; keep a list of recent files
(recentf-mode 1)

; set F7 to list recently opened file
(global-set-key (kbd "<f7>") 'recentf-open-files)

; set
(global-set-key (kbd "<f5>") 'sort-lines)
; custom theme folder.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

; white space mode
(global-whitespace-mode 1)
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))

; Use pilcrow for endline.
(setq whitespace-display-mappings
      ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
      '(
        (space-mark 32 [183] [46]) ; 32 SPACE, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
        (newline-mark 10 [8629 10]) ; 10 LINE FEED
        (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
        ))
