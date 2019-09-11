#lang scheme

;; Notkun: ((fcompose f g) x)
;; Fyrir:  f og eru einundarföll, f er löglegt viðfang
;;         í g, (g x) er löglegt viðfang í f.
;; Gildi:  (f (g x))
(define (fcompose f g)
  (lambda (x) (f (g x)))
)


;; Notkun: (sqall x)
;; Fyrir:  x=(x1 ... xN) er listi talna.
;; Gildi:  Listinn (x1^2 ... xN^2)
(define (sqall x)
  ;; Notkun: (mymap f x)
  ;; Fyrir:  f er fall og x er listi
  ;; Gildi:  Listinn ((f x1) ... (f xN))
  (define (mymap f x) (if (null? x) '() (cons (f (car x)) (mymap f (cdr x)))))
  
  ;; Notkun: (sqr y)
  ;; Fyrir:  y er tala
  ;; Gildi:  talan y^2
  (define (sqr y) (* y y))
  
  (mymap sqr x)
)


;; Notkun: (sqallrev x)
;; Fyrir:  x=(x1 ... xN) er listi talna.
;; Gildi:  Listinn (xN^2 ... x1^2)
(define (sqallrev x)
  ;; Notkun: (revconcatsqr a b)
  ;; Fyrir:  a=(...) er listi talna
  ;;         b=(x1 ... xN) er listi talna.
  ;; Gildi:  Listinn (xN^2 ... x1^2 ... allar tölur í a)
  (define (revconcatsqr a b)
    (if (null? b)
      a
      (revconcatsqr (cons (* (car b) (car b)) a) (cdr b))
    )
  )
  (revconcatsqr '() x)
)


;; Notkun: (myif a b)
;; Fyrir:  a, b af hvaða tagi sem er
;; Gildi:  Fall af x sem skilar a ef x er satt annars b
(define (myif a b)
  (lambda (x) (if x a b))  
)



(provide fcompose sqall sqallrev myif)

