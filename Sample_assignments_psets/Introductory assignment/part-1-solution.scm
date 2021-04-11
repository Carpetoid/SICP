#lang sicp
; PART 1:

(- 8 9)
; Evaluates to -1

(> 3.7 4.4)
; Evaluates to #f

(- (if (> 3 4) 7 10) (/ 16 10))
; Evaluates to 8.4

(define b 13)
; Doesn't evaluate to anything since it's a definition

13
; Evaluates to 13

b
; Evaluates to 13

>
; Procedure name

(define square (lambda (x) (* x x)))
; Doesn't evaluate to anything since it's a definition

square
; Evaluates to procedure name

(square 13)
; Evaluates to 169

(square b)
; Evaluates to 169

(square (square (/ b 1.3)))
; Evaluates to 10000

(define multiply-by-itself square)
; Evalutes to nothing since definition

(multiply-by-itself b)
; Evaluates to 169

(define a b)
; Evaluates to b, which is 13

(= a b)
; Evaluates to #t

(if (= (* b a) (square 13))
    (< a b)
    (- a b))
; Evaluates to #f

(cond ((>= a 2) b)
      ((< (square b) (multiply-by-itself a)) (/ 1 0))
      (else (abs (- (square a) b))))





