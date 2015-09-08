#lang planet neil/sicp

(define (close-enough? a b)
    (< (abs (- a b)) 0.001))

(define (fixed-point f x)
  (let ((fx (f x)))
    (if (close-enough? fx x)
        fx
        (fixed-point f fx))))

(define (average a b)
  (/ (+ a b) 2))

(define (average-dump f)
  (lambda (x)
    (average x (f x))))

(define (repeat g n)
  (lambda (x)
    (define (_call i)
      (if (= i 1)
          (g x)
          (g (_call (- i 1)))))
    (_call n)))

(define (gimme-damps n)
  (ceiling (- (/ (log (+ n 1)) (log 2)) 1)))

(define (x^n x n)
  (if (= n 0)
      1
      (* x (x^n x (- n 1)))))

(define (repeated-average-n n)
  (repeat average-dump n))

(define (root-of-n x n)
  (let ((f (lambda (y) (/ x (x^n y (- n 1))))))
        (fixed-point ((repeated-average-n (gimme-damps n)) f) 1.0)))

(define test-num '(2 3 4 5 6 7 8 9))

(define (test x)
  (let ((fx (x^n 2 x)))
    (display fx)
    (display " ")
    (display x)
    (display " *** ")
    (display (root-of-n fx x))
    (newline)))

(map (lambda (x)
     (test x))
     test-num)

;4 2 *** 2.0000000929222947
;8 3 *** 2.0002326972862416
;16 4 *** 2.0000000000021965
;32 5 *** 1.9999032063285413
;64 6 *** 2.000187828703668
;128 7 *** 2.0003548349118567
;256 8 *** 2.0000015055871168
;512 9 *** 1.999981489173085