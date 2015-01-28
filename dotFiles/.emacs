(global-auto-revert-mode 1)
(setq auto-revert-check-vc-info t)

(add-to-list 'load-path "/home/nick/systemConfig/emacsConfig/")

(add-to-list 'default-frame-alist '(foreground-color . "#aaaaaa"))
(add-to-list 'default-frame-alist '(background-color . "#222222"))

(set-face-attribute 'default nil :height 100)

(setq mouse-avoidance-mode 'banish)

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq visible-cursor 1)
(setq blink-cursor-mode 1)

(show-paren-mode 1)

(setq column-number-mode t)

(setq tetris-score-file "~/Dropbox/Emacs/tetris-scores")
(setq snake-score-file "~/Dropbox/Emacs/snake-scores")

(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacsBkups"))
      delete-old-versions t
      kept-new-versions 5
      kept-old-versions 2
      version-control t)

(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "<f6>") 'recompile)
(global-set-key (kbd "<f7>") 'kill-compilation)
(global-set-key (kbd "<f8>") 'TeX-command-master)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq shell-file-name "bash")
(setq shell-command-switch "-ic")
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(if (locate-library '"package.el")
    (progn
      (require 'package)
      (add-to-list 'package-archives
		   '("melpa" . "http://melpa.org/packages/") t)
      (message "Loading package.el"))
  (message "Cannot locate package.el")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library '"auctex.el")
    (progn
      (load "auctex.el" nil t t)

      (setq LaTeX-item-indent 0)

      (setq LaTeX-break-at-separators '(\\\( \\\) \\\[ \\\] \\\{
      \\\} "$"))

      (setq LaTeX-command-style '(("" "%(PDF)%(latex)
      -file-line-error %S%(PDFout)")))

      (setq reftex-file-extensions
	    '(("Snw" "Rnw" "nw" "tex" ".tex" ".ltx") ("bib" ".bib")))
      (setq TeX-file-extensions
	    '("Snw" "Rnw" "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo"))

      (setq TeX-auto-save t)
      (setq TeX-parse-self t)
      (setq TeX-PDF-mode t)

      ;; okular viewer
      (setq TeX-view-program-list '(("Okular" "okular --unique
      %o#src:%n%b")))
      (setq TeX-view-program-selection '((output-pdf "Okular")))
      (message "Loading auctex.el"))
  (message "Cannot locate auctex.el")
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library "preview-latex.el")
    (progn
      (load "preview-latex.el" nil t t)
      (message "Loading preview-latex.el"))
  (message "Cannot locate preview-latex.el")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library "color-theme.el")
    (progn
      (require 'color-theme)
      (color-theme-initialize)
      (message "Loading color-theme.el"))
  (message "Cannot locate color-theme.el")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library "yaml-mode.el")
    (progn
      (require 'yaml-mode)
      (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
      (add-to-list 'auto-mode-alist '("\\.Rnw\\'" . Rnw-mode))
      (add-to-list 'auto-mode-alist '("\\.Snw\\'" . Rnw-mode))
      (message "Loading yaml-mode.el"))
  (message "Cannot locate yaml-mode.el")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library "ess-site")
    (progn    
      (require 'ess-site)
      (ess-toggle-underscore nil)
      (setq comint-scroll-to-bottom-on-input t)
      (setq comint-scroll-to-bottom-on-output t)
      (setq ess-swv-toggle-plug-into-AUXTeX t)
      (setq inferior-julia-program-name "/usr/bin/julia")
      (message "Loading ess-site.el")
      )
  (message "Cannot locate ess-site.el")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library "whitespace.el")
    (progn      
      (require 'whitespace)
      (setq whitespace-style '(lines face))
      (setq whitespace-line-column 80)
      (message "Loading whitespace.el"))
  (message "Cannot locate whitespace.el")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library "julia-mode.el")
    (progn
      (setq inferior-julia-program-name "/bin/julia")
      (message "Loading julia-mode.el"))
  (message "Cannot locate julia-mode.el")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(c-set-offset (quote cpp-macro) 0 nil)
(c-set-offset 'access-label '/)


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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(if (locate-library "make-mode.el")
    (progn
      (require 'make-mode)
      (add-to-list 'auto-mode-alist '("\\.mk\\'" . makefile-gmake-mode))
      (message "Loading make-mode.el")
      )
  (message "Cannot locate make-mode.el")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library "web-mode.el")
    (progn
      (require 'web-mode)
      (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
      )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library "lua-mode.el")
    (progn
      (require 'lua-mode)
      (add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-mode))
      (message "Loading lua-mode.el")
      )
  (message "Cannot locate lua-mode.el")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library "markdown-mode.el")
    (progn
      (require 'markdown-mode)
      ;; (autoload 'markdown-mode "markdown-mode"
      ;;    "Major mode for editing Markdown files" t)
      (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
      (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
      (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
      (message "Loading markdown-mode.el")
      )
  (message "Cannot locate markdown-mode.el")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library "magit.el")
    (progn
      (require 'magit)
      (message "Loading magit.el")
      )
  (message "Cannot locate magit.el")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (locate-library '"org.el")
    (progn
      (require 'org)
      (define-key global-map "\C-cl" 'org-store-link)
      (define-key global-map "\C-ca" 'org-agenda)
      (setq org-log-done t)
      (setq org-src-fontify-natively t)
      (setq org-confirm-babel-evaluate nil)
      (setq org-export-html-postamble nil)
      (org-babel-do-load-languages
       'org-babel-load-languages
       '((R . t)
	 (python . t)
	 (julia . t)
	 ))
       (message "Loading org.el")
       )
  (message "Cannot locate org.el")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; this stuff is automatically added by changing preferences in emacs
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(eshell-prompt ((t (:foreground "color-40" :weight normal))))
;;  '(font-latex-math-face ((t (:foreground "color-148"))))
;;  '(font-lock-comment-face ((t (:foreground "color-160"))))
;;  '(font-lock-constant-face ((t (:foreground "color-226"))))
;;  '(font-lock-function-name-face ((t (:foreground "color-202"))))
;;  '(font-lock-keyword-face ((t (:foreground "color-90"))))
;;  '(font-lock-preprocessor-face ((t (:foreground "color-51"))))
;;  '(font-lock-string-face ((t (:foreground "color-212"))))
;;  '(font-lock-type-face ((t (:foreground "color-34"))))
;;  '(font-lock-variable-name-face ((t (:foreground "color-27"))))
;;  '(minibuffer-prompt ((t (:foreground "color-166"))))
;;  '(region ((t (:background "black" :inverse-video t))))
;;  '(web-mode-html-attr-name-face ((t (:foreground "color-21"))))
;;  '(web-mode-html-tag-bracket-face ((t (:foreground "color-22"))))
;;  '(web-mode-html-tag-face ((t (:foreground "color-22")))))
;; (put 'narrow-to-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-listing-switches "-l -h --group-directories-first -X"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "red"))))
 '(font-lock-constant-face ((t (:foreground "cyan1"))))
 '(font-lock-function-name-face ((t (:foreground "royal blue"))))
 '(font-lock-keyword-face ((t (:foreground "goldenrod"))))
 '(font-lock-preprocessor-face ((t (:inherit font-lock-builtin-face :foreground "magenta"))))
 '(font-lock-string-face ((t (:foreground "DarkOrange1"))))
 '(font-lock-type-face ((t (:foreground "lime green"))))
 '(font-lock-variable-name-face ((t (:foreground "deep pink"))))
 '(minibuffer-prompt ((t (:foreground "DarkGoldenrod1")))))


