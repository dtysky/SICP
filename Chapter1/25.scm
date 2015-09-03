#lang planet neil/sicp

(define (square x)
  (* x x))

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

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))



(define (new-expmod base exp m)
  (remainder (fast-expt-iter base exp) m))

(display (expmod 2 10 3))
(newline)
(display (new-expmod 2 10 3))

;Both algorithms are ok, but the "new-exptmod" needs more memory and calculations for storing and processing the large number.