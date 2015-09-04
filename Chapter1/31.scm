#lang planet neil/sicp

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (_iter a result)
    (if (> a b)
        result
        (_iter (next a)
               (* (term a) result))))
  (_iter a 1))

(define (self x) x)

(define (inc x)
  (+ x 1))

(define (fact-common term x)
  (product term 1 inc x))

(define (fact x)
  (fact-common self x))

(define (square x)
  (* x x))

(define (double x)
  (* 2 x))

(define (double-plus-1 x)
  (+ (double x) 1))

;pi/2 = 2 * (pi/4) = (2 * 2 * 4 * 4 ... * 2(n + 1)) / (3 * 3 * 5 * 5 ... * (2n + 1) * (2n + 1)) 

(define (pi times)
  (*
   (/
    (square (fact-common double times))
    (square (fact-common double-plus-1 times)))
   2
   (+ times 1)
   2.0))


(display "pi = ")
(display (pi 1000))

;pi = 3.142377365093878