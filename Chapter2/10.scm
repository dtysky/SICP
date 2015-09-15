 #lang planet neil/sicp

(define (make-interval a b)
  (cons a b))

(define (upper-bound interval)
  (cdr interval))

(define (lower-bound interval)
  (car interval))

(define (mul-interval i1 i2)
  (let ((p1 (* (lower-bound i1) (lower-bound i2)))
        (p2 (* (upper-bound i1) (upper-bound i2)))
        (p3 (* (upper-bound i1) (lower-bound i2)))
        (p4 (* (lower-bound i1) (upper-bound i2))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval i1 i2)
  (if
   (<= (* (upper-bound i2) (lower-bound i2)) 0)
   (error "This interval crosses 0 !")
   (mul-interval
    i1
    (make-interval
     (/ 1 (lower-bound i2))
     (/ 1 (upper-bound i2))))))


(define test-num
  '(((1 4) ( 3 6))
    ((3 9) (-4 7))))

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
    (display "div : ")
    (display (div-interval i1 i2))
    (newline)
    (newline)))

(map (lambda (pair)
       (test pair))
     test-num)


;pair : ((1 4) (3 6))
;i1 : (1 . 4)
;i2 : (3 . 6)
;div : (1/6 . 4/3)

;pair : ((3 9) (-4 7))
;i1 : (3 . 9)
;i2 : (-4 . 7)
;div : This interval crosses 0 !