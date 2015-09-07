#lang planet neil/sicp

(define (close-enough? a b)
    (< (abs (- a b)) 0.001))

(define (fixed-point f x)
  (let ((fx (f x)))
    (if (close-enough? fx x)
        fx
        (fixed-point f fx))))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx 0.00001)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x) (+ (* x x x)
                 (* a x x)
                 (* b x)
                 c)))

(define (root-of-cubic a b c)
  (newton-method (cubic a b c) 1))

(display "a = 1, b = 2, c = 3")
(newline)
(display (root-of-cubic 1 2 3))

;a = 1, b = 2, c = 3
;-1.27568238137649