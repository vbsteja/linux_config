(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(package-initialize) ;; You might already have this line
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes nil)
 '(package-selected-packages
   (quote
    (company-lua sublime-themes smex slime-company powerline paredit neotree multiple-cursors material-theme magit git-commit expand-region elisp-slime-nav company-quickhelp async popup-complete company-jedi use-package parinfer slime-theme slim-mode common-lisp-snippets slime company-anaconda ac-anaconda anaconda-mode 2048-game ## ac-html ac-cider ac-geiser auto-complete cider clojure-mode elpy julia-shell julia-repl julia-mode chapel-mode elixir-mode geiser racket-mode python-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;(setq inferior-lisp-program "sbcl")
 (show-paren-mode t)
;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

;; Predefine bare minimum path functions
;(setq portacle-root (or (getenv "ROOT") (expand-file-name "~/")))
;(defun portacle-path (path)
;  (concat portacle-root path))

;; Set up necessary paths
;(add-to-list 'load-path (portacle-path ".emacs.d/portacle/"))
;(cd portacle-root)

;; Load main library
;(if (locate-library "portacle")
 ;   (load-library "portacle")
  ;  (display-warning :warning "Basic Portacle scripts are not present."))

(add-to-list 'load-path "~/.emacs.d/slime/")
(require 'slime)
(slime-setup '(slime-repl))
(setq inferior-lisp-program "sbcl") 

;smex autostart
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                    ; when Smex is auto-initialized on its first run.
                    
                     (global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(slime-setup '(slime-fancy slime-company))

(define-key company-active-map (kbd "<up>") 'company-select-previous)
(define-key company-active-map (kbd "<down>") 'company-select-next)
(define-key company-active-map (kbd "\C-n") 'company-select-next)
(define-key company-active-map (kbd "\C-p") 'company-select-previous)
(define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
(define-key company-active-map (kbd "M-.") 'company-show-location)


(require 'company)

(company-quickhelp-mode 1)
(setq company-quickhelp-delay 0.7)

(global-company-mode)
