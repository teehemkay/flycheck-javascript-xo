(with-eval-after-load 'flycheck
  (progn
    (flycheck-define-checker javascript-xo
      "JavaScript happiness style linter.

See URL `https://github.com/xojs/xo'."
      :command
      ("xo" "--reporter=json"
       "--stdin"
       (eval (concat "--stdin-filename=" source-original)))
      :standard-input t
      :error-parser flycheck-parse-eslint
      :modes
      (js-mode js-jsx-mode js2-mode js2-jsx-mode js3-mode rjsx-mode))

    (add-to-list 'flycheck-checkers 'javascript-xo)
    ))
