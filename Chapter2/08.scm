 #lang planet neil/sicp

(define (make-interval a b)
  (cons a b))

(define (upper-bound interval)
  (cdr interval))

(define (lower-bound interval)
  (car interval))

(define (sub-interval i1 i2)
  (make-interval
   (- (upper-bound i1) (upper-bound i2))
   (- (lower-bound i1) (lower-bound i2))))


(define test-num
  '(((0 4) ( 3 6))
    ((-3 9) (5 10))))

(define (test pair)
  (let ((i1 (make-interval
             (car (car pair))
             (cadr (car pair))))
        (i2 (make-interval
             (car (cadr pair))
             (cadr (cadr pair)))))
    (display "pair : ")
    (display pair)
    (newline)
    (display "i1 : ")
    (display i1)
    (newline)
    (display "i2 : ")
    (display i2)
    (newline)
    (display "sub : ")
    (display (sub-interval i1 i2))
    (newline)
    (newline)))

(map (lambda (pair)
       (test pair))
     test-num)


;pair : ((0 4) (3 6))
;i1 : (0 . 4)
;i2 : (3 . 6)
;sub : (-2 . -3)

;pair : ((-3 9) (5 10))
;i1 : (-3 . 9)
;i2 : (5 . 10)
;sub : (-1 . -8)