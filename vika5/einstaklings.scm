#lang scheme

;; Notkun: (byltalista lst)
;; Fyrir: lst er listi jafnlangra lista,
;; z=((x11 x12 ... x1N)
;; (x21 x22 ... x2N)
;; (x31 x32 ... x3N)
;; .
;; .
;; .
;; (xM1 xM2 ... xMN)
;; )
;; Gildi: Listinn sem er byltingin
;; (transpose) af lst, þ.e.
;; ((x11 x21 ... xM1)
;; (x12 x22 ... xM2)
;; (x13 x23 ... xM3)
;; .
(define (byltalista lst)
  ;; Notkun: (hjalp rows)
  ;; Fyrir: rows er listi af sömu lengd og lst
  ;; með undirlista (allir jafn langir) af gildum
  ;; af lengd lst eða styttri.
  ;; Gildi: transpose af lst
  (define (hjalp rows)
    (if (eqv? 0 (length (car rows)))
      '()
      (cons
        (map (lambda (row) (car row)) rows)
        (hjalp (map (lambda (row) (cdr row)) rows)))))
  (hjalp lst))


;; Notkun: (RealPow_recursive x y)
;; Fyrir: x er rauntala, y er heiltala
;; Gildi: x í veldinu af y
;;
(define (RealPow_recursive x y)
  (if (= y 0)
    1
    (if (= y 1)
      x
      (if (= (remainder y 2) 0)
        (RealPow_recursive (* x x) (quotient y 2))
        (* x (RealPow_recursive (* x x) (quotient y 2)))))))

;; Notkun: (RealPow_loop x y)
;; Fyrir: x er rauntala, y er heiltala
;; Gildi: Rauntala x í veldinu af y
;;
(define (RealPow_loop x y)
  ;; Notkun  (hjalp r p q)
  ;; Fyrir:  r er heiltala,
  ;;         p er 1.0,
  ;;         q er rauntala.
  ;; Gildi:  Rauntala q^r
  (define (hjalp r p q)
    (if (= r 0)
      p
      (if (eqv? (remainder r 2) 0)
        (hjalp (quotient r 2) p (* q q))
        (hjalp (quotient r 2) (* p q) (* q q)))))
  (hjalp y 1 x))
