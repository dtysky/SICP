(define (new-sqrt x)
  
  (define (square x)
    (* x x))
  
  (define (good-enough guess x)
    (< (abs (- guess
               x))
       1))
  
  (define (improve guess x)
    (/ (+ (/ x
             guess)
          guess)
       2))
  
  (define (_iter guess x)
    (if (good-enough guess
                         (improve guess x))
        guess
        (_iter (improve guess x) x)))
  (_iter 1 x))

(new-sqrt 100)