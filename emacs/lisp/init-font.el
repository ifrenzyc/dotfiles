;; frame font
;; Setting English Font
;; (if (member "Monaco" (font-family-list))
;;    (set-face-attribute
;;     'default nil :font "Monaco 13"))
(if (member "Source Code Pro" (font-family-list))
    (set-face-attribute
     'default nil :font "Source Code Pro 14"))


(provide 'init-font)
