#lang racket

;cadena de caracteres a lista
(define (convertir-aux cadena indice resultado)
    (if (>= indice (string-length cadena))
        resultado
        (convertir-aux cadena (+ indice 1) (append resultado (list (string-ref cadena indice))))
    )
)

(define (cadena-a-lista cadena)
    (convertir-aux cadena 0 '())
)