#lang scheme
; Exercise 1.9. problem:

; Each of the following two procedures defines a method for adding two positive integers
; in terms of the procedures inc, which increments its argument by 1, and dec, which decrements its argument by 1.

; Procedure 1:

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

; Procedure 2:

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

; Using the substitution model, illustrate the process generated by each procedure
; in evaluating (+ 4 5). Are these processes iterative or recursive?

; Solution:

; 1. Substitution model for procedure 1 with arguments (+ 4 5):

; (+ 4 5)
; (inc (+ 3 5))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9

; By definition, since this procedure evolves by deferring operations, this is a linear recursive process and
; also a recursive procedure.

; 2. Substitution model for procedure 2 with arguments (+ 4 5):

; (+ 4 5)
; (+ 3 6)
; (+ 2 7)
; (+ 1 8)
; (+ 0 9)
; 9

; As we can observe, this is just an iterative process that's defined by a recursive procedure. 