 #lang planet neil/sicp

(define (xor a b)
  (cond ((or
         (and (= a 1) (= b 1))
         (and (= a 0) (= b 0)))
         1)
        (else 0)))
    

(define (is-odd num)
  (remainder num 2))

(define (same-parity a . b)
  (let ((parity (is-odd a)))
    (define (same-one n)
      (= (xor parity (is-odd n)) 1))
    (define (_iter nums result)
      (cond ((null? nums)
             result)
            (else 
             (cond ((same-one (car nums))
                    (_iter (cdr nums)
                           (cons result (car nums))))
                   (else (_iter (cdr nums) 
                                result))))))
    (_iter b a)))

(define (test)
  (display "list : (1 2 3 4 5 6 7)")
  (newline)
  (display "same-parity : ")
  (display (same-parity 1 2 3 4 5 6 7))
  (newline)
  (newline))

(test)

;list : (1 2 3 4 5 6 7)
;same-parity : (((1 . 3) . 5) . 7)

