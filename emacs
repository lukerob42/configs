;; Clean .emacs TBD: Does it work with XEMACS?

;; (defun old-emacs(blah)
;;   ;; backspace
;;   (keyboard-translate ?\C-h ?\C-?)
;; )



;; (defun new-emacs(blah)
;;   ;; backspace
;;   (normal-erase-is-backspace-mode 0)
;; )

;; (if (version< emacs-version "24.4")
;;   (old-emacs "")
;;   (new-emacs ""))

;; backspace
(normal-erase-is-backspace-mode 0)

; don't make pesky backup files
(setq make-backup-files nil)


(show-paren-mode 1)

(custom-set-variables
 '(paren-mode (quote paren) nil (paren))
 '(load-home-init-file t t)
 '(column-number-mode t)
 '(line-number-mode t)
 '(frame-background-mode (quote dark))
 '(user-mail-address "luke_robertson@keysight.com" t)
 '(query-user-mail-address nil)
 '(compile-command "/projects/issBuildTools/external/bin/subdir_make -J 10 ISS_TARGET=MV3")
 '(font-lock-mode t nil (font-lock)))

; compile on F7
(global-set-key [f7] 'compile)
(global-set-key (kbd "C-c f") 'paren-forward-sexp)
(global-set-key (kbd "C-c b") 'paren-backward-sexp)

;; Don't wrap long lines.
(set-default 'truncate-lines t)


;; trim-buffer
(defun trim-buffer ()
  "Eliminate trailing whitespace on each line."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "[ \t][ \t]*$" nil t)
      (delete-region (match-beginning 0) (point)))))

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
			      (interactive)
			      (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
			      (interactive)
			      (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)

  ;; (setq x-select-enable-clipboard t)
  ;; (setq select-enable-clipboard t)
  ;; (setq x-select-enable-primary t)
  ;; (setq select-enable-primary t)
  ;; (setq mouse-yank-at-point t)

  ; TBD: How to paste from general clip board?
  (global-set-key [mouse-2] 'mouse-yank-at-click)

  ) 
