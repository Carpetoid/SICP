#lang sicp

(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

#| Applicative-order interpreters evaluate combinations by evaluating the arguments then applying the procedure, whereas in
normal-order interpreters the procedure is applied first, then when the arguments are needed (when the procedure is primitive)
they're evaluated. So, since scheme uses an applicative-order interpreter, Ben's combination will be evaluated forever; the second
 argument, (p), will call the procedure 'p' forever since the body calls 'p' without a base case or a recursive case.
|#