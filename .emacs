(progn
  ;; load elpa package system
  ;; require emacs 24
  (require 'package)
  ;; Add MELPA repository.
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

  (when (< emacs-major-version 27) (package-initialize))
  ;;
  )

(package-install 'org)
(require 'org)

;; Must do this so the agenda knows where to look for my files
(setq org-agenda-files '("/workspace/ShusaKumputer/ShusakuMputerNotes/org"))

;; When a TODO is set to a done state, record a timestamp
(setq org-log-done 'time)

;; Follow the links
(setq org-return-follows-link  t)

;; Associate all org files with org mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Make the indentation look nicer
(add-hook 'org-mode-hook 'org-indent-mode)

;; Remap the change priority keys to use the UP or DOWN key
(define-key org-mode-map (kbd "C-c <up>") 'org-priority-up)
(define-key org-mode-map (kbd "C-c <down>") 'org-priority-down)

;; Shortcuts for storing links, viewing the agenda, and starting a capture
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

;; When you want to change the level of an org item, use SMR
(define-key org-mode-map (kbd "C-c C-g C-r") 'org-shiftmetaright)

;; Hide the markers so you just see bold text as BOLD-TEXT and not *BOLD-TEXT*
(setq org-hide-emphasis-markers t)

;; Wrap the lines in org mode so that things are easier to read
(add-hook 'org-mode-hook 'visual-line-mode)

(setq org-capture-templates
      '(    
        ("j" "Work Log Entry"
         entry (file+datetree "/workspace/ShusaKumputer/ShusakuMputerNotes/org/work-log.org")
         "* %?"
         :empty-lines 0)   
    
        ("n" "Note"
         entry (file+headline "/workspace/ShusaKumputer/ShusakuMputerNotes/org/notes.org" "Random Notes")
         "** %?"
         :empty-lines 0)

        ("g" "General To-Do"
         entry (file+headline "/workspace/ShusaKumputer/ShusakuMputerNotes/org/todos.org" "General Tasks")
         "* TODO [#B] %?\n:Created: %T\n "
         :empty-lines 0)
      ))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(org)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
