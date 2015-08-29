(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 11)

; (cc 11 5)

; (+ (cc 11 4) (cc -39 5))

; (+ (cc 11 3) (cc -14 4))

; (+ (cc 11 2) (cc 1 3))

; (+ (cc 11 1) (cc 6 2) (cc 1 2) (cc -9 3))

; (+ (cc 11 0)
;    (cc 10 1)
;    (cc 6 1)
;    (cc 1 2)
;    (cc 1 1)
;    (cc -4 2))

; (+ (cc 10 0)
;    (cc 9 1)
;    (cc 6 0)
;    (cc 5 1)
;    (cc 1 1)
;    (cc 0 1)
;    (cc 1 0)
;    (cc -4 1))

; (+ (cc 8 1) (cc 4 1) (cc 0 1) 1)

; (+ 1 1 1 1)

; 4

;The time complexity depends on how many kinds of coins could the result have.
;for example, if n in 1 to 5, only coin which valued 1 can be a part of result, so it's time complexity is O(n).
;if the result has a kinds of coins, the time complexity is O(n ^ a).

;The space complexity is O(n), it depends on the branchs.