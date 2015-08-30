(define (fast-expt-iter b n)
  (define (square x)
    (* x x))
  (define (even n)
    (= (remainder n 2) 0))
  (define (_iter a b n)
    (cond ((= n 0) a)
          ((even n) (_iter a
                           (square b)
                           (/ n 2)))
          (else (_iter (* a b)
                       b
                       (- n 1)))))
  (_iter 1 b n))