(defun square(n)
    (* n n))

(defun cube(n)
    (* n n n))

(defun +-+(n)
    (- (+ n n) (+ n n)))

(eq 'fooo 'FoOo)
; T

(+ 1 1.0)
; 2.0

(expt 53 53)
; 24356848165022712132477606520104725518533453128685640844505130879576720609150223301256150373

(/ 4 6)
; 2/3

(/ 4.0 6)
; 0.6666667

(princ "Tutti Frutti")
; Tutti Frutti
; "Tutti Frutti"

(princ "He yelled \"Stop that thief!\" from the busy street.")
; He yelled "Stop that thief!" from the busy street.
; "He yelled \"Stop that thief!\" from the busy street."

(expt 2 3)
; 8

(expt 2 (+ 3 4))
; 128

'(expt 2 3)
; (EXPT 2 3)

(cons 'chicken 'cat)
; (CHICKEN . CAT)

(cons 'chicken 'nil)
; (CHICKEN)

(cons 'chicken ())
; (CHICKEN)

(cons 'pork '(beef chicken))
; (PORK BEEF CHICKEN)

(cons 'beef (cons 'chicken ()))
; (BEEF CHICKEN)

(cons 'pork (cons 'beef (cons 'chicken ())))
; (PORK BEEF CHICKEN)

(car '(pork beef chicken))
; PORK

(cdr '(pork beef chicken))
; (BEEF CHICKEN)

(car '(beef chicken))
; BEEF

(car (cdr '(pork beef chicken)))
; BEEF

(cadr '(pork beef chicken))
; BEEF

(list 'pork 'beef 'chicken)
; (PORK BEEF CHICKEN)

'(cat (duck bat) ant)
; (CAT (DUCK BAT) ANT)

(car '((peas carrots tomatoes) (pork beef chicken)))
; (PEAS CARROTS TOMATOES)

(cdr '(peas carrots tomatoes))
; (CARROTS TOMATOES)

(cdr (car '((peas carrots tomatoes) (pork beef chicken))))
; (CARROTS TOMATOES)

(cdar '((peas carrots tomatoes) (pork beef chicken)))
; (CARROTS TOMATOES)

(cons (cons 'peas (cons 'carrots (cons 'tomatoes ()))) (cons (cons 'pork (cons 'beef (cons 'chicken ()))) ()))
; ((PEAS CARROTS TOMATOES) (PORK BEEF CHICKEN))

(cddr '((peas carrots tomatoes) (pork beef chicken) duck))
; (DUCK)

(caddr '((peas carrots tomatoes) (pork beef chicken) duck))
; DUCK

(cddar '((peas carrots tomatoes) (pork beef chicken) duck))
; (TOMATOES)

(cadadr '((peas carrots tomatoes) (pork beef chicken) duck))
; BEEF