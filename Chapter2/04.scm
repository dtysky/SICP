 #lang planet neil/sicp

(define (my-cons x y)
  (lambda (m) (m x y)))

(define (my-car z)
  (z (lambda (p q) p)))

;(my-car (my-cons 1 2))
;(my-car(lambda (m) (m x y)))
;((lambda (p q) p) x y)
;x

(define (my-cdr z)
  (z (lambda (p q) q)))

;(my-cdr (my-cons 1 2))
;(my-cdr(lambda (m) (m x y)))
;((lambda (p q) q) x y)
;y