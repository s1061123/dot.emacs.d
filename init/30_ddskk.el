;; skk
(when (require 'skk nil t)
  (global-set-key (kbd "C-x C-j") 'skk-mode)
  (setq default-input-method "japanese-skk")
  (setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")
  (require 'skk-study))                              ;;変換学習機能の追加
