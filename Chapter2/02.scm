#lang planet neil/sicp

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (midpoint-segment segment)
  (make-point
   (/ (+ (x-point (start-segment segment))
         (x-point (end-segment segment)))
      2)
   (/ (+ (y-point (start-segment segment))
         (y-point (end-segment segment)))
      2)))

(define (print point)
  (display "(")
  (display (x-point point))
  (display ", ")
  (display (y-point point))
  (display ")"))

(define test-num
  '(((0 0) ( 4 4))
    ((-3 -2) (5 9))))

(define (test point-pair)
  (display point-pair)
  (newline)
  (print (midpoint-segment
          (make-segment
           (let ((sp (car point-pair)))
             (make-point (car sp) (car (cdr sp))))
           (let ((ep (car (cdr point-pair))))
             (make-point (car ep) (car (cdr ep)))))))
  (newline)
  (newline))

(map (lambda (point-pair)
       (test point-pair))
     test-num)

;((0 0) (4 4))
;(2, 2)

;((-3 -2) (5 9))
;(1, 7/2)