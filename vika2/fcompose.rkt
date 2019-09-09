#lang scheme

;; Notkun: ((fcompose f g) x)
;; Fyrir:  f og eru einundarföll,
;;         f er löglegt viðfang í g,
;;         (g x) er löglegt viðfang í f.
;; Gildi:  (f (g x))
(define (fcompose f g)
  (lambda x (g (f x)))
)

(provide fcompose)

