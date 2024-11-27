#lang racket
;lea la temperatura den grados celsius desde la consola y la convierta a grados fahrenheit,
;mostrando ambos valores
;let es un identificador que permite definir variables locales
;let* para qeu la variables de ejecuten de manera secuencial
(define (celsius_fahrenheit)
    (display "Ingrese la temperatura en grados Celsius: ")
    (let ((celsius (read)))
        (display "La temperatura en grados Fahrenheit es: ")
        (display (+ (* 9/5 celsius) 32))
    )
)