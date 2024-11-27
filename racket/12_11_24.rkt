#lang racket

;filter, buscarla, super poderosa
;busca tambine map
;un caracter en raket es #\a

;para ver si es string (string? "hola") -> #t
;caracter nulo \u0000

;para modificar una cade, solo funciona con cadenas inmutables
(string-set! (string #\h #\o #\l #\a) 2 #\r) ;-> "hora" 

;esta version es sencible a mayusculas y minusculas
;(string<? "hola" "hola") -> #f

;esta version no es sencible a mayusculas y minusculas
;(string-ci<? "hola" "HOLA") -> #f

;para transformar un string a lista
;(string->list "hola") -> (#\h #\o #\l #\a)

;para transformar una lista a string
;(list->string '(#\h #\o #\l #\a)) -> "hola"

;para caracteres
;(char->integer #\a) -> 97

;(substring "hola" 1 3) -> "ol"
;(string-upcase "hola") -> "HOLA"
;(string-downcase "HOLA") -> "hola"

;(filter (lambda (x) (> x 5) (map (lambda (x) (* x x)) '(1 2 3 4 5 6 7 8 9 10))) -> (36 49 64 81 100)
;calc