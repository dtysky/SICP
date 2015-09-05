#lang planet neil/sicp

(define (f g)
  (g 2))

(f f)

;error:
;application: not a procedure;

;(f f) ->
;(f 2) ->
;(2 2)

;2 is not a procedure