#lang sicp
#| Question: Newton's method for cube roots is based on the fact that if y is an
approximation to the cube root of x, then a better approximation is given by the value (x/y^2 + 2y)/3
Use this formula to implement a cube-root procedure analogous to the square-root procedure.
(In section 1.3.4 we will see how to implement Newton's method in general as an abstraction of these square-root
and cube-root procedures.)|#

; Solution:

(define (cube-iter new_guess x old_guess)
  (cond
    ((< (/ (abs (- old_guess new_guess)) old_guess) 0.001)
      new_guess)
      (else
       (cube-iter (improve new_guess x) x new_guess))))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess) ) 3)
  )

(define (average x y)
  (/ (+ x y) 2))
(define (cube x)
  (* x x x))

(define (cube_root x)
  (cube-iter (improve 1.0 x) x 1.0))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

