(define (double x)
  (* 2 x))

(define (halve x)
  (/ x 2))

(define (even b)
  (= (remainder b 2) 0))

(define (fast-mult-iter a b)
  (define (_iter r a b)
    (cond ((= b 0) r)
          ((even b) (_iter r
                           (double a)
                           (halve b)))
          (else (_iter (+ r a)
                       a
                       (- b 1)))))
  (_iter 0 a b))
                       
;b == 0:
;f(a, b) = 0

;b % 2 == 0:
;f(a, b) = 2 * f(a, b / 2)

;b % 2 != 0:
;f(a, b) = a + f(a , b - 1)