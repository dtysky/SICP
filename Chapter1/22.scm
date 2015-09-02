#lang planet neil/sicp

(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a ) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (is-odd? x)
  (not (= (remainder x 2) 0)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
         
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      false))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (search-for-primes range-l range-r nums)
  (cond ((or (= range-l range-r)
             (= nums 0))
         (newline))
        ((not (is-odd? range-l))
         (search-for-primes (+ range-l 1) range-r nums))
        ((timed-prime-test range-l)
         (search-for-primes (+ range-l 2)
                            range-r (- nums 1)))
        (else (search-for-primes (+ range-l 2)
                                 range-r nums))))

(search-for-primes 10000000000 20000000000 3)
(search-for-primes 100000000000 200000000000 3)
(search-for-primes 1000000000000 2000000000000 3)

;10000000019 *** 131129
;10000000033 *** 140631
;10000000061 *** 140634

;100000000003 *** 406269
;100000000019 *** 353857
;100000000057 *** 359392

;1000000000039 *** 1197744
;1000000000061 *** 1107610
;1000000000063 *** 1192759