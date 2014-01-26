;;; .emacs

;;; common code.
(setq load-path (cons "~/.emacs.d" load-path))
(setq initial-major-mode 'emacs-lisp-mode)
(add-to-list 'auto-mode-alist '("\\.el\\'" . emacs-lisp-mode))
(show-paren-mode t)
(setq show-paren-style 'parentheses)

(setq user-full-name "Jiang Kai") 
(setq user-mail-address "airborne08@gmail.com")

(load "my-c-style.el")

;;; doxymacs.
;; sudo apt-get install doxymacs
;; - Default key bindings are:
;;   - C-c d ? will look up documentation for the symbol under the point.
;;   - C-c d r will rescan your Doxygen tags file.
;;   - C-c d f will insert a Doxygen comment for the next function.
;;   - C-c d i will insert a Doxygen comment for the current file.
;;   - C-c d ; will insert a Doxygen comment for the current member.
;;   - C-c d m will insert a blank multiline Doxygen comment.
;;   - C-c d s will insert a blank singleline Doxygen comment.
;;   - C-c d @ will insert grouping comments around the current region.
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
(add-hook 'python-mode-hook 'doxymacs-mode)
(add-hook 'java-mode-hook 'doxymacs-mode)
(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) 
	  (eq major-mode 'c++-mode)
	  (eq major-mode 'python-mode)
	  (eq major-mode 'java-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

;;; auto-complete.
;; sudo apt-get install auto-complete-el
;; http://cx4a.org/software/auto-complete/manual.html
(setq load-path (cons "~/.emacs.d/auto-complete-1.3.1" load-path))
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(global-auto-complete-mode 1)

(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp")
(require 'org-install)
(require 'org-publish)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook
          (lambda () (progn
                 (setq truncate-lines nil)
                 (local-unset-key (kbd "<M-up>"))
                 (local-unset-key (kbd "<M-down>"))
                 (local-unset-key (kbd "<M-left>"))
                 (local-unset-key (kbd "<M-right>")))))

(setq org-log-done t)

;; http://orgmode.org/manual/Publishing-options.html
(setq org-export-have-math nil)
(setq org-use-sub-superscripts (quote {}))
(setq org-export-author-info nil)
(setq org-html-preamble nil)
(setq org-html-postamble nil)
;; (setq org-export-html-style-include-default nil)
(setq org-export-html-style-include-scripts nil)
(setq org-export-htmlize-output-type 'css)
(setq org-publish-project-alist
      '(("orgfiles"
	 :base-directory "~/org/"
	 :base-extension "org"
	 :publishing-directory "~/publish_html"
	 :publishing-function org-html-publish-to-html
	 :recursive t
	 :exclude "PrivatePage.org"   ;; regexp
	 :headline-levels 3
;;;	 :section-numbers nil
;;;	 :with-toc nil
	 :html-head "<link rel=\"stylesheet\"
                       href=\"./css/site.css\" type=\"text/css\"/>"
	 :html-preamble t)
	
	("images"
	 :base-directory "~/org"
	 :base-extension "jpg\\|gif\\|png"
	 :recursive t
	 :publishing-directory "~/publish_html/"
	 :publishing-function org-publish-attachment)
	
	("css"
	 :base-directory "~/org"
	 :base-extension "css"
	 :recursive t
	 :publishing-directory "~/publish_html/"
	 :publishing-function org-publish-attachment)
	("website" :components ("orgfiles" "images" "css"))))

;; auto indent
;;(setq org-startup-indented t)
(global-set-key "\C-coi" 'org-indent-mode) ;; toggle indent mode.
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)
(global-set-key "\C-cii" 'iimage-mode) ;; toggle image mode.

(setq ac-modes
      (append ac-modes '(org-mode 
                         objc-mode 
                         sql-mode
                         c++-mode
                         java-mode
                         python-mode
                         change-log-mode 
                         text-mode
                         makefile-mode
                         autoconf-mode)))
(setq org-export-have-math nil)
(setq org-use-sub-superscripts (quote {}))
(setq org-export-author-info nil)
(setq org-html-preamble nil)
(setq org-html-postamble nil)
;; (setq org-export-html-style-include-default nil)
(setq org-export-html-style-include-scripts nil)
(setq org-export-htmlize-output-type 'css)

;; ;;; python-mode.
;; ;; sudo apt-get install python-mode
 ;(setq load-path (cons "~/.emacs.d/python-mode.el-6.0.11" load-path))
(require 'python-mode)

;;; php-mode
;; sudo apt-get install php-elisp
(require 'php-mode)

;;; ido.
(setq load-path (cons "~/.emacs.d/ido" load-path))
(require 'ido)
(ido-mode t)

;;; cscope.
;; sudo apt-get install cscope-el
(require 'xcscope)
;; C-c s a //设定初始化的目录，一般是你代码的根目录
;; C-s s I //对目录中的相关文件建立列表并进行索引
;; C-c s s //序找符号
;; C-c s g //寻找全局的定义
;; C-c s c //看看指定函数被哪些函数所调用
;; C-c s C //看看指定函数调用了哪些函数
;; C-c s e //寻找正则表达式
;; C-c s f //寻找文件
;; C-c s i //看看指定的文件被哪些文件include
;; C-c s u //回到上一个跳转点(pop up mark)
;; C-c s p //回到上一个symbol
;; C-c s P //回到上一个文件
;; C-c s n //下一个symbol
;; C-c s N //下一个文件
(setq cscope-do-not-update-database t) ;; don't need to update database
;; cscope仅仅对于C/C++文件有用,对于其他文件的话可以使用etags
;; etags FILES这样会索引FILES生成TAGS文件
;; M-x visit-tags-table //提示载入TAGS文件
;; M-. //查找相应函数定义
;; C-u M-. //如果错误的话,那么查找下一个
;; M-* //返回之前的位置

(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; markdown-mode.
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;; encoding.
(set-language-environment "UTF-8")
(setq current-language-environment "UTF-8")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(load "my-key-bindings.el")
(load "my-base-config.el")

(defun add-code-review-note ()
  "Add note for current file and line number"
  (interactive)
  (let ((file-name (buffer-file-name))
	(file-line (line-number-at-pos)))
    (switch-to-buffer-other-window (get-buffer-create "NOTES"))
    (goto-char (point-min))
    (when (not (search-forward "-*- mode:compilation-shell-minor"
			       nil t))
      (compilation-shell-minor-mode 1)
      (insert "-*- mode:compilation-shell-minor -*-\n\n"))
    (goto-char (point-max))
    (if (/= (current-column) 0)
	(newline))
    (insert file-name ":" (number-to-string file-line) ": ")))
(global-set-key "\C-cr" 'add-code-review-note)
