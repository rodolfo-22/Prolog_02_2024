#lang racket

(define (divisible-entre-3-y-5? n)
(if (and (= (remainder n 3) 0) (= (remainder n 5) 0))  ;; Verificamos si n es divisible por 3 y 5
    'divisible      ;; Si ambas condiciones son verdaderas, retornamos 'divisible
    'no-divisible)) ;; Si alguna de las condiciones es falsa, retornamos 'no-divisible
;(displayln (divisible-entre-3-y-5? 15))

(define (determinar-rango-edad edad)
  (cond
    [(<= edad 12) 'niño]   ;; Si la edad es menor o igual a 12, es un niño
    [(<= edad 17) 'adolescente] ;; Si la edad está entre 13 y 17, es un adolescente
    [(>= edad 18) 'adulto] ;; Si la edad es 18 o mayor, es un adulto
    [else 'edad-invalida])) ;; En caso de que la edad sea negativa o no válida
;(displayln (determinar-rango-edad 10))

(define (categoria-triangulo a b c)
     (cond
       [(and (= a b) (= b c)) 'equilatero]  ;; Si todos los lados son iguales, es equilátero
       [(or (= a b) (= b c) (= a c)) 'isosceles]  ;; Si al menos dos lados son iguales, es isósceles
       [else 'escaleno]))  ;; Si todos los lados son diferentes, es escaleno
;(displayln (categoria-triangulo 5 5 5))

(define (caracter a)
     (cond
       [(char-alphabetic? a) 'letra]  ;; Si el caracter es alfabético, es una letra
       [(char-numeric? a) 'numero]  ;; Si el caracter es numérico, es un número
       [else 'otro]))  ;; Si no es ni letra ni número, es otro tipo de caracter
;(displayln (caracter #\a))

(define (calcular-impuesto salario)
     (cond
       [(<= salario 1000) 0]  ;; Si el salario es menor o igual a 1000, no hay impuesto
       [(<= salario 2000) (* salario 0.1)]  ;; Si el salario está entre 1001 y 2000, el impuesto es 10%
       [(<= salario 3000) (* salario 0.15)]  ;; Si el salario está entre 2001 y 3000, el impuesto es 15%
       [else (* salario 0.2)]))  ;; Si el salario es mayor a 3000, el impuesto es 20%

(define (esta-ordenada-ascendente? lst)
  (if (or (empty? lst) (empty? (rest lst)))  ;; Si la lista está vacía o tiene solo un elemento, está ordenada
      #t  ;; La lista está ordenada
      (if (> (first lst) (first (rest lst)))  ;; Si el primer elemento es mayor que el siguiente, no está ordenada
          #f  ;; No está ordenada
          (esta-ordenada-ascendente? (rest lst)))))  ;; Recursión con el resto de la lista
;(displayln (esta-ordenada-ascendente? '(1 2 3 4 5)))

(define (clasificar-numero n)
     (cond
     [(= n 0) 'cero]  ;; Si el número es 0, es cero
     [(> n 0) 'positivo]  ;; Si el número es mayor que 0, es positivo
     [else 'negativo]  ;; Si el número es menor que 0, es negativo
     )
)

(define (estacion-anio mes)
     (cond
     [(or (= mes 12) (<= mes 2)) 'invierno]  ;; Diciembre, enero y febrero son invierno
     [(<= mes 5) 'primavera]  ;; Marzo, abril y mayo son primavera
     [(<= mes 8) 'verano]  ;; Junio, julio y agosto son verano
     [else 'otono]  ;; Septiembre, octubre y noviembre son otoño
     )
)














