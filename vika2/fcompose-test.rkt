#lang racket/base

(require rackunit "fcompose.rkt")

; Define helper functions for test
(define (plus5 x) (+ 5 x))
(define (times3 x) (* 3 x))

(check-equal? (plus5 5) 10)
(check-equal? (times3 3) 9)

; Test fcompose
(check-equal? ((fcompose plus5 times3) 5) 30)

