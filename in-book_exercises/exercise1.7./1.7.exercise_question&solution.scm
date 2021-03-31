#lang sicp
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))


(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

#| Exercise 1.7. question:
The good-enough? test used in computing square roots will not be very effective
for finding the square roots of very small numbers. Also, in real computers, arithmetic
operations are almost always performed with limited precision. This makes our test inadequate
for very large numbers. Explain these statements, with examples showing how the test fails for
small and large numbers. An alternative strategy for implementing good-enough? is to watch how
guess changes from one iteration to the next and to stop when the change is a very small fraction
of the guess. Design a square-root procedure that uses this kind of end test. Does this work better
for small and large numbers? |#

; answers:

#| Small numbers: When it comes to finding square roots of small numbers, the tolerance of 0.001 is just too big, which basically means
that whatever guess (< (abs (- (square guess) x)) 0.001)) tells us is good enough
won't be anywhere close enough to x (the radicand). This applies to any radicand smaller than our tolerance of 0.001
since we are checking for the difference between guess^2 and x. |#

; Example of the procedure failing with a small radicand:
(display "Square root of 0.0000009 with good-enough?: ")
(sqrt 0.0000009)

#| Here we can see that the actual output for the combination is 0.03125959003810499, when in reality,
it is supposed to be 0.000949.|#

#| Large numbers: As the question says, "arithemtic operations are almost always performed with limited precision." This
becomes very clear when we try our procedure on large numbers, where we enter an endless loop due to the computer not
being able to calculate a better guess. |#

; Example of the procedure failing with a small radicand (commented it out since it enters an endless loop):
(display "Square root of 999999999999999999999 with good-enough?: get's stuck in an infinite loop")
; (sqrt 999999999999999999999)

;Alternative implementation without good-enough? proposed by the book: 

(define (new_sqrt-iter new_guess x old_guess)
  (cond
    ((< (/ (abs (- old_guess new_guess)) old_guess) 0.001)
      new_guess)
      (else
       (new_sqrt-iter (improve new_guess x) x new_guess))))


(define (new_sqrt x)
  (new_sqrt-iter (improve 1.0 x) x 1.0))

; As we can see now, both of our old test cases for large and small numbers work with good accuracy:
(display "\nSquare root of 0.0000009 without good-enough?: ")
(new_sqrt 0.0000009)
(display "Square root of 999999999999999999999 without good-enough?: ")
(new_sqrt 999999999999999999999)
