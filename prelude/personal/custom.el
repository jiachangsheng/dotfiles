;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("09b833239444ac3230f591e35e3c28a4d78f1556b107bafe0eb32b5977204d93"
     default))
 '(package-selected-packages
   '(ace-window ag anzu browse-kill-ring company consult crux diff-hl
                diminish discover-my-major easy-kill elisp-slime-nav
                epl expand-region flycheck gist git-modes
                git-timemachine guru-mode hl-todo imenu-anywhere
                js2-mode json-mode lsp-ui lua-mode magit move-text
                nlinum operate-on-number orderless projectile
                rainbow-delimiters rainbow-mode smartparens smartrep
                super-save undo-tree vertico volatile-highlights
                web-mode yaml-mode zenburn-theme zop-to-char)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; 设置默认英文字体
(set-face-attribute 'default nil :font "Cascadia Code-11")

;; 设置中文字体
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset (font-spec :family "Microsoft YaHei" :size 12)))

;; 设置编码环境
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
