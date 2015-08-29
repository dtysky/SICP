;x and y are all start from 1
(define (pascal x y)
  (cond ((= y 1) 1)
        ((or (= x 1)
              (= x y))
         1)
        ((or (< x 1)
            (> x y))
            0)
        (else (+ (pascal x
                        (- y 1))
                 (pascal (- x 1)
                        (- y 1))))))