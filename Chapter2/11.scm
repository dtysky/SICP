 #lang planet neil/sicp

(define (make-interval a b)
  (cons a b))

(define (upper-bound interval)
  (cdr interval))

(define (lower-bound interval)
  (car interval))

(define (mul-interval i1 i2)
  (let ((u1 (upper-bound i1))
        (u2 (upper-bound i2))
        (l1 (lower-bound i1))
        (l2 (lower-bound i2)))
    (cond ((and (>= u1 0) (>= u2 0) (>= l1 0) (>= l2 0))
           (make-interval (* l1 l2) (* u1 u2)))
          ((and (>= u1 0) (>= u2 0) (>= l1 0) (< l2 0))
           (make-interval (* l1 l2) (* u1 u2)))
          ((and (< u1 0) (< u2 0) (< l1 0) (< l2 0))
           (make-interval (* u1 u2) (* l1 l2)))
          ((and (>= u1 0) (< u2 0) (< l1 0) (< l2 0))
           (make-interval (* u1 l2)) (* u2 l1))
          ((and (< u1 0) (>= u2 0) (< l1 0) (< l2 0))
           (make-interval (* u2 l2) (* u1 l2)))
          ((and (>= u1 0) (>= u2 0) (< l1 0) (< l2 0))
           (cond ((and (> u1 (abs l1)) (> u2 (abs l2)))
                 (make-interval (min (* u1 l2) (* u2 l1))
                                (* u1 u2)))
                 ((and (< u1 (abs l1)) (< u2 (abs l2)))
                 (make-interval (min (* u1 l2) (* u2 l1))
                                (* l1 l2)))
                 (else
                  (make-interval (min (* u1 l2) (* u2 l1))
                                (max (* u1 u2) (* l1 l2)))))))))

;This problem does not have right solution.
;When u1 > 0, u2 > 0, l1 < 0, l2 < 0, three or four multiplications must be used.
  

(define test-num
  '(((1 4) ( 3 6))
    ((-8 9) (-5 2))))

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
    (display "mul : ")
    (display (mul-interval i1 i2))
    (newline)
    (newline)))

(map (lambda (pair)
       (test pair))
     test-num)


;pair : ((1 4) (3 6))
;i1 : (1 . 4)
;i2 : (3 . 6)
;mul : (3 . 24)

;pair : ((-8 9) (-5 2))
;i1 : (-8 . 9)
;i2 : (-5 . 2)
;mul : (-45 . 40)