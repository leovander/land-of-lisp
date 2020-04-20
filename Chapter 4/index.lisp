;; Making Decisions with Conditions
;; Empty Equals False

(if '()
    (princ 'i-am-true)
    (princ 'i-am-false))
;; I-AM-FALSE

(if '(1)
    (princ 'i-am-true)
    (princ 'i-am-false))
;; I-AM-TRUE

(defun my-length (list)
    (if list
        (1+ (my-length (cdr list)))
        0))
;; (my-length '(list of four words))
;; 4

;; The Four Disguises of ()
(eq '() nil)
;; T

(eq '() ())
;; T

(eq '() 'nil)
;;T

;; The Conditionals: if and Beyond
;; One thing at a Time with if
(if (= (+ 1 2) 3)
    'yup
    'nope)
;; YUP

(if (= (+ 1 2) 4)
    'yup
    'nope)
;; NOPE

(if '(1)
    'the-list-has-stuff-in-it
    'the-list-is-empty)
;; THE-LIST-HAS-STUFF-IN-IT


(if '()
    'the-list-has-stuff-in-it
    'the-list-is-empty)
;; THE-LIST-IS-EMPTY

(if (oddp 5)
    'odd-number
    'even-number)
;; ODD-NUMBER

(if (oddp 5)
    'odd-number
    (\ 1 0))
;; ODD-NUMBER

;; Use progn to run multiple lines in an if statement
;; Only the last thing to execute will be the return value
(defvar *number-was-odd nil)

(if (oddp 5)
    (progn (setf *number-was-odd t)
            'odd-number)
    'even-number)
;; T
;; ODD-NUMBER

;; Going Beyond if: The when and unless Alternatives
(defvar *number-is-odd nil)

(when (oddp 5)
        (setf *number-is-odd t)
        'odd-number)
;; T
;; ODD-NUMBER

(unless (oddp 4)
        (setf *number-is-odd nil)
        'even-number)
;; NIL
;; EVEN-NUMBER

;; The Command that Does it All
;; Explicit progn in cond statements
(defvar *arch-enemy* nil)

(defun pudding-eater (person)
    (cond ((eq person 'henry) (setf *arch-enemy* 'stupid-lisp-alien)
                                '(curse you lisp alien - you ate my pudding))
          ((eq person 'johnny) (setf *arch-enemy* 'useless-old-johnny)
                                '(i hope you choked on my pudding johnny))
          (t                    '(why you eat my pudding stranger?))))
;; (pudding-eater 'hope)
;; (WHY YOU EAT MY PUDDING STRANGER?)
;; (pudding-eater 'johnny)
;; (I HOPE YOU CHOKED ON MY PUDDING JOHNNY)
;; (pudding-eater 'henry)
;; (CURSE YOU LISP ALIEN - YOU ATE MY PUDDING)

;; Branching with case
(defun pudding-easter (person)
    (case person
        ((henry)    (setf *arch-enemy* 'stupid-lisp-alien)
                    '(curse you lisp alien - you ate my pudding))
        ((johnny)   (setf *arch-enemy* 'useless-old-johnny)
                    '(i hope you choked on my pudding johnny))
        (otherwise  '(why you eat my pudding stranger?))))

;; Cool Tricks with Conditions
;; Using the Stealth Conditionals and and or
(and (oddp 5) (oddp 7) (oddp 9))
;; T

(or (oddp 4) (oddp 7) (oddp 8))
;; T

(defparameter *is-it-even* nil)

(or (oddp 4) (setf *is-it-even* t))
;; T

*is-it-even
;; T

;; First truthy statement causes the rest of the statements to not execute
;; The same is true of AND and the first falsy statement
(defparameter *is-it-even* nil)

(or (oddp 5) (setf *is-it-even* t))
;; T

*is-it-even
;; NIL

;; Examples of combining and's
(if *file-modified*
    (if (ask-user-about-saving)
        (save-file)))

(and *file-modified* (ask-user-about-saving) (save-file))

(if (and *file-modified*
        (ask-user-about-saving))
    (save-file))

;; Using Functions That Return more than Just the Truth
(if (member 1 '(3 4 1 5))
    'one-is-in-the-list
    'one-is-not-in-the-list)
;; ONE-IS-IN-THE-LIST

(member 1 '(3 4 1 5))
;; (1 5)

(member nil '(3 4 nil 5))
;; (NIL 5)

(if (member nil '(3 4 nil 5))
    'nil-is-in-the-list
    'nil-is-not-in-the-list)
;; NIL-IS-IN-THE-LIST

(find-if #'oddp '(2 4 5 6))
;; 5

(if (find-if #'oddp '(2 4 5 6))
    'there-is-an-odd-number
    'there-is-no-odd-number)
;; THERE-IS-AN-ODD-NUMBER

(find-if #'null '(2 4 nil 6))
;; NIL

;; Comparing Stuff: eq, equal, and More
;; equal, eql, eq, =, string-equal, and equalp

;; Conrad's Rule of Thumb for Comparing Stuff
;; 1. Use EQ to compare symbols
;; 2. Use EQUAL for everything else
(defparameter *fruit* 'apple)

(cond ((eq *fruit* 'apple) 'its-an-apple)
      ((eq *fruit* 'orange) 'its-an-orange))
;; ITS-AN-APPLE

;; comparing symbols
(equal 'apple 'apple)
;; T

;; comparing lists
(equal (list 1 2 3) (list 1 2 3 ))
;; T

;; Identical lists created in different ways still compare as the same
(equal '(1 2 3) (cons 1 (cons 2 (cons 3 ()))))
;; T

;; comparing integers
(equal 5 5)
;; T

;; comparing floating point numbers
(equal 2.5 2.5)
;; T

;; comparing strings
(equal "foo" "foo")
;; T

;; comparing characters
(equal #\a #\a)
;; T

;; comparing symbols
(eql 'foo 'foo)
;; T

;; comparing numbers
(eql 3.4 3.4)
;; T

;; comparing characters
(eql #\a #\a)
;; T

;; comparing strings with different CAPS
(equalp "Bob Smith" "bob smith")
;; T

;; comparing integers against floating point numbers
(equalp 0 0.0)
;; T