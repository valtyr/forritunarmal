#lang scheme

(define revindex
  (lambda (x)
    (define inner
      (lambda (ls n)
        (if (not (eqv? n (+ x 1)))
          (inner (cons n ls) (+ n 1))
          ls)))
    (inner '() 1)))

(provide revindex)
