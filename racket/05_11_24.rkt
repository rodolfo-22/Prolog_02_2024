#lang racket

;lamdas son funciones anonimas, solo lo necesitas en un contexto especifico
;la funcion solo existe en memoria para cuando la necesito
;indicadores, los nombres de las funciones son indicadores y sus bindings
;no neceito que un procedimiento este asociado a un indicador

;(lambda (argumentos) (es ek cuerpo de la funcion))
(lambda (x) (+ x 5))

(define (sueldo_neto S)
     ((lambda (x) (- x ((* x 0.03)(* x 0.0725)(* x 0.1))))
S ))

(define (crear_funcion oper)
     (case oper
     ((1) (lambda (x y) (+ x y)))
     ((2) (lambda (x y) (- x y)))
     ((3) (lambda (x y) (* x y)))
     ((4) (lambda (x y) (/ x y)))
     (else (display "mal input"))
     )
)

(define (pedir_dato msg) (display msg)(read))
(define (escoger_operacion) 
(let
     (
          (A (pedir_dato "ingrese un entero positivo"))
          (B (pedir_dato "ingrese otro  entero positivo"))
          (f(crear_funcion (pedir_dato "ingrese la operacion:\nl Suma\nl Resta\nl Multiplicacion\nl Division\nl")))
     )
     (f A B)
))


;-----------------------------------------------------------------------------------------
;listas
;las listas son estructuras de datos
;las lista internanmente se representa con '( 2 6 3 1)  entre parenteid con cada uno separado

(const 1 (list 2 6 3 1))

;para listas vacias
;null lista vacia
;en el codigo se recomientra craer la lista con el nombre list, siempre l pones ese nombre

; Función principal para iniciar el cálculo del CUM
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

