;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;;Open Doom Emacs in full screen mode
;;the command below has no recognizable effect. I'll leave it in here when I might need it again
;;(toggle-frame-maximized)
;;This command enables the fullscreen on startup
;;(toggle-frame-fullscreen)

(setq-default evil-escape-key-sequence nil)

(map!
:g "C-ö" 'evil-escape
:n "ö" 'evil-ex
:n "TT" 'neotree-toggle
:n "SPC f w" 'evil-avy-goto-char-timer
:n "SPC f r" 'lsp-ui-peek-find-references
:n "SPC g t" 'lsp-ui-peek-find-definitions
 )

(setq evil-vsplit-window-right t
      evil-split-window-below t)

(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-buffer))

(setq +ivy-buffer-preview t)

;;word wrap at the end of window
(global-visual-line-mode t)


(lsp-treemacs-sync-mode 1)


;;Setting the font and its size
(setq doom-font (font-spec :family "Source Code Pro" :size 15)
      doom-variable-pitch-font (font-spec :family "Source Code Pro" :size 15))


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jan Walewski"
      user-mail-address "jan.walewski@hotmail.de")



;; Highlighting setting
;; !!! Farben können per Hexadezimalcode angegeben werden oder mit Farbennamen
;; Für Farbennamen den Befehl 'read-color' ausführen

(setq org-emphasis-alist
      '(("=" (bold :foreground "dark red"))
        ("+" (:strike-through nil :foreground "dark orange"))
        )
      )

(setq org-hide-emphasis-markers t)


;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
