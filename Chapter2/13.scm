 #lang planet neil/sicp

(define (make-interval-percent c p)
  (cons (- c (* c p))
        (+ c (* c p))))

(define (upper-bound interval)
  (cdr interval))

(define (lower-bound interval)
  (car interval))


(define test-num
  '((10 0.1)
    (3 0.4)
    (-1 0.9)
    (-4 0.3)))

(define (test pair)
  (let ((i (make-interval-percent
           (car pair)
           (cadr pair))))
    (display "pair : ")
    (display pair)
    (newline)
    (display "i : ")
    (display i)
    (newline)
    (display "upper : ")
    (display (upper-bound i))
    (newline)
    (display "lower : ")
    (display (lower-bound i))
    (newline)
    (newline)))

(map (lambda (pair)
       (test pair))
     test-num)


; pair : (10 0.1)
; i : (9.0 . 11.0)
; upper : 11.0
; lower : 9.0

; pair : (3 0.4)
; i : (1.7999999999999998 . 4.2)
; upper : 4.2
; lower : 1.7999999999999998

; pair : (-1 0.9)
; i : (-0.09999999999999998 . -1.9)
; upper : -1.9
; lower : -0.09999999999999998

; pair : (-4 0.3)
; i : (-2.8 . -5.2)
; upper : -5.2
; lower : -2.8