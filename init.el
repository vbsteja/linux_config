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
 '(custom-enabled-themes (quote (adwaita)))
 '(custom-safe-themes
   (quote
    ("c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "1a5c1be3b14ee44e9cd926c4fe23055bc74bbc9725b01ebee78a1d1cb2b266f4" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" default)))
 '(fci-rule-color "#ECEFF1")
 '(hl-sexp-background-color "#efebe9")
 '(linum-format " %5i ")
 '(package-selected-packages
   (quote
    (ghc haskell-mode jedi company-lua sublime-themes smex slime-company powerline paredit neotree multiple-cursors material-theme magit git-commit expand-region elisp-slime-nav company-quickhelp async popup-complete company-jedi use-package parinfer slime-theme slim-mode common-lisp-snippets slime company-anaconda ac-anaconda anaconda-mode 2048-game ## ac-html ac-cider ac-geiser auto-complete cider clojure-mode elpy julia-shell julia-repl julia-mode chapel-mode elixir-mode geiser racket-mode python-mode)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#B71C1C")
     (40 . "#FF5722")
     (60 . "#FFA000")
     (80 . "#558b2f")
     (100 . "#00796b")
     (120 . "#2196f3")
     (140 . "#4527A0")
     (160 . "#B71C1C")
     (180 . "#FF5722")
     (200 . "#FFA000")
     (220 . "#558b2f")
     (240 . "#00796b")
     (260 . "#2196f3")
     (280 . "#4527A0")
     (300 . "#B71C1C")
     (320 . "#FF5722")
     (340 . "#FFA000")
     (360 . "#558b2f"))))
 '(vc-annotate-very-old-color nil))
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
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(eval-after-load "company"
 '(add-to-list 'company-backends 'company-anaconda))
(pyenv-mode)
;; … .  You can change
;; your default interpreter and commandline arguments by setting the
;; python-shell-interpreter' andpython-shell-interpreter-args'
;; variables.  This example enables IPython globally:
 (setq python-shell-interpreter "/home/surya/DL/bin/python"
       python-shell-interpreter-args "-i")
(add-hook 'inferior-haskell-mode-hook 'turn-on-ghci-completion)
