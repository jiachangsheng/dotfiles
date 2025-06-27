;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;; ~/.doom.d/config.el

;; 设置主字体
;; (setq doom-font (font-spec :family "Fira Code" :size 20))

;; 可变宽字体（如 Org 主要内容用）
;; (setq doom-variable-pitch-font (font-spec :family "Cantarell" :size 20))

;; 大字体，演示用
;; (setq doom-big-font (font-spec :family "Fira Code" :size 30))

;; 符号字体，常用来显示特殊符号
;; (setq doom-symbol-font (font-spec :family "Symbols Nerd Font" :size 20))

;; 衬线字体
;; (setq doom-serif-font (font-spec :family "Georgia" :size 20))

;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(setq confirm-kill-emacs nil)


;; 这行代码是设置 Org Babel 中 sh 类型代码块的默认头参数
;; (setq org-babel-default-header-args:sh '((:results . "output")))
;; 设置 Emacs 内部调用 shell 的默认解释器为 pwsh（即 PowerShell Core）
(setq shell-file-name "pwsh")
;; 设置 Emacs 中 M-x shell 打开的 交互式 shell 会话 使用 pwsh
(setq explicit-shell-file-name "pwsh")

;; (global-set-key (kbd "C-c l") #'org-store-link)
;; (global-set-key (kbd "C-c a") #'org-agenda)
;; (global-set-key (kbd "C-c c") #'org-capture)
<<<<<<< HEAD
=======
 (use-package! go-translate
  :ensure t
  :config
  ;; 简单初始化测试
  (message "go-translate loaded"))

(defun my/gts-do-translate ()
  "手动调用 go-translate 的翻译函数。"
  (interactive)
  (gts-do-translate))

(map! :leader
      :desc "翻译当前单词"
      "t t" #'my/gts-do-translate)
>>>>>>> 07fb5b30ef8c0efb4c7a4232922921fef21c4189
