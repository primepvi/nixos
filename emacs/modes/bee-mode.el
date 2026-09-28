;;; bee-mode.el --- Major mode for Bee -*- lexical-binding: t; -*-
;;; Code:

(defconst bee-keywords
  '("let" "var" "const" "lit"
    "fn" "return"
    "if" "else" "then"
    "when" "otherwise"
    "while" "do"
    "for" "end"
    "echo"
    "and" "or" "not"))

(defconst bee-types
  '("int" "string" "bool" "void" "char" "uint" "byte" "ubyte" "float" "Range" "Function" "atom"))

(defconst bee-constants
  '("true" "false" "null"))
(defconst bee-font-lock-keywords
  `(
    ;; Strings
    ("\"\\(?:\\\\.\\|[^\"\\\\]\\)*\""
     . font-lock-string-face)

    ;; Characters
    ("'\\(?:\\\\.\\|[^'\\\\]\\)'"
     . font-lock-constant-face)

    ;; Atoms
    (":\\(?:[[:alpha:]_]\\)[[:alnum:]_]*"
     . font-lock-constant-face)

    ;; Numbers
    ("\\_<[0-9]+\\(?:\\.[0-9]+\\)?\\_>"
     . font-lock-constant-face)

    ;; Operators
    ("\\(?:->\\|==\\|\\.\\.\\|!=\\|<=\\|>=\\|[+*/%<>=|-]\\)"
     . font-lock-builtin-face)

    ;; Keywords
    (,(regexp-opt bee-keywords 'symbols)
     . font-lock-keyword-face)

    ;; Types
    (,(regexp-opt bee-types 'symbols)
     . font-lock-type-face)

    ;; Constants
    (,(regexp-opt bee-constants 'symbols)
     . font-lock-constant-face)

    ;; Function definitions
    ("\\_<fn\\_>[ \t]+\\([[:word:]_]+\\)"
     1 font-lock-function-name-face)

    ;; Variable definitions
    ("\\_<\\(?:let\\|var\\|const\\|lit\\)\\_>[ \t]+\\([[:word:]_]+\\)"
     1 font-lock-variable-name-face)

    ;; Function calls
    ("\\_<\\([[:word:]_]+\\)[ \t]*("
     1 font-lock-function-call-face)))

(defconst bee-fixture-font-lock-keywords
  '(
    ("\\_<:[[:word:]_-]+\\_>"
     . font-lock-keyword-face)

    ("'[[:word:]_-]+"
     . font-lock-variable-name-face)

    ("(\\([[:word:]_-]+\\)"
     1 font-lock-function-name-face)))

(defvar bee-mode-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?\" "\"" table)
    (modify-syntax-entry ?# "<" table)
    (modify-syntax-entry ?\n ">" table)
    table))

;;;###autoload
(define-derived-mode bee-mode prog-mode "Bee"
  "Major mode for the Bee programming language."
  (setq-local font-lock-defaults
              '(bee-font-lock-keywords)))

;;;###autoload
(define-derived-mode bee-fixture-mode bee-mode "Bee Fixture"
  "Major mode for Bee parser fixtures."
  (font-lock-add-keywords
   nil
   bee-fixture-font-lock-keywords))

;;;###autoload
(add-to-list 'auto-mode-alist
             '("\\.bee\\'" . bee-mode))

;;;###autoload
(add-to-list 'auto-mode-alist
             '("\\.fixture\\'" . bee-fixture-mode))

(provide 'bee-mode)

;;; bee-mode.el ends here
