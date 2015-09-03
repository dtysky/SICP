#lang planet neil/sicp

(define (square x)
  (* x x))

(define (trivial-square a n)
  (if (and (not (= a
                   (- n 1)))
           (not (= a 1))
           (= (remainder (square a) n) 1))
      0
      a))
  

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (trivial-square (expmod base (/ exp 2) m) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-rabin n)
  (define (check a n)
    (cond ((= a n) true)
          ((= (expmod a
                      (- n 1)
                      n)
              1)
          (check (+ a 1) n))
          (else false)))
  (if (check 2 n)
      "Yes"
      "No"))

(define (test x)
  (display x)
  (display " *** ")
  (display (miller-rabin x))
  (newline))

(define test-num '(3 7 13 211 561 1105 1729 2465 2821 6601))

(map (lambda (x) (test x))
       test-num)

;3 *** Yes
;7 *** Yes
;13 *** Yes
;211 *** Yes
;561 *** No
;1105 *** No
;1729 *** No
;2465 *** No
;2821 *** No
;6601 *** No