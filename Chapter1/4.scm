(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;It is equivalent to
(define (a-plus-abs-b-2 a b)
  (if (> b 0)
      (+ a b)
      (- a b)))


(a-plus-abs-b 1 2)
(a-plus-abs-b-2 1 2)