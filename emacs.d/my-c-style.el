(require 'cc-mode)
(setq orig-c-style-alist c-style-alist)
(c-add-style "jack"
	     '(
	       (c-basic-offset . 4)
	       (c-comment-only-line-offset . 0)
	       (c-hanging-braces-alist . ((defun-open after)
					  (defun-close before after)
					  (class-open after)
					  (class-close before after)
					  (namespace-open after)
					  (inline-open after)
					  (inline-close before after)
					  (block-open after)
					  (block-close . c-snug-do-while)
					  (extern-lang-open after)
					  (extern-lang-close after)
					  (statement-case-open after)
					  (substatement-open after)))
	       (c-cleanup-list . (brace-else-brace
				  brace-elseif-brace
				  brace-catch-brace
;;;				  empty-defun-braces
				  defun-close-semi
				  list-close-comma
				  scope-operator))
	       (c-offsets-alist
		. (
		   ;; first line of a new statement block
		   (statement-block-intro . +)

		   ;; First line of a K&R C argument declaration.
		   (knr-argdecl-intro . +)

		   ;; The brace that opens a substatement block.
		   (substatement-open . 0)

		   ;; Any non-special C label.
		   (label . 2)

		   ;; A `case' or `default' label.
		   (case-label . 0)

		   ;; The first line in a case block that starts with
		   ;; a brace.
		   (statement-case-open . +)

		   ;; A continuation of a statement.
		   (statement-cont . +)

		   ;; The first line after a conditional or loop
		   ;; construct.
		   (substatement . +)

		   ;; The first line in an argument list.
		   (arglist-intro . c-lineup-arglist-intro-after-paren)

		   ;; The solo close paren of an argument list.
		   (arglist-close . c-lineup-arglist)

		   ;; Brace that opens an in-class inline method.
		   (inline-open . 0)

		   ;; Open brace of an enum or static array list.
		   (brace-list-open . 0)))

	       (c-special-indent-hook . c-gnu-impose-minimum)
	       (c-block-comment-prefix . "")))

(defun my-c-default-style ()
  (c-toggle-auto-hungry-state 1)
  (interactive)
  (define-key c-mode-map "\r" 'newline-and-indent)
  (setq indent-tabs-mode nil)
  (c-set-style "jack"))

(add-hook 'c-mode-common-hook 'my-c-default-style)
(setq auto-mode-alist
      (append '(("\\.odl$"    . c-mode)
		("\\.dd$"     . c-mode)
		("\\.errmsg$" . c-mode))
	      auto-mode-alist))

;;; Emulate vi's ":set list" command.  Setting is buffer-local and
;;; won't screw up the rest of the editor session.  This probably
;;; should be a minor mode instead of two global functions.  Consider
;;; using the whitespace.el or show-whitespace-mode.el packages.

(defvar vi-list-display-table (make-display-table)
  "vi-list display table for showing tabs and EOLs")
(aset vi-list-display-table ?\t (vconcat "^I"))
(aset vi-list-display-table ?\n (vconcat "$\n"))

(defun vi-list ()
  "Simulate a :set list in Vi."
  (interactive)
  (setq buffer-display-table vi-list-display-table))

(defun vi-nolist ()
  "Simulate a :set nolist in Vi."
  (interactive)
  (setq buffer-display-table nil))

