#lang racket
;suma de todos los elementos de una lista
;list efectua operaciones sobre listas
;'((+ 5 5) 1 2) esta es una lista que no realiza la operacion

(define (suma-elementos-lista lista)
     (if (andmap number? lista)
     (if (empty? lista)
         0
         (+ (first lista) (suma-elementos-lista (rest lista)))
     )
     (display "Error: la lista contiene elementos que no son números")
     )
)
