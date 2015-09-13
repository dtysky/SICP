#lang planet neil/sicp

(define (make-rat n d)
  (let ((g (gcd n d)))
  (cons
   (if (> (* n d) 0)
       (/ (abs n) g)
       (- 0 (/ (abs n) g)))
   (/ (abs d) g))))

(define (numer rat)
  (car rat))

(define (denom rat)
  (cdr rat))

(define (print rat)
  (display (numer rat))
  (display " / ")
  (display (denom rat)))

(define test-num
  '((2 4)
    ( -2 4)
    (2 -4)
    (-2 -4)))

(define (test rat)
  (display rat)
  (newline)
  (print (make-rat (car rat) (car (cdr rat))))
  (newline)
  (newline))

(map (lambda (rat)
       (test rat))
     test-num)

;(2 4)
;1 / 2

;(-2 4)
;-1 / 2

;(2 -4)
;-1 / 2

;(-2 -4)
;1 / 2