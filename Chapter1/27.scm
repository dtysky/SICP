#lang planet neil/sicp

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (check-prime n)
  (define (check a n)
    (cond ((= a n) true)
          ((= (expmod a n n) a))
          ((check (+ a 1) n))
          (else false)))
  (if (check 2 n)
      "Yes"
      "No"))

(define (test x)
  (display x)
  (display " *** ")
  (display (check-prime x))
  (newline))

(define test-num '(561 1105 1729 2465 2821 6601))

(map (lambda (x) (test x))
       test-num)

;561 *** Yes
;1105 *** Yes
;1729 *** Yes
;2465 *** Yes
;2821 *** Yes
;6601 *** Yes