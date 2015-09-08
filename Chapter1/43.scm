#lang planet neil/sicp

(define (repeat g n)
  (lambda (x)
    (define (_call i)
      (if (= i 1)
          (g x)
          (g (_call (- i 1)))))
    (_call n)))

(define (square x)
  (* x x))

(display ((repeat square 2) 5))

;625