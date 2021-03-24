#lang sicp

10 ;prints 10

(+ 5 3 4) ;prints 12

(- 9 1) ;prints 8

(/ 6 2) ;prints 3

(+ (* 2 4) (- 4 6)) ;prints 6

(define a 3) ;define is a special form so it is an exception to the evaluation rule, therefore, it won't print anything 

(define b (+ a 1)) ;same as the previous expression

(+ a b (* a b)) ;prints 19 

(= a b) ;prints "#f" which means false

(if (and (> b a) (< b (* a b)))
    b
    a) ;it prints b (4) since both predicates are true

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25)) ;it prints 16 since the predicate "(= b 4)" is true

(+ 2 (if (> b a) b a)) ;since the predicate '(> b a)' is true, it returns b, which is then used as an argument (operand)  for the procedure (operator) '+' which then prints 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1)) ;prints 16 since the first predicate is false and the second is true
