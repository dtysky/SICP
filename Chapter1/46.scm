#lang planet neil/sicp

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (define (_call guess)
      (if (good-enough? guess)
          guess
          (_call (improve guess))))
    (_call guess)))

(define (square x)
  (* x x))

(define (sqrt x)
  (define (sqrt-good-enough? guess)
    (< (abs (- (square guess) x)) 0.01))
  (define (sqrt-improve guess)
    (/ (+ guess (/ x guess)) 2))
  ((iterative-improve sqrt-good-enough? sqrt-improve) 1.0))

(define (fixed-point f)
  (define (fp-good-enough? guess)
    (< (abs (- (f guess) guess)) 0.01))
  (define (fp-improve guess)
    (/ (+ (f guess) guess) 2))
  ((iterative-improve fp-good-enough? fp-improve) 1.0))

(define test-num '(2 3 4 5 6 7 8 9))

(define (test x)
  (display x)
  (display " ** normal ** ")
  (display (sqrt x))
  (newline)
  (display x)
  (display " ** fixed-point ** ")
  (display (fixed-point (lambda (y) (/ x y))))
  (newline)
  (newline))

(display "test for sqrt")
(newline)

(map (lambda (x)
     (test x))
     test-num)

;test for sqrt
;2 ** normal ** 1.4166666666666665
;2 ** fixed-point ** 1.4166666666666665

;3 ** normal ** 1.7321428571428572
;3 ** fixed-point ** 1.7321428571428572

;4 ** normal ** 2.000609756097561
;4 ** fixed-point ** 2.000609756097561

;5 ** normal ** 2.238095238095238
;5 ** fixed-point ** 2.238095238095238

;6 ** normal ** 2.4494943716069653
;6 ** fixed-point ** 2.454256360078278

;7 ** normal ** 2.64576704419029
;7 ** fixed-point ** 2.64576704419029

;8 ** normal ** 2.8284685718801468
;8 ** fixed-point ** 2.8284685718801468

;9 ** normal ** 3.00009155413138
;9 ** fixed-point ** 3.00009155413138