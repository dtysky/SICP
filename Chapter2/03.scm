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

(define (make-rect left-top right-buttom)
  (make-segment left-top right-buttom ))

(define (left rect)
  (x-point (start-segment rect)))

(define (right rect)
  (x-point (end-segment rect)))

(define (top rect)
  (y-point (start-segment rect)))

(define (buttom rect)
  (y-point (end-segment rect)))

(define (height rect)
  (- (top rect)
      (buttom rect)))

(define (width rect)
  (- (right rect)
      (left rect)))

(define (area rect)
  (* (width rect)
     (height rect)))

(define (perimeter rect)
  (* (+ (width rect)
        (height rect))
     2))

(define test-num
  '(((0 4) ( 4 0))
    ((-3 9) (5 -2))))

(define (test point-pair)
  (let ((rect
         (make-rect
          (let ((sp (car point-pair)))
            (make-point (car sp) (cadr sp)))
          (let ((ep (car (cdr point-pair))))
            (make-point (car ep) (cadr ep))))))
    (display point-pair)
    (newline)
    (display "area : ")
    (display (area rect))
    (newline)
    (display "perimeter : ")
    (display (perimeter rect))
    (newline)
    (newline)))

(map (lambda (point-pair)
       (test point-pair))
     test-num)

;((0 4) (4 0))
;area : 16
;perimeter : 16

;((-3 9) (5 -2))
;area : 88
;perimeter : 38
