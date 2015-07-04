;; ロードパス
(setq load-path (cons "~/Dropbox/emacs/site-lisp" load-path))
(add-to-list 'load-path "~/Dropbox/emacs/site-lisp/yasnippet")

;; 行数表示
(line-number-mode t)

;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;; バックアップファイルを作らない
(setq backup-inhibited t)

;; ビープ音を消す
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; フルスクリーン M-Enter
(defun toggle-fullscreen ()
(interactive)
(set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                          nil
                                         'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen) 


;; ウィンドウ設定
(if window-system (progn
  (setq initial-frame-alist '((width . 110) (height . 40) (top . 50)))
  (set-background-color "Black")
  (set-foreground-color "White")
  (set-cursor-color "Gray")
))

;; ウィンドウを透明化
(add-to-list 'default-frame-alist '(alpha . (0.85 0.85)))

;; シフト + 矢印で範囲選択
1(setq pc-select-selection-keys-only t)
(pc-selection-mode 1)

;; 対応する括弧を光らせる。
(show-paren-mode 1)

;; 編集行のハイライト
(global-hl-line-mode)


;; Emacsで、C-x 3とかした時にも行の折り返しをする設定
(setq truncate-partial-width-windows nil)


;; anything
(require 'anything-config)
(setq anything-sources (list anything-c-source-buffers
                             anything-c-source-bookmarks
                             anything-c-source-recentf
                             anything-c-source-file-name-history
                             anything-c-source-locate))
(define-key anything-map (kbd "C-p") 'anything-previous-line)
(define-key anything-map (kbd "C-n") 'anything-next-line)
(define-key anything-map (kbd "C-v") 'anything-next-source)
(define-key anything-map (kbd "M-v") 'anything-previous-source)
(global-set-key (kbd "C-;") 'anything)

;;zen-coding
(when (require 'zencoding-mode)
  (add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
  (add-hook 'html-mode-hook 'zencoding-mode)
  (add-hook 'text-mode-hook 'zencoding-mode)
  ;;(define-key zencoding-mode-keymap (kbd "<S-return>") 'zencoding-expand-line)
  (define-key zencoding-mode-keymap (kbd "<S-return>") 'zencoding-expand-yas))
  ;;(define-key zencoding-preview-keymap "\C-i" 'zencoding-preview-accept)

;;yasnippet
(when (require 'yasnippet)
;;(require 'anything-c-yasnippet)
;;(setq anything-c-yas-space-match-any-greedy t) ;スペース区切りで絞り込めるようにする デフォルトは nil
;;(global-set-key (kbd "C-c y") 'anything-c-yas-complete) ;C-c yで起動 (同時にお使いのマイナーモードとキーバインドがかぶるかもしれません)
(yas/initialize)
(yas/load-directory "~/Dropbox/emacs/snippets/")) ;snippetsのディレクトリを指定