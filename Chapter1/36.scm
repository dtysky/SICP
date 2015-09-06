#lang planet neil/sicp

(define (close-enough? a b)
    (< (abs (- a b)) 1))

(define (print x)
  (display x)
  (newline))

(define (fixed-point f x)
  (let ((fx (f x)))
    (print x)
    (if (close-enough? fx x)
        fx
        (fixed-point f fx))))

(define (average a b)
  (/ (+ a b) 2))

(define (fixed-point-aver f x)
  (let ((fx (f x)))
    (print x)
    (if (close-enough? fx x)
        fx
        (fixed-point f
                     (average fx x)))))


(display (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0))
(newline)
(newline)
(display (fixed-point-aver (lambda (x) (/ (log 1000) (log x))) 2.0))

;2.0
;9.965784284662087
;3.004472209841214
;6.279195757507157
;3.759850702401539
;5.215843784925895
;4.182207192401397
;4.8277650983445906

;2.0
;5.9828921423310435
;3.8614453002856424
;5.11291108116419
;4.233292577313064