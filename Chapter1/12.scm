;x and y are all start from 1
(define (pasic x y)
  (cond ((= y 1) 1)
        ((or (= x 1)
              (= x y))
         1)
        ((or (< x 1)
            (> x y))
            0)
        (else (+ (pasic x
                        (- y 1))
                 (pasic (- x 1)
                        (- y 1))))))