;; Hide tool bar
(if (functionp 'tool-bar-mode) (tool-bar-mode 0))

; highlight text selection
(transient-mark-mode 1) 

; delete seleted text when typing
(delete-selection-mode 1) 

;;(setq default-directory "~/" )
(setq default-directory "~/")
(cd "~/")
