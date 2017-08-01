(use-package ag
  :ensure t
  :bind (:map itsyc-leader-map
              ("aa" . ag)
              ("ap" . ag-project)))

(provide 'init-ag)
