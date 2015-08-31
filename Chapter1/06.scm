(define (new-sqrt x)
  
  (define (new-if predcate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)))
  
  (define (square x)
    (* x x))
  
  (define (good-enough guess x)
    (< (abs (- (square guess)
               x))
       0.01))
  
  (define (improve guess x)
    (/ (+ (/ x
             guess)
          guess)
       2))
  
  (define (_iter guess x)
    (new-if (good-enough guess x)
        guess
        (_iter (improve guess x) x)))
  (_iter 1 x))

(new-sqrt 100)

;The order of "new-if" is applicative order, two case will be processed at first, and that of "if" is special.
;"new-if" will not stop until all arguments are primitive operations. 