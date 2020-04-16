; Empty Equals False

(if '()
    (princ 'i-am-true)
    (princ 'i-am-false))
; i-am-false

(if '(1)
    (princ 'i-am-true)
    (princ 'i-am-false))
; i-am-true

; Recurison
(defun my-length (list)
    (if list
        (1+ (my-length (cdr list)))
        0))
; (my-length '(list of four words))
; 4

; The Four Disguises of ()
(eq '() nil)
; T

(eq '() ())
; T

(eq '() 'nil)
;T

; One thing at a Time with if
(if (= (+ 1 2) 3)
    'yup
    'nope)
; yup

(if (= (+ 1 2) 4)
    'yup
    'nope)
; nope

(if '(1)
    'the-list-has-stuff-in-it
    'the-list-is-empty)
; the-list-has-stuff-in-it


(if '()
    'the-list-has-stuff-in-it
    'the-list-is-empty)
; the-list-is-empty

(if (oddp 5)
    'odd-number
    'even-number)
; odd-number

(if (oddp 5)
    'odd-number
    (\ 1 0))
; odd-number


