#lang planet neil/sicp

(define (filtered-accumulate filter combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((filter a)
         (combiner (term a)
                   (filtered-accumulate filter combiner null-value term (next a) next b)))
        (else (filtered-accumulate filter combiner null-value term (next a) next b))))

;(a)

(define (sum-filter filter term a next b)
  (filtered-accumulate filter + 0 term a next b))

(define (prime? n)
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
  (= n (smallest-divisor n)))

(define (self x) x)

(define (inc x)
  (+ x 1))

(define (sum-prime a b)
  (sum-filter prime? self a inc b))

(display "2 : 10")
(display " **sum** ")
(display (sum-prime 2 10))
(newline)

;2 : 10 **sum** 18
;2 3 5 7

;(b)

(define (mult-filter filter term a next b)
  (filtered-accumulate filter * 1 term a next b))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (mult-coprime n)
  (define (coprime a)
    (= (gcd a n) 1))
  (mult-filter coprime self 1 inc n))

(display "n = 10")
(display " **mult** ")
(display (mult-coprime 10))
(newline)

;n = 10 **mult** 189