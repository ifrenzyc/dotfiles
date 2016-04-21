;; 设定不产生备份文件
(setq make-backup-files nil)
(setq-default make-backup-files nil)  ; 不生成临时文件

;; 取消自动保存模式
(setq auto-save-mode nil)

(setq backup-by-copying nil)

;; Save a list of recent files visited. (open recent file with C-x f)
(recentf-mode 1)
(setq recentf-max-saved-items 100) ;; just 20 is too recent


(provide 'init-backup)
