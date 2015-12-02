 #lang planet neil/sicp

(define (for-each f items)
  (if (null? items)
       #t
      (begin
        (f (car items))
        (for-each f (cdr items)))))

(define test-num
  '((1 2 3 4)
    (4 3 2 1)))

(define (test ls)
  (display "list : ")
  (display ls)
  (newline)
  (display "for-each : ")
  (for-each (lambda (x) (newline) (display x)) ls)
  (newline)
  (newline))

(map (lambda (ls)
       (test ls))
     test-num)


;list : (1 2 3 4)
;for-each : 
;1
;2
;3
;4
;
;list : (4 3 2 1)
;for-each : 
;4
;3
;2
;1
