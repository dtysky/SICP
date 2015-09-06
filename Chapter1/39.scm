#lang planet neil/sicp

;f(k - 1) = N(k - 1) / (D(k - 1) + f(k))

(define (cont-frac n d k)
  (define (cont-frac-inr n d k max-k)
    (let ((n-value (n (- max-k k)))
          (d-value (d (- max-k k))))
      (if (= k 0)
          0
          (/ n-value
             (+ d-value (cont-frac-inr n d (- k 1) max-k))))))
  (cont-frac-inr n d (- k 1) k))
      

(define (tan x k)
  (define (nk k)
    (if (= k 1)
        x
        (- (* x x))))
  (define (dk k)
    (- (* 2 k) 1.0))
  (cont-frac nk dk k))

(display "tan(5) = ")
(display (tan 5 10))

;tan(5) = -3.3831320829619007