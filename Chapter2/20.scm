 #lang planet neil/sicp

(define (reverse ls)
  (cond ((null? (cdr ls))
         (car ls))
        (else (cons (reverse (cdr ls))
                             (car ls)))))

(define test-num
  '((list 1 2 3 4)
    (list 4 3 2 1)))

(define (test ls)
  (display "list : ")
  (display ls)
  (newline)
  (display "reverse : ")
  (display (reverse ls))
  (newline)
  (newline))

(map (lambda (ls)
       (test ls))
     test-num)


;list : (list 1 2 3 4)
;reverse : ((((4 . 3) . 2) . 1) . list)

;list : (list 4 3 2 1)
;reverse : ((((1 . 2) . 3) . 4) . list)

