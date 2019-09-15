#lang scheme

;; Dæmi eitt er fall af a sem skilar falli
;; af b sem leggur saman a og b og deilir
;; niðurstöðunni með b
(define (daemieitt a)
  (lambda (b) (/ (+ a b) b))  
)

;; Í dæmi tvö er kallað í fallið úr dæmi
;; eitt með a = 3 og b=6... niðurstaðan
;; er 3/2... eins og sést í prófunum...


;; Dæmi þrjú er fall af a sek skilar falli
;; sem skilar fjórða veldinu af a
(define daemithrju
  (
    (lambda (a)
      (lambda (b)
        (a (a b))
      )
    )
    (lambda (a) (* a a))
  )
)

(provide daemieitt daemithrju)
