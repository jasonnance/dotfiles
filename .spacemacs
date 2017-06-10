;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     windows-scripts
     ess
     csv
     nginx
     typescript
     java
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t)
     better-defaults
     emacs-lisp
     git
     markdown
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     syntax-checking
     version-control
     javascript
     html
     shell-scripts
     sql
     react
     osx
     (python :variables
             python-test-runner 'pytest)
     ipython-notebook
     docker
     ansible
     nginx
     games
     dash
     (haskell :variables
              haskell-process-type 'stack-ghci
              haskell-process-path-ghci "stack"
              haskell-completion-backend 'ghc-mod)
     csharp
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t)
     cscope
     semantic
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(rtags rtags-helm flycheck-rtags company-rtags editorconfig pyenv-mode direnv)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; Example for 5 recent files and 7 projects: '((recents . 5) (projects . 7))
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; (default nil)
   dotspacemacs-startup-lists '()
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq-default git-magit-status-fullscreen t)
  )

(defun jnance/setup-rtags ()
  ;; Add keybinds for rtags for C++ code
  ;; Based on https://skebanga.github.io/rtags-with-cmake-in-spacemacs/
  (setq rtags-autostart-diagnostics t
        rtags-completions-enabled t
        rtags-use-helm t)
  (eval-after-load 'company
    '(add-to-list
      'company-backends 'company-rtags))
  (rtags-enable-standard-keybindings)
  (add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
  (spacemacs/set-leader-keys-for-major-mode 'c++-mode
    "g." 'rtags-find-symbol-at-point
    "g," 'rtags-find-references-at-point
    "gv" 'rtags-find-virtuals-at-point
    "gV" 'rtags-print-enum-value-at-point
    "g/" 'rtags-find-all-references-at-point
    "gY" 'rtags-cycle-overlays-on-screen
    "g>" 'rtags-find-symbol
    "g<" 'rtags-find-references
    "g[" 'rtags-location-stack-back
    "g]" 'rtags-location-stack-forward
    "gD" 'rtags-diagnostics
    "gG" 'rtags-guess-function-at-point
    "gp" 'rtags-set-current-project
    "gP" 'rtags-print-dependencies
    "ge" 'rtags-reparse-file
    "gE" 'rtags-preprocess-file
    "gR" 'rtags-rename-symbol
    "gM" 'rtags-symbol-info
    "gS" 'rtags-display-summary
    "gO" 'rtags-goto-offset
    "g;" 'rtags-find-file
    "gF" 'rtags-fixit
    "gL" 'rtags-copy-and-print-current-location
    "gX" 'rtags-fix-fixit-at-point
    "gB" 'rtags-show-rtags-buffer
    "gI" 'rtags-imenu
    "gT" 'rtags-taglist
    "gh" 'rtags-print-class-hierarchy
    "ga" 'rtags-print-source-arguments))

(defun jnance/setup-ess-mode ()
  ;; Add extra keybinds/behavior for ESS mode -- based on
  ;; https://github.com/syl20bnr/spacemacs/pull/4176/files
  (evilified-state-evilify ess-watch-mode ess-watch-mode-map
    "g" 'revert-buffer
    ;; movement
    "j" 'ess-watch-next-block
    "k" 'ess-watch-previous-bloc
    "l" 'ess-watch-next-block
    "h" 'ess-watch-previous-bloc
    "n" 'ess-watch-next-block
    "p" 'ess-watch-previous-bloc

    ;; default edit bindings make sense other than these
    "c" 'ess-watch-edit-expression
    "D" 'ess-watch-kill

    "G" 'end-of-buffer)

  (spacemacs/declare-prefix-for-mode 'ess-mode "mc" "noweb")
  (spacemacs/declare-prefix-for-mode 'ess-mode "ms" "repl-interaction")
  (spacemacs/declare-prefix-for-mode 'ess-mode "mh" "help")
  (spacemacs/declare-prefix-for-mode 'ess-mode "md" "developer")
  (spacemacs/declare-prefix-for-mode 'ess-mode "mb" "debugging")
  (spacemacs/declare-prefix-for-mode 'ess-mode "mv" "views")
  (spacemacs/set-leader-keys-for-major-mode 'ess-mode
    "'"  'spacemacs/ess-start-repl
    "si" 'spacemacs/ess-start-repl
    ;; noweb
    "cC" 'ess-eval-chunk-and-go
    "cc" 'ess-eval-chunk
    "cd" 'ess-eval-chunk-and-step
    "cm" 'ess-noweb-mark-chunk
    "cN" 'ess-noweb-previous-chunk
    "cn" 'ess-noweb-next-chunk
    ;; REPL
    "sa" 'ess-switch-process
    "sB" 'ess-eval-buffer-and-go
    "sb" 'ess-eval-buffer
    "sD" 'ess-eval-function-or-paragraph-and-step
    "sd" 'ess-eval-region-or-line-and-step
    "sL" 'ess-eval-line-and-go
    "sl" 'ess-eval-line
    "sR" 'ess-eval-region-and-go
    "sr" 'ess-eval-region
    "sT" 'ess-eval-function-and-go
    "st" 'ess-eval-function
    "sP" 'ess-install-library
    "sp" 'ess-load-library
    "s:" 'ess-execute
    "sw" 'ess-set-working-directory
    ;; R helpers
    "hh" 'ess-display-help-on-object
    "hH" 'ess-describe-object-at-point
    "ha" 'ess-display-help-apropos
    "hp" 'ess-display-package-index
    "hv" 'ess-display-vignettes
    "hw" 'ess-help-web-search

    ;; These two aren't applicable to / implemented in R, but might be
    ;; utilizted in other dialects
    "hm" 'ess-manual-lookup
    "hr" 'ess-reference-lookup

    ;; Developer bindings
    "dT" 'ess-build-tags-for-directory
    "ds" 'ess-set-style
    "dg" 'ess-dump-object-into-edit-buffer
    ;; TODO only show these bindings if we're in R-mode.
    "dl" 'ess-r-devtools-load-package
    "dp" 'ess-r-devtools-set-pacakge
    "dt" 'ess-r-devtools-test-pacakge
    "dc" 'ess-r-devtools-check-pacakge
    "dr" 'ess-r-devtools-document-package
    "du" 'ess-r-devtools-unload-package
    "di" 'ess-r-devtools-install-package

    ;; debug bindings
    "bT" 'ess-show-traceback
    ;; "b~" 'ess-show-callstack
    ;; "bC" 'ess-show-callstack
    "bs" 'ess-bp-set
    "be" 'ess-debug-toggle-error-action
    "bc" 'ess-bp-set-conditional
    "bl" 'ess-bp-set-logger
    "bt" 'ess-bp-toggle-state
    "bd" 'ess-bp-kill
    "bD" 'ess-bp-kill-all
    "bn" 'ess-bp-next
    "bp" 'ess-bp-previous
    "bm" 'ess-debug-flag-for-debugging
    "bM" 'ess-debug-unflag-for-debugging
    "bw" 'ess-watch
    ;; other views
    "vp" 'ess-R-dv-pprint
    "vi" 'ess-R-object-popup
    "vt" 'ess-R-dv-ctable
    "vd" 'ess-rdired)
  (define-key ess-mode-map (kbd "<s-return>") 'ess-eval-line)

  ;; define the applicable subset of the above keys for the inferior mode
  ;; as well
  (spacemacs/declare-prefix-for-mode 'inferior-ess-mode "ms" "repl-interaction")
  (spacemacs/declare-prefix-for-mode 'inferior-ess-mode "mh" "help")
  (spacemacs/declare-prefix-for-mode 'inferior-ess-mode "md" "developer")
  (spacemacs/declare-prefix-for-mode 'inferior-ess-mode "mb" "debugging")
  (spacemacs/declare-prefix-for-mode 'inferior-ess-mode "mv" "views")
  (spacemacs/set-leader-keys-for-major-mode 'inferior-ess-mode
    "sP" 'ess-install-library
    "sp" 'ess-load-library
    "s:" 'ess-execute
    "sw" 'ess-set-working-directory
    ;; R helpers
    "hh" 'ess-display-help-on-object
    "hH" 'ess-describe-object-at-point
    "ha" 'ess-display-help-apropos
    "hp" 'ess-display-package-index
    "hv" 'ess-display-vignettes
    "hw" 'ess-help-web-search

    ;; These two aren't applicable to / implemented in R, but might be
    ;; utilizted in other dialects
    "hm" 'ess-manual-lookup
    "hr" 'ess-reference-lookup

    ;; Developer bindings
    "dg" 'ess-dump-object-into-edit-buffer

    ;; TODO only show these bindings if we're in R-mode.
    "dl" 'ess-r-devtools-load-package
    "dp" 'ess-r-devtools-set-pacakge
    "dt" 'ess-r-devtools-test-pacakge
    "dc" 'ess-r-devtools-check-pacakge
    "dr" 'ess-r-devtools-document-package
    "du" 'ess-r-devtools-unload-package
    "di" 'ess-r-devtools-install-package

    ;; debug bindings
    "bT" 'ess-show-traceback
    "be" 'ess-debug-toggle-error-action
    "bw" 'ess-watch
    ;; other views
    "vp" 'ess-R-dv-pprint
    "vi" 'ess-R-object-popup
    "vt" 'ess-R-dv-ctable
    "vd" 'ess-rdired)
  (define-key inferior-ess-mode-map (kbd "C-j") 'comint-next-input)
  (define-key inferior-ess-mode-map (kbd "C-k") 'comint-previous-input))


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; General editor config
  (setq vc-follow-symlinks 1)
  (direnv-mode)
  (remove-hook 'prog-mode-hook #'smartparens-mode)
  (setq-default tab-always-indent t
                tab-width 4
                evil-shift-width 4)

  ;; Shell
  ;; spacemacs doesn't play nicely with fish
  (let ((shell "/bin/bash"))
    (setq-default
     shell-default-term-shell shell
     shell-file-name shell
     multi-term-program shell))
  (add-to-list 'auto-mode-alist '("\\.zshrc_secret\\'" . sh-mode))
  (add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-mode))
  (add-to-list 'auto-mode-alist '("\\.out\\'" . auto-revert-mode))

  ;; Web mode/JS/TS/React
  (remove-hook 'web-mode-hook #'emmet-mode)
  ;; Don't use auto-quoting for TSX files
  (add-hook 'web-mode-hook
            (lambda ()
              (when (and (stringp buffer-file-name)
                         (string-match "\\.tsx\\'" buffer-file-name))
                (setq web-mode-enable-auto-quoting nil))))
  (setq-default
   js2-basic-offset 4
   js2-indent-switch-body t
   js-switch-indent-offset 4
   css-indent-offset 4
   web-mode-markup-indent-offset 4
   web-mode-css-indent-offset 4
   web-mode-code-indent-offset 4
   web-mode-attr-indent-offset 4
   typescript-indent-level 4

   )

  ;; Python
  (pyenv-mode)
  (add-hook 'anaconda-mode 'run-python)
  (setq python-shell-completion-native-enable nil)

  (defun projectile-pyenv-mode-set ()
    "Set pyenv version matching project name."
    (let ((project (projectile-project-name)))
      (if (member project (pyenv-mode-versions))
          (pyenv-mode-set project)
        (pyenv-mode-unset))))

  (add-hook 'projectile-before-switch-project-hook 'projectile-pyenv-mode-set)

  ;; SQL
  (add-to-list 'spacemacs-indent-sensitive-modes 'sql-mode)
  (add-hook 'sql-mode
            (lambda ()
              (sql-highlight-postgres-keywords)))

  ;; R
  (setq-default ess-indent-offset 4)
  (setq-default ess-eval-visibly nil)
  ;; Disable replacing '_' with ' -> '; have to set our
  ;; own variable and check it to avoid toggling unnecessarily
  (setq-default ess-underscore-is-set nil)
  (add-hook 'ess-mode-hook
            (lambda ()
              (jnance/setup-ess-mode)
              (unless ess-underscore-is-set
                (ess-toggle-underscore nil)
                (setq-default ess-underscore-is-set t))))

  ;; Haskell
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  (add-to-list 'exec-path "~/.local/bin")

  ;; Java
  (setq eclim-eclipse-dirs "~/eclipse"
        eclim-executable "~/eclipse/eclimd")

  ;; C/C++
  (setq-default c-default-style "bsd")
  (setq-default c-basic-offset 4)

  ;; C#
  (setq-default omnisharp-server-executable-path "~/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")
  (add-hook 'csharp-mode-hook #'aggressive-indent-mode)
  (add-hook 'c++-mode-hook
            (lambda ()
              (jnance/setup-rtags)))

  ;; Helm
  (setq helm-autoresize-mode t)

  ;; Projectile
  (projectile-mode)
  (setq projectile-switch-project-action 'helm-projectile-find-file)
  (setq projectile-switch-project-action 'helm-projectile)
  (setq projectile-indexing-method 'native)
  (setq projectile-enable-caching t)
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-directories "bower_components")

  ;; Magit
  (setq magit-repository-directories '("~/projects/"))

  ;; Tramp
  (setq tramp-default-method "ssh")

  ;; Company
  (remove-hook 'yaml-mode-hook 'company-mode)
  (add-hook 'company-mode-hook
            (lambda ()
              (delete 'company-dabbrev company-backends))))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(evil-want-Y-yank-to-eol nil)
 '(js2-strict-missing-semi-warning nil)
 '(package-selected-packages
   (quote
    (company-rtags flycheck-rtags rtags stickyfunc-enhance srefactor helm-cscope xcscope disaster company-c-headers cmake-mode clang-format direnv omnisharp csharp-mode insert-shebang hide-comnt powershell company-emacs-eclim eclim intero hlint-refactor hindent helm-hoogle haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode helm-dash dash-at-point selectric-mode typit mmt pacmacs 2048-game ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode editorconfig csv-mode nginx-mode yaml-mode jinja2-mode ansible-doc ansible tide typescript-mode dockerfile-mode docker tablist docker-tramp reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl yapfify web-mode web-beautify tagedit sql-indent slim-mode scss-mode sass-mode pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements livid-mode skewer-mode simple-httpd live-py-mode less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc hy-mode helm-pydoc helm-css-scss haml-mode fish-mode emmet-mode ein websocket cython-mode company-web web-completion-data company-tern dash-functional tern company-shell company-anaconda coffee-mode anaconda-mode pythonic xterm-color smeargle shell-pop orgit org-projectile org-present org org-pomodoro alert log4e gntp org-download mwim multi-term mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help diff-hl company-statistics company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme)))
 '(safe-local-variable-values
   (quote
    ((flycheck-disabled-checkers
      (javascript-jscs))
     (flycheck-disabled-checkers
      (quote
       (javascript-jscs)))
     (flycheck-disabled-checkers quote
                                 (javascript-jscs))
     (js-indent-level 2)
     (js2-basic-offset . 2)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
