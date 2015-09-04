#lang planet neil/sicp

(define (sum-iter term a next b)
  (define (_iter a result)
    (if (> a b)
        result
        (_iter (next a)
               (+ (term a) result))))
  (_iter a 0))


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
  (* (/ h 3) (sum-iter term 0 inc n)))


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