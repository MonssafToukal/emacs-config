;;; $DOOMDIR/langs/go.el -*- lexical-binding: t; -*-

(add-to-list 'exec-path (expand-file-name "~/go/bin"))
(setenv "PATH" (concat (getenv "PATH") ":/home/mtoukal/go/bin"))


(after! dape
  ;; Add a new configuration for debugging Go tests.
  ;; We use 'cl-pushnew' to ensure this configuration is only added once,
  ;; even if your configuration is reloaded multiple times, thus adhering
  ;; to good Doom Emacs practice for list customization.
  (cl-pushnew
   ;; Start of the debug adapter definition (PLIST)
   '(go-test
     modes (go-mode go-ts-mode)
     ;; ensure dape-ensure-command
     command "dlv"
     command-args ("dap" "--listen" "127.0.0.1::autoport")
     command-cwd dape-command-cwd
     ;; command-insert-stderr t
     host "127.0.0.1"
     port :autoport
     :request "launch"
     :mode "test"
     :type "go"
     :cwd "."
     :program ".")
   dape-configs :key #'car))

;; used to remove first config from the list
;; (setq dape-configs (remove (car dape-configs) dape-configs))

