#lang racket/base

(require rackunit "vika2.scm")

; Define helper functions for test
(define (plus5 x) (+ 5 x))
(define (times3 x) (* 3 x))

(check-equal? (plus5 5) 10)
(check-equal? (times3 3) 9)

; Test fcompose
(check-equal? ((fcompose plus5 times3) 5) 20)

; Test sqall
(check-equal? (sqall '(1 2 3 4)) '(1 4 9 16))

; Test sqallrev
(check-equal? (sqallrev '(1 2 3 4)) '(16 9 4 1))

; Test myif
(check-equal? ((myif 1 2) #t) 1)
(check-equal? ((myif 1 2) #f) 2)
