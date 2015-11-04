 #lang planet neil/sicp

(define (make-interval a b)
  (cons a b))

(define (upper-bound interval)
  (cdr interval))

(define (lower-bound interval)
  (car interval))

(define (add-interval i1 i2)
  (make-interval
   (+ (lower-bound i1) (lower-bound i2))
   (+ (upper-bound i1) (upper-bound i2))))

(define (sub-interval i1 i2)
  (make-interval
   (- (lower-bound i1) (lower-bound i2))
   (- (upper-bound i1) (upper-bound i2))))

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
     (/ 1.0 (upper-bound i2))
     (/ 1.0 (lower-bound i2))))))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define test-num
  '(((10 1) (100 1))
    ((10 0.01) (100 0.01))))

(define (test pair)
  (let ((r1 (make-interval
             (car (car pair))
             (cadr (car pair))))
        (r2 (make-interval
             (car (cadr pair))
             (cadr (cadr pair)))))
    (display "pair : ")
    (display pair)
    (newline)
    (display "r1 : ")
    (display r1)
    (newline)
    (display "r2 : ")
    (display r2)
    (newline)
    (newline)
    (display "Result : ")
    (newline)
    (display "par1 : ")
    (display (par1 r1 r2))
    (newline)
    (display "par2 : ")
    (display (par2 r1 r2))
    (newline)
    (newline)
    (display "A/A : ")
    (newline)
    (display "r1 : ")
    (display (div-interval r1 r1))
    (newline)
    (display "r2 : ")
    (display (div-interval r2 r2))
    (newline)
    (newline)
    (display "A/B : ")
    (newline)
    (display "r1/r2 : ")
    (display (div-interval r1 r2))
    (newline)
    (display "r2/r1 : ")
    (display (div-interval r2 r1))
    (newline)
    (newline)))

(map (lambda (pair)
       (test pair))
     test-num)


;pair : ((10 1) (100 1))
;r1 : (10 . 1)
;r2 : (100 . 1)

;Result : 
;par1 : (1/110 . 500)
;par2 : (1/2 . 100/11)

;A/A :
;r1 : (1/10 . 10)
;r2 : (1/100 . 100)

;A/B : 
;r1/r2 : (1/100 . 10)
;r2/r1 : (1/10 . 100)

;pair : ((10 0.01) (100 0.01))
;r1 : (10 . 0.01)
;r2 : (100 . 0.01)

;Result : 
;par1 : (9.09090909090909e-007 . 50000.0)
;par2 : (0.005 . 9.090909090909092)

;A/A :
;r1 : (0.001 . 1000.0)
;r2 : (0.0001 . 10000.0)

;A/B : 
;r1/r2 : (0.0001 . 1000.0)
;r2/r1 : (0.001 . 10000.0)

