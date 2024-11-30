#lang racket

(define (producto lista)
     (foldl * 1 lista)
)
; (producto '(1 2 3 4 5))

(define (concatenar lsita)
     (foldl string-append "" lsita)
)
; (concatenar '("hola" "mundo" "casa"))

(define (maximo lista)
     (foldl max 0 lista)
)
; (maximo '(1 2 3 4 5))

(define (contar-elementos lista)
     (foldl (lambda (x y) (+ y 1)) 0 lista)
)
; (contar-elementos '(1 2 3 4 5))

(define (suma lista)
     (foldl + 0 lista)
)
; (suma '(1 2 3 4 5))

(define (lista-invertida lista )
     (foldl cons '() lista)
)
; (lista-invertida '(1 2 3 4 5))

(define (pares lista)
     (foldl (lambda (x y) (if (even? x) (cons x y) y)) '() lista)
)
; (pares '(1 2 3 4 5))

(define (impares lista)
  (foldl (lambda (x y) (if (odd? x) (cons x y) y)) '() lista)
  )
; (pares '(1 2 3 4 5))

(define (combine-2-listas lista1 lista2)
     (foldr cons '() (map list lista1 lista2))
)
; (combine-2-listas '(1 2 3) '(4 5 6))

;; Función para calcular el promedio de una lista
(define (promedio lista)
  (if (empty? lista)
      0  ;; Si la lista está vacía, el promedio es 0
      (/ (foldl + 0 lista) (length lista))))  ;; Suma los valores y divide por la longitud
;(displayln (promedio '(1 2 3 4 5)))

;; Función para eliminar duplicados usando foldr
(define (eliminar-duplicados lista)
  (foldr (lambda (elemento acumulador)
           (if (member elemento acumulador)  ;; Si el elemento ya está en el acumulador
               acumulador                   ;; No lo agregamos
               (cons elemento acumulador))) ;; Lo agregamos al acumulador
         '()                               ;; Acumulador inicial: lista vacía
         lista))
;(displayln (eliminar-duplicados '(1 2 3 1 4 2 5 3)))

;; Función para contar elementos que cumplen una condición
(define (contar-condicion lista condicion)
  (foldr (lambda (elemento acumulador)
           (if (condicion elemento)  ;; Si el elemento cumple la condición
               (+ 1 acumulador)      ;; Incrementar el contador
               acumulador))          ;; De lo contrario, dejarlo igual
         0                           ;; Acumulador inicial: 0
         lista))
;(displayln (contar-condicion '(1 2 3 4 5 6) even?))

;; Función para sumar los elementos impares de una lista
(define (sumar-impares lista)
  (foldl (lambda (elemento acumulador)
           (if (odd? elemento)        ;; Verificar si el elemento es impar
               (+ elemento acumulador) ;; Si es impar, sumar al acumulador
               acumulador))           ;; De lo contrario, dejar el acumulador igual
         0                            ;; Acumulador inicial: 0
         lista))
(displayln (sumar-impares '(1 2 3 4 5 6)))


























