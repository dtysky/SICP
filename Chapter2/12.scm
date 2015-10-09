 #lang planet neil/sicp

;c1(1 - p1) * c2(1 - p2)
;= c1 * c2 * (1 + p1 * p2 - (p1 + p2))
;= (c1 * c2) * (1 - (p1 + p2)) 

;c1(1 + p1) * c2(1 + p2)
;= c1 * c2 * (1 + p1 * p2 + (p1 + p2))
;= (c1 * c2) * (1 + (p1 + p2))


(define (make-interval c p)
  (cons (* c (- 1 p))
        (* c (+ 1 p))))

(define (upper-bound interval)
  (cdr interval))

(define (lower-bound interval)
  (car interval))

(define (make-interval-percent c p)
  (cons c p))

(define (upper-bound-percent interval)
  (* (car interval)
     (+ 1 (cdr interval))))

(define (lower-bound-percent interval)
  (* (car interval)
     (- 1 (cdr interval))))

(define (quick-center i1 i2)
  (let ((c1 (car i1))
        (c2 (car i2)))
    (* c1 c2)))
  
(define (quick-error i1 i2)
  (let ((p1 (cdr i1))
        (p2 (cdr i2)))
    (+ p1 p2)))

(define (quick-mul-interval i1 i2)
  (make-interval-percent (quick-center i1 i2) (quick-error i1 i2)))

(define (mul-interval i1 i2)
  (let ((p1 (* (lower-bound i1) (lower-bound i2)))
        (p2 (* (upper-bound i1) (upper-bound i2)))
        (p3 (* (upper-bound i1) (lower-bound i2)))
        (p4 (* (lower-bound i1) (upper-bound i2))))
    (cons (min p1 p2 p3 p4)
          (max p1 p2 p3 p4))))

(define test-num
  '(((10 0.005) (3 0.04))
    ((1 0.002)(4 0.009))))

(define (test pair)
  (let ((i1 (make-interval-percent
             (car (car pair))
             (cadr (car pair))))
        (i2 (make-interval-percent
             (car (cadr pair))
             (cadr (cadr pair))))
        (i1-n (make-interval
             (car (car pair))
             (cadr (car pair))))
        (i2-n (make-interval
             (car (cadr pair))
             (cadr (cadr pair)))))
    (display "pair : ")
    (display pair)
    (newline)
    (display "i1 : ")
    (display i1-n)
    (newline)
    (display "i2 : ")
    (display i2-n)
    (newline)
    (display "mul-normal : ")
    (let ((i (mul-interval i1-n i2-n)))
      (display (lower-bound i))
      (display " ")
      (display (upper-bound i)))
    (newline)
    (display "mul-quick : ")
    (let ((i (quick-mul-interval i1 i2)))
      (display (lower-bound-percent i))
      (display " ")
      (display (upper-bound-percent i)))
    (newline)
    (newline)))

(map (lambda (pair)
       (test pair))
     test-num)


; pair : ((10 0.005) (3 0.04))
; i1 : (9.95 . 10.049999999999999)
; i2 : (2.88 . 3.12)
; mul-normal : 28.655999999999995 31.355999999999998
; mul-quick : 28.65 31.349999999999998

; pair : ((1 0.002) (4 0.009))
; i1 : (0.998 . 1.002)
; i2 : (3.964 . 4.036)
; mul-normal : 3.956072 4.044072
; mul-quick : 3.956 4.044