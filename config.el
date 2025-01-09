;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 20)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 20))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-moonlight)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq show-trailing-whitespace t)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;

(setq projectile-project-search-path '("~/projects"))

                                        ; Move around windows
(map! :nivem "C-h"  #'windmove-left)
(map! :nivem "C-l" #'windmove-right)
(map! :nivem "C-k"   #'windmove-up)
(map! :nivem "C-j"  #'windmove-down)

;; Resize windows
(map! :nivem "C-S-<left>"  #'evil-window-decrease-width)
(map! :nivem "C-S-<right>" #'evil-window-increase-width)
(map! :nivem "C-S-<up>"    #'evil-window-increase-height)
(map! :nivem "C-S-<down>"  #'evil-window-decrease-height)



(map! :nvm "-" 'dired-jump)
(map! :map dired-mode-map
      :nv "." 'dired-create-empty-file )


(map! :after evil :map dired-mode-map
      :nv "u" #'dired-unmark)

;; remap C-d to C-dzz in vim

;; ;; remap C-u to C-uzz in vim

(map! :nv "C-d" (lambda()(interactive) (evil-scroll-down 0) (recenter)))
(map! :nv "C-u" (lambda ()(interactive) (evil-scroll-up 0) (recenter)))

;; Navigate through workspaces
                                        ; previous ws
(map! "C-S-h" #'+workspace/switch-left)
                                        ; next ws
(map! "C-S-l" #'+workspace/switch-right)

;; (when (display-graphic-p)
;;   (require 'all-the-icons))

;; Open the shortcut menu quicker
(setq! which-key-idle-delay 0.3)

;; Selecting text put it in the PRIMARY clipboard
(setq! evil-visual-update-x-selection-p t)


;; Show indicators in the left fringe
(after! flycheck
  (setq! flycheck-indication-mode 'left-fringe))


;; Activate clickable url in vterm
(add-hook! 'vterm-mode-hook
  (goto-address-mode t))

;; Get C-c and ESC key working
(add-hook! 'vterm-mode-hook
  (unless evil-collection-vterm-send-escape-to-vterm-p
    (evil-collection-vterm-toggle-send-escape)))
(map! :after vterm
      :map vterm-mode-map
      :ni "C-c" #'vterm--self-insert)
