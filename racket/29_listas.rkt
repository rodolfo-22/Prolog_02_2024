#lang racket
;que son, como se trabajan, hay casos de paro, como se recorren

(define lista(list 1 2 3 4 5 6 7 8 9 10 11 ))
(define lista2(list 1 2 3))
(define lista3(list 4 5 6))

;podemos usa car para obtener el primer elemento de la lista
;podemos usar cdr para obtener el resto de la lista
;length, devuelve la longitud de la lista
;apend, concatena dos listas
;reverse, invierte una lista
;map, aplica una funcion a cada elemento de una lista

;cod
(define (que_soy x)
(cond
     [(string? x) "soy_una_cadena"]
     [(number? x) "soy_un_numero"]
     [(boolean? x) "soy_un_booleano"]
     [(char? x) "soy_un_caracter"]
     [(list? x) "soy_una_lista"]
     [(vector? x) "soy_un_vector"]
     [(procedure? x) "soy_una_funcion"]
     [(struct? x) "soy_una_estructura"]
     [(syntax? x) "soy_un_indicador"]
)
)
;;;ejemplo de uso: (que_soy 1)
;funciones
(define (recorrer_lista lista)
    (if (null? lista)
        (display "fin")
        (begin
            (display (car lista))
            (newline)
            (recorrer_lista (cdr lista))
        )
    )
)
;ejemplo: (recorrer_lista lista)

;media de una lista
(define (sumar_lista lista)
     (if (empty? lista)
          0
          (+ (car lista) (sumar_lista (cdr lista)))
     )
)
(define (media num)
     (/ (sumar_lista num) (length num)))
;(media (list 5 20 50))

(define (media2 list)
     (/(apply + list) (length list))
)

(define (dime x a b)
     (x a b)
)

;;funciones anonimas lambda






