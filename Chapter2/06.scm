 #lang planet neil/sicp

(define zero
  (lambda (f) (lambda (x) x)))

(define (inc n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one
  (lambda (f) (lambda (x) (f ((lambda (x) x) x)))))

(define two
  (lambda (f) (lambda (x) (f ((lambda (x)(f ((lambda (x) x) x))) x)))))

(display "one : ")
(display one)
(newline)
(display "two : ")
(display two)

;one : #<procedure:one>
;two : #<procedure:two>