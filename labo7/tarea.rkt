#lang racket

(define (longitud-cadenas lista)
    (if (andmap string? lista)
        (if (empty? lista)
            '()
            (append (list (string-length (first lista))) (longitud-cadenas (rest lista)))
        )
        (display "Error: la lista debe contener solo cadenas de caracteres")
    )
)

;Pruebas
;(longitud-cadenas '("hola" "proloj" "mejor" "racket?")) ;(4 5 4 5)
;(longitud-cadenas (list "" "123" "mundo" "uca" "super muchas" ))
;(longitud-cadenas (list "hola" 123 "mundo" "como" "estas" )) ;este caso da error :Error: la lista debe contener solo cadenas de caracteres
