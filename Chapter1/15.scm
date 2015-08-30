(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.12)

;a) x / (3 ^ n) <= 0.1
; 10 * x <= 3 ^ n
; n >= log3(10 * x)
; x = 12.15, n = 5

;b) time: O(log3(a))
;space: O(n)