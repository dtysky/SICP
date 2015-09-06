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
      

(define (e-2 k)
  (define (nk k) 1)
  (define (dk k)
    (if (= (remainder (+ k 1) 3) 0)
        (* (/ (+ k 1) 3) 2)
        1.0))
  (cont-frac nk dk k))

(display "e = ")
(display (+ (e-2 10) 2))