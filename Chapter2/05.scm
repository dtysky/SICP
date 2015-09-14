 #lang planet neil/sicp

(define (my-cons a b)
  (*
   (expt 2 a)
   (expt 3 b)))

(define (my-car z)
  (define (_iter count z d)
    (if (= (remainder z d) 0)
        (_iter (+ count 1) (/ z d) d)
        count))
  (_iter 0 z 2))

(define (my-cdr z)
  (define (_iter count z d)
    (if (= (remainder z d) 0)
        (_iter (+ count 1) (/ z d) d)
        count))
  (_iter 0 z 3))

(define test-num
  '((2 3)
    (4 9)
    (3 8)
    (33 50)))

(define (test pair)
  (let ((z (my-cons (car pair) (cadr pair))))
    (display "pair : ")
    (display pair)
    (newline)
    (display "cons : ")
    (display z)
    (newline)
    (display "car : ") 
    (display (my-car z))
    (newline)
    (display "cdr : ")
    (display (my-cdr z))
    (newline)
    (newline)))

(map (lambda (pair)
       (test pair))
     test-num)

;pair : (2 3)
;cons : 108
;car : 2
;cdr : 3

;pair : (4 9)
;cons : 314928
;car : 4
;cdr : 9

;pair : (3 8)
;cons : 52488
;car : 3
;cdr : 8

;pair : (33 50)
;cons : 6166696758001434788842312625553408
;car : 33
;cdr : 50