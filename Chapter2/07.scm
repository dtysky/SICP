 #lang planet neil/sicp

(define (make-interval a b)
  (cons a b))

(define (upper-bound interval)
  (cdr interval))

(define (lower-bound interval)
  (car interval))

(define test-num
  '((2 3)
    (4 9)
    (3 8)
    (33 50)))

(define (test pair)
  (let ((z (make-interval (car pair) (cadr pair))))
    (display "pair : ")
    (display pair)
    (newline)
    (display "interval : ")
    (display z)
    (newline)
    (display "upper-bound : ") 
    (display (upper-bound z))
    (newline)
    (display "lower-bound : ")
    (display (lower-bound z))
    (newline)
    (newline)))

(map (lambda (pair)
       (test pair))
     test-num)


;pair : (2 3)
;interval : (2 . 3)
;upper-bound : 3
;lower-bound : 2

;pair : (4 9)
;interval : (4 . 9)
;upper-bound : 9
;lower-bound : 4

;pair : (3 8)
;interval : (3 . 8)
;upper-bound : 8
;lower-bound : 3

;pair : (33 50)
;interval : (33 . 50)
;upper-bound : 50
;lower-bound : 33