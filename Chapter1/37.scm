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
      

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)

;0.6181818181818182

(define (cont-frac-iter n d k)
  (define (_iter n d k now result)
    (let ((n-value (n now))
          (d-value (d now)))
      (if (> now k)
          result
          (_iter n
                 d
                 k
                 (+ now 1)
                 (/ n-value
                    (+ d-value result))))))
  (_iter n d k 1 0))


(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)

;0.6179775280898876