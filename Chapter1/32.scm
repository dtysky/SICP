#lang planet neil/sicp

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (accumulate-iter combiner null-value term a next b)
  (define (_iter a result)
    (if (> a b)
        result
        (_iter (next a)
               (combiner (term a) result))))
  (_iter a null-value))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))

(define (self x) x)

(define (inc x)
  (+ x 1))

(define (test x)
  (display x)
  (newline)
  (display " **sum** ")
  (display (sum self 1 inc x))
  (newline)
  (display " **sum-iter** ")
  (display (sum-iter self 1 inc x))
  (newline)
  (display " **fact** ")
  (display (product self 1 inc x))
  (newline)
  (display " **fact-iter** ")
  (display (product self 1 inc x))
  (newline)
  (newline))

(define test-num '(5 10 15 20))

(map (lambda (x) (test x))
       test-num)

5
; **sum** 15
; **sum-iter** 15
; **fact** 120
; **fact-iter** 120

;10
; **sum** 55
; **sum-iter** 55
; **fact** 3628800
; **fact-iter** 3628800

;15
; **sum** 120
; **sum-iter** 120
; **fact** 1307674368000
; **fact-iter** 1307674368000

;20
; **sum** 210
; **sum-iter** 210
; **fact** 2432902008176640000
; **fact-iter** 2432902008176640000