#lang planet neil/sicp

(define (repeat g n)
  (if (= n 0)
      (lambda (x) (g x))
      (lambda (x) ((repeat g (- n 1)) x))))

(define (square x)
  (* x x))

(display ((repeat square 2) 5))

;25