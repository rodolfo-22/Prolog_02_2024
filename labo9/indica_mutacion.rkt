#lang racket

(define (area-circulo radio)
  (* 3.1416 (* radio radio)))

(define (area-circulo2 radio)
  (let ([pi 3.14159])
    (* pi (sqr radio))))
;(display (area-circulo 5)) ; Resultado: 78.53975

;calcular el volumen de un cilindro 
(define (volumen-cilindro radio altura)
  (* (area-circulo radio) altura))

(define (volumen-cilindro2 radio altura)
  (let* ([pi 3.14159]
         [area-base (* pi (sqr radio))]
         [volumen (* area-base altura)])
    volumen))
;(display (volumen-cilindro 3 5)) ; Resultado: 141.37155

(define (maximo-de-tres a b c)
  (let* ([max1 (max a b)]  ;; Calculamos el máximo de los dos primeros números
        [max2 (max max1 c)])  ;; Luego calculamos el máximo de max1 con el tercero
    max2))  ;; Retornamos el valor máximo final
;(display (maximo-de-tres 5 3 8))  ;; Resultado: 8

(define (dividir-cadena cadena)
  (let* ([longitud (string-length cadena)]  ;; Calculamos la longitud de la cadena
         [mitad (/ longitud 2)]  ;; Calculamos la mitad de la longitud
         [parte1 (substring cadena 0 mitad)]  ;; Tomamos la primera mitad
         [parte2 (substring cadena mitad longitud)])  ;; Tomamos la segunda mitad
    (list parte1 parte2)))  ;; Retornamos las dos partes como una lista
;(displayln (dividir-cadena "HolaMundo"))  

(define (intercambiar-coordenadas coordenadas)
  (let-values ([(x y) coordenadas])  ;; Desempaquetamos el par ordenado en x e y
    (values y x)))  ;; Intercambiamos los valores de x y y
;(displayln (intercambiar-coordenadas (cons 3 5)))  ;; Resultado: (5 . 3)

(define (pares-que-suman-a-n n)
  (define (generar-pares x)
    (let ([y (- n x)])  ;; Calculamos el valor de y para que x + y = n
      (cons (list x y) '())))  ;; Creamos un par (x, y) como lista y lo devolvemos
  (define (iterar-pares max)
    (if (> max n) '()  ;; Terminamos si llegamos a n
        (append (generar-pares max) (iterar-pares (+ max 1)))))  ;; Recursión para el siguiente valor
  (iterar-pares 0))  ;; Empezamos desde x = 0

;; Ejemplo de uso
;(displayln (pares-que-suman-a-n 5))







