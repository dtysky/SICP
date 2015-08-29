(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* (f (- n 2)) 2)
         (* (f (- n 3)) 3))))


(define (f-iter n)
  (define (_iter a b c n)
   (cond ((< n 2) n)
         ((= n 2) a)
         (else (_iter (+ a
                   (* 2 b)
                   (* 3 c))
                a
                b
                (- n 1)))))
  (_iter 2 1 0 n))

(f 1)
(f-iter 1)

(f 4)
(f-iter 4)