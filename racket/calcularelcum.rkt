#lang racket

(define (leer-nota)
  (display "Ingrese la nota: ")
  (read))

(define (leer-uv)
  (display "Ingrese las UV: ")
  (read))

(define (calcular_cum_3)
  (display "Ingrese la cantidad de materias: ")
  (let ((cantidad (read)))
    (let loop ((materias cantidad) (total-ponderado 0) (total-uv 0))
      (if (zero? materias)
          (display (string-append "El valor de tu CUM es: " (number->string (/ total-ponderado total-uv))))
          (let ((nota (leer-nota))
                (uv (leer-uv)))
            (loop (- materias 1)
                  (+ total-ponderado (* nota uv))
                  (+ total-uv uv)))))))


;utilizando loop and begin
(define (calcular_cum)
  (display "Ingrese la cantidad de materias: ")
  (let ((cantidad (read)))  ; Número de materias
    (let loop ((materias cantidad) (total-ponderado 0) (total-uv 0))
      (if (zero? materias)
          (display (string-append "El valor de tu CUM es: " (number->string (/ total-ponderado total-uv))))
          (begin
            (display "Ingrese la nota: ")
            (let ((nota (read)))
              (display "Ingrese las UV: ")
              (let ((uv (read)))
                (loop (- materias 1)
                      (+ total-ponderado (* nota uv))
                      (+ total-uv uv)))))))))

#|
 (calcular_cum)
Ingrese la cantidad de materias: 2
Ingrese la nota: 10
Ingrese las UV: 3
Ingrese la nota: 8
Ingrese las UV: 4
El valor de tu CUM es: 62/7
|#


;hacer un versio de el programa para calcular el cum usando listas y lambdas
(define (calcular_cum_2  Mats Uvs)
     (/ (sumprod 0 0 (length Mats) Mats Uvs)  (sum 0 0 (length Uvs) Uvs))
) 

(define (sumprod S cont n L1 L2)
     (cond
     ((= cont n) S)
     (else (sumprod (  + (* (first L1) (first L2))) (+ cont 1) n (rest L1) (rest L2)))
     )
)

(define (sum S cont n L)
     (cond
     ((= cont n) S)
     (else (sum (+ (first L) S) (+ cont 1) n (rest L)))
     )
)
;ejemplo de ejecucion
; (calcular_cum_2 (list 2 3 4 5) (list 3 4 5 6)) ;deberia dar 4.5
;(calcular_cum)
