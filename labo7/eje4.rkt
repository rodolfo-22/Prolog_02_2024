#lang racket

;creacion de sub lista
(define (crear-sublistas lista1 lista2 lista3)
  (if (and (equal? (length lista1) (length lista2)) (equal? (length lista2) (length lista3)))
      (if (empty? lista1)
          '()
          (append
           (list (list (first lista1) (first lista2) (first lista3)))
           (crear-sublistas (rest lista1) (rest lista2) (rest lista3))
           )
          )
      (display "Los tamaños de las listas no son iguales")
      )
  )