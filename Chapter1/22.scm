#lang planet neil/sicp

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (is-odd? x)
  (not (= (remainder x 2) 0)))

(define (prime? n)
  (fast-prime? n (- n 1)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (newline))
         
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      false))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (search-for-primes range-l range-r)
  (cond ((= range-l range-r) false)
        ((not (is-odd? range-l)) (search-for-primes (+ range-l 1)
                                                    range-r))
        ((start-prime-test range-l (runtime)) range-l)
        (else (search-for-primes (+ range-l 2)
                                 range-r))))

(search-for-primes 10000 20000)
(search-for-primes 100000 200000)
                                     