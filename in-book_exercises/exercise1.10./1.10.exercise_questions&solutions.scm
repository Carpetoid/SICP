#lang racket
(require racket/trace)
; Exercise 1.10. problems:
; The following procedure computes a mathematical function called Ackermann's function.

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; What are the values of the following expressions?

(A 1 10)

(A 2 4)

(A 3 3)

; Consider the following procedures, where A is the procedure defined above:

(define (f n) (A 0 n))

(define (g n) (A 1 n))

(define (h n) (A 2 n))

(define (k n) (* 5 n n))

; Give concise mathematical definitions for the functions computed by
; the procedures f, g, and h for positive integer values of n. For example, (k n) computes 5n2.

; Solutions:

; Problem 1:
; To make it easier to answer problem 2, I will answer problem 1's (A 1 10) part by using the substitution model. 

; 1. (A 1 10) evaluates to:

; (A 1 10)
; (A 0 (A 1 9))
; (A 0 (A 0 (A 1 8)))
; (A 0 (A 0 (A 0 (A 1 7))))
; (A 0 (A 0 (A 0 (A 0 (A 1 6)))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
; (A 0 (A 0 (A 0 (A 0 (A 0 32)))))
; (A 0 (A 0 (A 0 (A 0 64))))
; (A 0 (A 0 (A 0 128)))
; (A 0 (A 0 256))
; (A 0 512)
; 1024

; 2. (A 2 4) evaluates to: 65536

; 3. (A 3 3) evaluates to : 65536

; Problem 2:

; 1. (define (f n) (A 0 n)), (f n): 2n

; The second conditional will always be true since x will always equal 0, and so, n will just simply be multiplied by two.


; 2. (define (g n) (A 1 n)), (g n): 2^n

; part 1 of problem 1 visualizes this.

; 3. (define (h n) (A 2 n)), (h n):

;(trace A)
;(A 2 3)

; (A 2 3)
; (A 2 2)
; (A 2 1)
;

(define (test x y)
  (if y y (test (- x 1) y))
  )
(trace test)
(test 10 #f)