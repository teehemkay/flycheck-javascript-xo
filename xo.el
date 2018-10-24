(require 'flycheck)
(flycheck-define-checker javascript-xo
  "JavaScript happiness style linter.

See URL `https://github.com/xojs/xo'."
  :command
    ("xo" "--reporter=unix"
    "--stdin"
    (eval (concat "--stdin-filename=" (buffer-file-name))))
  :standard-input t
  :error-patterns
    ((warning line-start
              (file-name) ":" line ":" column ": "
              (message) " [Warning/" (id (one-or-more (in lower digit "/-"))) "]" line-end)
     (error line-start
            (file-name) ":" line ":" column ": "
            (message) " [Error/" (id (one-or-more (in lower digit "/-"))) "]" line-end)
     (error line-start
            (file-name) ":" line ":" column ": "
            (message) " [Error]" line-end))
  :modes
    (js-mode js-jsx-mode js2-mode js2-jsx-mode js3-mode rjsx-mode))

(add-to-list 'flycheck-checkers 'javascript-xo)
