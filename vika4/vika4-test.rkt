#lang racket/base

(require rackunit "vika4.scm")

(check-equal? (revindex 5) '(5 4 3 2 1))
(check-equal? (revindex 0) '())

