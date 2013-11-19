(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Hide tool bar
(if (functionp 'tool-bar-mode) (tool-bar-mode 0))

; disable scroll bars
(if (functionp 'scroll-bar-mode) (scroll-bar-mode -1))

; disable menu bar in non-osx systems
(unless (eq system-type 'darwin)
    (if (functionp 'menu-bar-mode) (menu-bar-mode -1))
)

; disable audio bell
(setq ring-bell-function 'ignore)

; turn on paren match highlighting
(show-paren-mode 1)

; highlight entire bracket expression
(setq show-paren-style 'expression)

; display line numbers in margin. Emacs 23 only.
(global-linum-mode 1)

;  delete seleted text when typing
(delete-selection-mode 1)

; no start up messages
(setq inhibit-startup-echo-area-message t)

; no start up screen
(setq inhibit-startup-message t)
; Start in home dir instead of root.
(setq default-directory "~/")

; Use utf-8
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

; never use tabs
(setq-default indent-tabs-mode nil)

; always use tab width of 4
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

; js2-mode for javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

; Auto load markdown-mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


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

; automatically complete tags
(setq nxml-slash-auto-complete-flag t)

; keep a list of recent files
(recentf-mode 1)

; custom theme folder.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

; white space mode
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))

; Use don't use pilcrow or dollar for endline.
(setq whitespace-display-mappings
      ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
      '(
        (space-mark 32 [183] [46]) ; 32 SPACE, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
        (newline-mark 10 [8629 10]) ; 10 LINE FEED
        (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
        ))

; Keyboard shortcuts

; set F7 to list recently opened file.
(global-set-key (kbd "<f7>") 'recentf-open-files)

; set F5 to stort lines.
(global-set-key (kbd "<f5>") 'sort-lines)

; set F9 to toggle whitespace mode
(global-set-key (kbd "<f9>") 'whitespace-mode)


; Font size to 15pt
(set-face-attribute 'default nil :height 130)

; Convert dos-line endings to unix.
(add-hook 'find-file-hook 'find-file-check-line-endings)
(defun dos-file-endings-p ()
  (string-match "dos" (symbol-name buffer-file-coding-system)))
(defun find-file-check-line-endings ()
  (when (dos-file-endings-p)
    (set-buffer-file-coding-system 'undecided-unix)
    (set-buffer-modified-p nil)))
