;; frame font
;; Setting English Font
(if (member "Monaco" (font-family-list))
    (set-face-attribute
     'default nil :font "Monaco 13"))


(provide 'init-font)
