#lang racket

;que caracteristica comparte la lista con  string-ref resp: es inmutable

;list-tail L 1 :toma de referencia la posicion que vos decis y todas las posiciones anteriores
;las recorta
;list-tail permite agarra los ultimos elementos list-tail L 3
; hay tres maneras de obtener los ultimos elementos de una lista

; caracter del espacio en raket #\space

;(define LP (list "mario" "leonar" "leo" "nada"))
;(map (lambda (s) (>5 (string-lenght s) 5)) LP )

;substring es para 