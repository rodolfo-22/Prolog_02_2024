#lang racket

(define (add1)
     (map (lambda (x) (+ x 1)) '(1 2 3 4 5)))     

(define (cadena5)
     (filter (lambda (x) (>= (string-length x) 5)) '("hola" "mundo" "casa" "perro" "gatottt"))
)

(define (cuadrados lista)
     (map (lambda (x) (* x x)) lista)
)
;(cuadrados '(1 2 3 4 5))

(define (pares lista)
     (filter even? lista)
)
;(pares '(1 2 3 4 5))

(define (cadena-mayusculas lista)
     (map string-upcase lista)
)
;(cadena-mayusculas '("hola" "mundo" "casa" "perro" "gato"))

(define (cadean-minusculas lista)
     (map string-downcase lista)
)

;; Función que aplica el módulo a cada elemento de la lista
(define (calcular-modulos lista1 divisor1)
  (map (lambda (x) (modulo x divisor1)) lista1))
;; Ejemplo de uso
(define lista1 '(10 15 20 25 30))  ;; Lista original
(define divisor1 6)                ;; Divisor dado
(define resultado (calcular-modulos lista1 divisor1))  ;; Aplicar módulo

;; Función que verifica si una palabra empieza con una vocal
(define (empieza-con-vocal? palabra)
  (let ([primera-letra (string-downcase (substring palabra 0 1))])  ;; Obtener la primera letra en minúsculas
    (member primera-letra '("a" "e" "i" "o" "u"))))  ;; Verificar si es una vocal
;; Usar filter para obtener las palabras que empiezan con vocal
(define (palabras-con-vocal lista)
  (filter empieza-con-vocal? lista))
;(palabras-con-vocal '("Hola" "Mundo" "ocho" "casa" "agua" "estrella" "idea"))

(define (fahrenheit-celsius lista)
     (map (lambda (x) (/ (- x 32) 1.8)) lista)
)

(displayln (map (lambda (x) (list x (* 2 x))) '(1 2 3 4 5)))

;; Agregar un prefijo a cada cadena en la lista
(define (agregar-prefijo lista prefijo)
  (map (lambda (cadena) (string-append prefijo cadena)) lista))
;(agregar-prefijo '("hola" "mundo" "casa") "pre-")

;; Función que verifica si un número es primo
(define (es-primo? n)
  (cond
    [(<= n 1) #f]  ;; Los números <= 1 no son primos
    [else
     (let loop ([divisor 2])
       (cond
         [(> divisor (sqrt n)) #t]         ;; Si no hay divisores hasta la raíz cuadrada, es primo
         [(= (modulo n divisor) 0) #f]     ;; Si es divisible por divisor, no es primo
         [else (loop (+ divisor 1))]))]))  ;; Incrementamos el divisor recursivamente
;; Filtrar los números primos de una lista
(define (filtrar-primos lista)
  (filter es-primo? lista))
;(filtrar-primos '(1 2 3 4 5 6 7 8 9 10))

(define (negativos lista)
     (filter (lambda (x) (< x 0)) lista)
)
;(negativos '(-1 2 -3 4 -5 6 -7 8 -9 10))

(define (mult-2-listas lista1 lista2)
     (map (lambda (x y) (* x y)) lista1 lista2)
)
;(mult-2-listas '(1 2 3 4 5) '(6 7 8 9 10))

;; Función para calcular el logaritmo en una base específica
(define (logaritmos lista base)
  (map (lambda (x) (/ (log x) (log base))) lista))
;(logaritmos '(1 2 3 4 5) 2)

