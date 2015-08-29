(define (cube-root x)
  (define (square x)
    (* x x))
  
  (define (cube x)
    (* x x x))
  
  (define (good-enough guess x)
    (< (abs (- (cube guess)
               x))
       0.01))
  
  (define (improve guess x)
    (/ (+ (/ x
             (square guess))
          (* 2 guess))
       3))
  
  (define (_iter guess x)
    (if (good-enough guess x)
        guess
        (_iter (improve guess x) x)))
  (_iter 1 x))

(cube-root 100)