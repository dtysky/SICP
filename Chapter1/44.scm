#lang planet neil/sicp

(define dx 0.00001)

(define (average-of-3 a b c)
  (/ (+ a b c) 3))

(define (smooth f)
  (lambda (x)
    (average-of-3
     (f (- x dx))
     (f x)
     (f (+ x dx)))))

(define (repeat g n)
  (lambda (x)
    (define (_call i)
      (if (= i 1)
          (g x)
          (g (_call (- i 1)))))
    (_call n)))

(define (repeated-sooth f n)
  (repeat (smooth f) n))

(define (square x)
  (* x x))

(display ((repeated-sooth square 2) 5))

;625.0000000033998