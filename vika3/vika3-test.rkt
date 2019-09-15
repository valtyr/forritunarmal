#lang racket/base

(require rackunit "vika3.scm")

(check-equal? ((daemieitt 3) 6) 3/2)

(check-equal? (daemithrju 5) (expt 5 4))
(check-equal? (daemithrju 3) (expt 3 4))
(check-equal? (daemithrju 777) (expt 777 4))


