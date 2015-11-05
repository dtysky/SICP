 #lang planet neil/sicp

(define (last-pair ls)
  (cond ((null? (cdr ls)) ls)
        (else (last-pair (cdr ls)))))

(define test-num
  '((list 1 2 3 4)
    (list 4 3 2 1)))

(define (test ls)
  (display "list : ")
  (display ls)
  (newline)
  (display "last-pair : ")
  (display (last-pair ls))
  (newline)
  (newline))

(map (lambda (ls)
       (test ls))
     test-num)


;list : (list 1 2 3 4)
;last-pair : (4)

;list : (list 4 3 2 1)
;last-pair : (1)

