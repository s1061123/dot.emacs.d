;; Wanderlust email
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)
(setq gnutls-min-prime-bits 1024)
;(require 'elscreen-wl)
(require 'wl-util)
;; to read html mails...
(setq w3m-command "/usr/bin/w3m")
;(require 'mime-w3m)
(require 'cl-lib)
