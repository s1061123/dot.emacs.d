;; .emacs
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; el-get
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;;
(setq el-get-user-package-directory (locate-user-emacs-file "config"))

;; add packages with el-get
(el-get-bundle init-loader)
(el-get-bundle howm)
(el-get-bundle elscreen)
(el-get-bundle ddskk)
(el-get-bundle wanderlust)
(el-get-bundle exec-path-from-shell)

;;
(setenv "LANG" "ja_JP.UTF-8")

;; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load "~/.emacs.d/init")

(setq ps-multibyte-buffer 'non-latin-printer)
(require 'ps-mule)
(defalias 'ps-mule-header-string-charsets 'ignore)

(menu-bar-mode 0)
(tool-bar-mode 0)
(setq visible-bell 't)
(setq display-time-24hr-format 't)
(display-time-mode)
(prefer-coding-system 'utf-8-unix)
;(set-language-environment "Japanese")           ; 日本語環境設定
;(setq x-super-keysym 'meta)

(let ((default-directory (expand-file-name "~/.emacs.d/lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(let ((default-directory (expand-file-name "~/usr/share/emacs/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))


;;実際に横幅が 1:2 になるのは、12pt, 13.5pt, 15pt など、1.5の倍数なので、
;;それに合わせるのがおすすめ。
(add-to-list 'default-frame-alist '(font . "ricty-13.5"))
;; move it somewhere... (TODO)
;(set-fontset-font nil 'japanese-jisx0208 (font-spec :family "ricty"))

;; for lookup
(define-key ctl-x-map "l" 'lookup)
(define-key ctl-x-map "y" 'lookup-region)
(define-key ctl-x-map "\C-y" 'lookup-pattern)
(global-set-key "\C-cw" 'lookup-pattern)

;;
(load "lookup-autoloads")
(setq lookup-search-agents
      '(
	(ndeb "~/dic" :coding sjis-dos :alias "dics")
;;	(ndeb "c:/tom/dic/dic/eijiro" :coding sjis-dos :alias "dics")
;;	(ndeb "c:/tom/dic/dic/waeijiro" :coding sjis-dos :alias "dics")
	(ndspell)
	))

(server-start)
