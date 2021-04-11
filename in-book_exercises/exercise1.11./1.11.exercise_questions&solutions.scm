#lang scheme

; Exercise 1.11.  A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>= 3.
; Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

; Recursive process:

(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1)) (* 2 (f-recursive (- n 2))) (* 3 (f-recursive (- n 3))))
  ))

; Iterative process:

(define (f-iterative n)
  (f-iter 2 1 0 3 n))

(define (f-iter a b c count n)
  (cond ((< n 3) n) 
        ((= count n) (+ a (* 2 b) (* 3 c)))
        (else (f-iter (+ a (* 2 b) (* 3 c)) a b (+ count 1) n))))





      