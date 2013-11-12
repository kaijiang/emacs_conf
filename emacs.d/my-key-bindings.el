;;统一设置键帮定，并尽量放在配置文件的最后，以免被绑定的键不小心被后面的配置文件覆盖
;;常用习惯，F1打开帮助，常用帮助有info和woman（就是在emacs中看man）
(global-set-key [f12] 'set-mark-command)
;(global-set-key [f1] 'info)
;;恢复，常用键
;(global-set-key [f2] 'undo)
;;反恢复，不是很常用，但是绑定了还是方便些
;(global-set-key [f3] 'redo)
;;F4,kill键，习惯设置，关闭当前buffer
;(global-set-key [f4] 'kill-this-buffer)
;;打开一个终端，根据你的爱好可以绑定为：eshell,shell,terminal-emulator
;(global-set-key [f5] 'term)
;(global-set-key [(f5)] 'speedbar)
;;文件管理器，常用
;(global-set-key [f6] 'dired-jump)
;;同clear相识，具体功能在hvj-functions.el讲过
;(global-set-key [f7] 'hvj-line-to-top-of-window)
;;本人正在学scheme，常用
;(global-set-key [f8] 'run-scheme)
;;看新闻组，常用的很，不过更多时间现在sir里
;(global-set-key [f9] 'gnus)
;;习惯设置，打开／关闭菜单
(global-set-key [f10] 'menu-bar-mode)
;;编译等，暂时还不常用
;(global-set-key [f11] 'compile)
;(global-set-key [f12] 'gdb)

;;习惯设置，Home键设定光标到文件开头
;(global-set-key [(home)] 'beginning-of-buffer)
;;习惯设置，End键设定光标到文件结尾
;(global-set-key [(end)] 'end-of-buffer)

;;meta在常用PC键上就是Alt键
;;这三个绑定主要是光标移动的
(global-set-key [(meta g)] 'goto-line)
(global-set-key [(meta left)] 'backward-sexp)
(global-set-key [(meta right)] 'forward-sexp)

;;用Emacs时常用多个窗口，窗口之间的移动很常见
;;默认的绑定感觉不对劲，换了
(global-set-key [(control o)] 'other-window)
;;这就是我的切换buffer的设置，同windows操作相识
;;没法，windows用了两年多，有些习惯还真不好改
;;不过emacs的配置就是好配，随你配
;(global-set-key [(control tab)] 'tabbar-forward)
;;这个设置是改变outline的快捷键前缀
;;outline主要用于编程等，目前用的不多
;(setq outline-minor-mode-prefix [(control o)])

;;默认的Ctrl-z是什么来着，关闭emacs吧，好像还是强行关闭，不好，用C-x c就好了
;;我就将Ctrl-z作为我的键的绑定
;(define-prefix-command 'ctl-z-map)
;(global-set-key (kbd "C-q") 'ctl-z-map)
;;编译当前emacs-lisp源码为elc
;(global-set-key (kbd "C-z b") 'emacs-lisp-byte-compile)
;;打开我得日历
;(global-set-key (kbd "C-z c") 'calendar)
;;字典功能，就是查单词
;(global-set-key (kbd "C-z d d") 'dictionary-lookup-definition)
;;与上面类似
;(global-set-key (kbd "C-z d s") 'dictionary-search)
;;查询当前单词的匹配的单词，用于补全单词
;(global-set-key (kbd "C-z d m") 'dictionary-match-words)
;;字典提示模式，同字典的自动取词功能相似
;(global-set-key (kbd "C-z d t") 'dictionary-tooltip-mode)
;;启动我的IRC客户端，到sir去
;(global-set-key (kbd "C-z e s") 'erc-irc)
;;到fans聊天去
;(global-set-key (kbd "C-z e f") 'erc-fans)
;;启动拼写检查模式，只检查打开后输入的单词
;(global-set-key (kbd "C-z f m") 'flyspell-mode)
;;对整个buffer进行拼写检查
;(global-set-key (kbd "C-z f b") 'flyspell-buffer)
;;打开gnus
;(global-set-key (kbd "C-z g") 'gnus)
;;数数本文件有多少文字
;(global-set-key (kbd "C-z h c") 'hvj-count-words-region)
;;同Clear键
;(global-set-key (kbd "C-z h l") 'hvj-line-to-top-of-window)
;;拼写检查
;(global-set-key (kbd "C-z i") 'ispell-minor-mode)
;;debug
;(global-set-key (kbd "C-z j") 'jdb)
;;查看前面删除的内容记录
;(global-set-key (kbd "C-z k") 'browse-kill-ring)
;;打印当前buffer
;(global-set-key (kbd "C-z l") 'lpr-buffer)
;;启动我得maxima，漂亮模式
;(global-set-key (kbd "C-z m") 'imaxima)
;;绑定两个narrow功能
;(global-set-key (kbd "C-z n n") 'narrow-to-region)
;(global-set-key (kbd "C-z n w") 'widen)
;(global-set-key (kbd "C-z o") 'occur)
;;几个小游戏
;(global-set-key (kbd "C-z p g") 'gomoku)
;(global-set-key (kbd "C-z p t") 'tetris)
;;由于在html-helper-mode模式中F4键失效，用这个绑定来关闭buffer
;(global-set-key (kbd "C-z q") 'kill-this-buffer)
;;带正则表达式的搜索
;(global-set-key (kbd "C-z r") 'query-replace-regexp)
;;我得scheme也是可以在emacs中运行的
;(global-set-key (kbd "C-z s") 'run-scheme)
;;我的终端
;(global-set-key (kbd "C-z t") 'term)
;;可以在emacs编辑文件使用vim习惯，常用的是vi-mode和viper-mode
;(global-set-key (kbd "C-z v") 'vi-mode)
;;我的文件管理器
;(global-set-key (kbd "C-z u d") 'dired-jump)
;(global-set-key (kbd "C-z u f") 'folding-mode)
;(global-set-key (kbd "C-z u o") 'outline-minor-mode)
;;查询service，见hvj-other-elisp
;(global-set-key (kbd "C-z u s") 'services-look-up)
;;wiki中的绑定设置，还用的不多
;(global-set-key (kbd "C-z w c") 'emacs-wiki-change-project)
;(global-set-key (kbd "C-z w f") 'emacs-wiki-find-file)
;(global-set-key (kbd "C-z w h") 'emacs-wiki-preview-html)
;(global-set-key (kbd "C-z w i") 'emacs-wiki-index)
;(global-set-key (kbd "C-z w p") 'emacs-wiki-publish)
;(global-set-key (kbd "C-z w s") 'emacs-wiki-search)
;;;我的浏览器
;(global-set-key (kbd "C-z w w") 'w3m)
;;同C-z b有点不同，在编译后并加载
;(global-set-key (kbd "C-z x") 'emacs-lisp-byte-compile-and-load)
;;同yank有点不一样，但具体怎样忘了，感觉这个比yank好点
;(global-set-key (kbd "C-z y") 'clipboard-yank)
;;修改后的设定mark的绑定，由于经常忘了放住control键，就给这个功能两个绑定了
(global-set-key (kbd "C-q") 'set-mark-command)
;(global-set-key (kbd "C-x r") 'redo)
;(global-set-key (kbd "C-z C-z") 'set-mark-command)

;;there are severl other key-map below in other files
;;ctrl-f-folding-mode-prefix
;;ido key-map
;;severl self define functions related key-bindings. 
