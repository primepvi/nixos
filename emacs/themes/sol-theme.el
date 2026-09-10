;;; -*- lexical-binding: t; -*-

(deftheme sol
  "A warm dark theme.")

(custom-theme-set-faces
 'sol
 '(default
   ((t (:background "#1F1E1E"
        :foreground "#EDEBEB"))))
 '(cursor
   ((t (:background "#F6C7E8"))))
 '(region
   ((t (:background "#3A3542"))))
 '(font-lock-comment-face
   ((t (:foreground "#77737D"
        :slant italic))))
 '(font-lock-variable-name-face
   ((t (:foreground "#D9D1E8"))))
 '(font-lock-keyword-face
   ((t (:foreground "#F5DD87"
        :weight bold))))
 '(font-lock-function-name-face
   ((t (:foreground "#F59687"
        :weight bold))))
 '(font-lock-string-face
   ((t (:foreground "#A8D5BA"))))
 '(font-lock-constant-face
   ((t (:foreground "#EFA8D0"))))
 '(font-lock-type-face
   ((t (:foreground "#FABB73"
        :slant italic))))
 '(font-lock-builtin-face
   ((t (:foreground "#76a8de"))))
 '(font-lock-preprocessor-face
   ((t (:foreground "#76a8de"
        :slant italic))))
 '(font-lock-number-face
   ((t (:foreground "#EFA8D0"))))
 '(font-lock-operator-face
   ((t (:foreground "#D9B6D9"))))
 '(font-lock-function-call-face
   ((t (:foreground "#F59687"))))
 '(show-paren-match
   ((t (:background "#4A4055"
        :foreground "#F6C7E8"
        :weight bold))))

 ;; Errors
 '(error
   ((t (:foreground "#F38BA8"
        :weight bold))))
 '(warning
   ((t (:foreground "#F9E2AF"
        :weight bold))))
 '(success
   ((t (:foreground "#A6D6A8"
        :weight bold)))))

(provide-theme 'sol)
