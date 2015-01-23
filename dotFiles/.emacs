(add-to-list 'load-path "/home/nick/Dropbox/Emacs/modes/")

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


(setq eshell-prompt-function
      (lambda()
	(concat
	 (propertize (system-name) 'face `(:foreground "green"))
	 (propertize " @ " 'face `(:foreground "gray"))
	 (propertize (replace-regexp-in-string "^.*/" "" (eshell/pwd))
		     'face `(:foreground "blue"))
	 (propertize " $ " `face `(:foreground "gray"))
	 )))
(defun eshell-maybe-bol ()
  (interactive)
  (let ((p (point)))
    (eshell-bol)
    (if (= p (point))
	(beginning-of-line))))
(add-hook 'eshell-mode-hook
	  '(lambda () (define-key eshell-mode-map "\C-a" 'eshell-maybe-bol)))

(global-set-key (kbd "\C-c l") 'erase-buffer)

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(setq visible-cursor 1)
(setq blink-cursor-mode 1)

(setq column-number-mode t)

(require 'color-theme)
(color-theme-initialize)

(setq shell-file-name "bash")
;; (setq shell-command-switch "-ic")


(setq tetris-score-file "~/Dropbox/Emacs/tetris-scores")
(setq snake-score-file "~/Dropbox/Emacs/snake-scores")

(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacsBkups"))
      delete-old-versions t
      kept-new-versions 5
      kept-old-versions 2
      version-control t)


(setq-default fill-column 80)

(setq LaTeX-item-indent 0)

(setq LaTeX-break-at-separators '(\\\( \\\) \\\[ \\\] \\\{ \\\} "$"))

(setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)")))

;; (require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw\\'" . Rnw-mode))
(add-to-list 'auto-mode-alist '("\\.Snw\\'" . Rnw-mode))
(setq reftex-file-extensions
      '(("Snw" "Rnw" "nw" "tex" ".tex" ".ltx") ("bib" ".bib")))
(setq TeX-file-extensions
      '("Snw" "Rnw" "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo"))

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-PDF-mode t)


(require 'ess-site)
(ess-toggle-underscore nil)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq ess-swv-toggle-plug-into-AUXTeX t)

(require 'whitespace)
(setq whitespace-style '(lines face))
(setq whitespace-line-column 80)


(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "<f6>") 'recompile)
(global-set-key (kbd "<f7>") 'kill-compilation)
(global-set-key (kbd "<f8>") 'TeX-command-master)

(add-hook 'c-mode-hook 'whitespace-mode)
(add-hook 'c++-mode-hook 'whitespace-mode)
(add-hook 'python-mode-hook 'whitespace-mode)
(add-hook 'LaTeX-mode-hook '(lambda ()
			      (auto-fill-mode 1)))
(add-hook 'markdown-mode-hook '(lambda ()
				 (auto-fill-mode 1)))
(add-hook 'LaTeX-mode-hook '(lambda ()
			      (setq auto-fill-function
				    'LaTeX-fill-paragraph)))

(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cuh\\'" . c++-mode))

(require 'make-mode)
(add-to-list 'auto-mode-alist '("\\.mk\\'" . makefile-gmake-mode))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(require 'lua-mode)
(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-mode))

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;(c-set-offset (quote cpp-macro) 0 nil)
(c-set-offset 'access-label '/)

;; SyncTeX
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method 'synctex)
;;(setq TeX-source-correlate-start-server t)
(load "server")
(unless (server-running-p) (server-start))
'(LaTeX-command "latex -synctex=1")


;; okular viewer
(setq TeX-view-program-list '(("Okular" "okular --unique %o#src:%n%b")))
(setq TeX-view-program-selection '((output-pdf "Okular")))


;; (add-to-list 'default-frame-alist '(foreground-color . "#EODFDB"))
;; (add-to-list 'default-frame-alist '(background-color . "#102372"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; this stuff is automatically added by changing preferences in emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-prompt ((t (:foreground "color-40" :weight normal))))
 '(font-latex-math-face ((t (:foreground "color-148"))))
 '(font-lock-comment-face ((t (:foreground "color-160"))))
 '(font-lock-constant-face ((t (:foreground "color-226"))))
 '(font-lock-function-name-face ((t (:foreground "color-202"))))
 '(font-lock-keyword-face ((t (:foreground "color-90"))))
 '(font-lock-preprocessor-face ((t (:foreground "color-51"))))
 '(font-lock-string-face ((t (:foreground "color-212"))))
 '(font-lock-type-face ((t (:foreground "color-34"))))
 '(font-lock-variable-name-face ((t (:foreground "color-27"))))
 '(minibuffer-prompt ((t (:foreground "color-166"))))
 '(region ((t (:background "black" :inverse-video t))))
 '(web-mode-html-attr-name-face ((t (:foreground "color-21"))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "color-22"))))
 '(web-mode-html-tag-face ((t (:foreground "color-22")))))
(put 'narrow-to-region 'disabled nil)
