(use-package expand-region
  :ensure t
  :init
  (pending-delete-mode t)
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package selected
  :ensure t
  :commands selected-minor-mode
  :init
  (setq selected-org-mode-map (make-sparse-keymap))
  :bind (:map selected-keymap
              ("q" . selected-off)
              ("u" . upcase-region)
              ("d" . downcase-region)
              ("w" . count-words-region)
              ("m" . apply-macro-to-region-lines)
              :map selected-org-mode-map
              ("t" . org-table-convert-region)))


(provide 'init-expand-region)
