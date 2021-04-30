;; elscreen
;;; プレフィクスキーはC-z
(require 'elscreen)
(setq elscreen-prefix-key (kbd "C-]"))
(setq elscreen-display-tab nil)
;;; タブの先頭に[X]を表示しない
(setq elscreen-tab-display-kill-screen nil)
;;; header-lineの先頭に[<->]を表示しない
(setq elscreen-tab-display-control nil)
(elscreen-start)
