#lang racket

;incrementar todos los elementos de una lista en un monto indicado por el usuario y mostrar
(define (increment-list lista increment)
  (map (lambda (x) (+ x increment)) lista))

;example (increment-list (list 1 2 3 4) 2)

;pasar a mayusculas 
(define (mayusculas L)
     (map (lambda (x) (string-upcase x)) L)
)

;revertir string
;(define (invertir L)
 ;    (map (lambda (x) (list->string (reverse))))
;)
;ejemplo:

;pasar a mayusculas la primera letra de cada palabra almacena en una lista

(define (primera-mayuscula L)
  (map (lambda (x)
         (string-append (string-upcase (substring x 0 1)) ; Convierte la primera letra a mayúsculas
                        (substring x 1)))                 ; Mantiene el resto de la palabra igual
       L))

;eliminar las vocales en todas las palabras almacenadas en una lista
(define delete L
     (filter (lambda))
)
;la clave es la amidacion fuerte
;doble for (lambda(case-lambda))
;map filter y fold arboles

;dada una lista de enteros, calcular la sumatoria, usar solo map y lambdas

