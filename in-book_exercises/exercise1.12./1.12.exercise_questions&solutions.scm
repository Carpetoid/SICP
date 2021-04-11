#lang scheme

; Exercise 1.12.  The following pattern of numbers is called Pascal's triangle.

#|    1
     1 1
    1 2 1
   1 3 3 1
  1 4 6 4 1
1 5 10 10 5 1

|#

; The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two
; numbers above it. Write a procedure that computes elements of Pascal's triangle by means of a recursive process.

; Solution:

(define (p col row)
  (cond ((> col row) (display "Column value must not be greater than row value."))
        ((or (= col 0) (= col row)) 1)
        (else (+ (p col (- row 1)) (p (- col 1) (- row 1))))
    )
  )

