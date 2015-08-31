(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

;In normal order, the (test) will be repleaced at first
;In applicative order, all values will be processed at first
;If normal order, it will give the result; otherwise, it will get a never-ending loop because of the expansion of (p).
;I use DrRacket to run this, it's applicative order.