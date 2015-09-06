#lang planet neil/sicp

;x = 1 + 1/x
;x^2 = x + 1

(define (fixed-point f x)
  (define (close-enough? a b)
    (< (abs (- a b)) 0.01))
  (let ((fx (f x)))
    (if (close-enough? fx x)
        fx
        (fixed-point f fx))))

(display "x = ")
(display (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
      
;x = 1.6153846153846154