#lang racket

;raket es un lenguaje de programacion funcional, no tiene variables, solo indicadores
; un indicaor es un registro en un estado, un binding entre un indicador y un valor

;definicionaes
(define sentido-de-la-vida 42)
(define pi 3.14164)

#|
comentario multilinea
|#

;funcion que devuelava el proemdio
;(define (lista) (tercer elemento, lo que queremos que haga) )
(define (promedio a b)
    (/ (+ a b) 2)
)

;factorial de un numero
(define (factorial n)
    (if (= n 0)
        1
        (* n (factorial (- n 1)))
    )
)

;fibonacci
(define (fibonacci n)
    (if (or (= n 0) (= n 1))
        n
        (+ (fibonacci (- n 1)) (fibonacci (- n 2)))
    )
)

;tipos de datos en racket
;integers, reales, racionales, complejos, booleanos, caracteres, cadenas, listas, vectores, funciones, estructuras, indicadores
;boleanos, #f y #v
;or and
;if verdadero devuelvo lo primero, si no lo segundo ejemplo (if #t 'si' 'no')
;los numero se divide en exactos y inexactos (entero positivo y negativo es exacto, fraccionario es exacto, el imaginario es exacto)
;caracter, podes escribir cualquier caracter de los que existen, tampoco hay restriccion de longitud
;cadena, se escriben entre comillas dobles, no hay restriccion de longitud
;pares y listas son especiales de rraket
; un par es uba estrucutra de dos elementos, el primer elemento es el car y el segundo es el cdr
;una lista es una secuencia de pares, el ultimo cdr es una lista vacia

;lista enlazada, son cadenas que enlazan elementos, el ultimo elemento es una lista vacia
;ejemplo (cons 1 (cons 2 (cons 3 '()))) ;(1 2 3)
(define lista (list 1 2 3 4 5 6)) 
; para robtener el primer elemento de la lista (car lista)
; para obtener el resto de la lista (cdr lista)
; para obtener el segundo elemento (car (cdr lista))
; para obtener el tercer elemento (car (cdr (cdr lista)))
;map, aplica una funcion a cada elemento de una lista
;ejemplo (map (lambda (x) (+ x 1)) '(1 2 3 4 5 6)) ;(2 3 4 5 6 7)
;andmap, aplica una funcion a cada elemento de una lista y si todos son verdaderos devuelve verdadero
;ormap, aplica una funcion a cada elemento de una lista y si alguno es verdadero devuelve verdadero
;filter, aplica una funcion a cada elemento de una lista y si es verdadero lo agrega a una nueva lista
;foldl, aplica una funcion a cada elemento de una lista y acumula el resultado
;foldr, aplica una funcion a cada elemento de una lista y acumula el resultado de derecha a izquierda
;append, concatena dos listas
;reverse, invierte una lista
;length, devuelve la longitud de una lista
;member, devuelve verdadero si un elemento esta en una lista
;memq, devuelve verdadero si un elemento esta en una lista, compara por igualdad
;memv, devuelve verdadero si un elemento esta en una lista, comp
;assq, devuelve el par asociado a un elemento en una lista
;assv, devuelve el par asociado a un elemento en una lista
;assoc, devuelve el par asociado a un elemento en una lista
;list-ref, devuelve el elemento en la posicion n de una lista
;list-tail, devuelve una lista sin los n primeros elementos
;list-set, cambia el valor de un elemento en una lista
;list-copy, copia una lista
