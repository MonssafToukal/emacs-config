;;; $DOOMDIR/langs/go.el -*- lexical-binding: t; -*-

(add-to-list 'exec-path (expand-file-name "~/go/bin"))

(after! dape
  ;; Add a new configuration for debugging Go tests.
  ;; We use 'cl-pushnew' to ensure this configuration is only added once,
  ;; even if your configuration is reloaded multiple times, thus adhering
  ;; to good Doom Emacs practice for list customization.
  (cl-pushnew
   ;; Start of the debug adapter definition (PLIST)
   '(go-test ; A unique, descriptive name for the adapter
    :modes '(go-mode go-ts-mode) ; Activate this configuration in Go buffers

    ;; Command and execution details for the Delve DAP Server
    :ensure dape-ensure-command ; Check if 'dlv' is available on the system
    :command "/home/mtoukal/go/bin/dlv" ; The Delve debugger executable
    :command-args '("dap" "--listen" "127.0.0.1::autoport") ; Launch dlv in DAP server mode
    :command-cwd dape-command-cwd ; Dynamically set CWD to the project root or current directory

    ;; DAP Request Parameters
    :port :autoport
    :request "launch"
    :mode "test"
    :type "go" ; Use the standard adapter type for dlv
    :program dape-buffer-default ; Target the current package (at the CWD) for testing
    :name "Go :: Debug Current Package Tests")
   dape-configs :key #'car))

;; used to remove first config from the list
;; (setq dape-configs (remove (car dape-configs) dape-configs))
