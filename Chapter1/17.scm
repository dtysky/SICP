(define (double x)
  (* 2 x))

(define (halve x)
  (/ x 2))

(define (even b)
  (= (remainder b 2) 0))

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))
                       
;b == 0:
;f(a, b) = 0

;b % 2 == 0:
;f(a, b) = 2 * f(a, b / 2)

;b % 2 != 0:
;f(a, b) = a + f(a , b - 1)