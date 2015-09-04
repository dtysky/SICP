#lang planet neil/sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (define h
    (/ (- b a) n))
  (define (inc k)
    (+ k 1))
  (define (process-y k)
    (+ a (* k h)))
  (define (term k)
    (cond ((or (= k 0) (= k n))
           (f (process-y k)))
          ((= (remainder k 2) 1)
           (* 4 (f (process-y k))))
          (else
           (* 2 (f (process-y k))))))
  (* (/ h 3) (sum term 0 inc n)))


(define (cube x)
  (* x x x))

(define test-num '(100 1000))

(define (test-cube x)
  (display x)
  (display " *** ")
  (display (simpson cube 0 1 x))
  (newline))

(map (lambda (x)
     (test-cube x))
     test-num)

;100 *** 1/4
;1000 *** 1/4