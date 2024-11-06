#lang racket
;programa que muestr un menu

(define (operar_numeros A B)
     (display "seleccione la operacion para A y B\nl")
     (procesar_eleccion A B (read))
)

(define (procesar_eleccion A B oper)
     (if (= oper 1)
     (+ A B)
     (if (= oper 2)
     (- A B)
     (if (= oper 3)
     (* A B)
     (if (= oper 4)
     (/ A B)
     (display "nono mal imput")
     )
     )
     )
     )
)

;utilizando cond, simulando swith
(define (procesar_eleccion_2 A B oper)
     (cond
     ((= oper 1)(+ A B)) ;izquierda booleana, si da tru ejecuta la de la derecha
     ((= oper 2)(- A B)) ;enves de los parentesis de afuera podes utilizar []
     ((= oper *)(* A B))
     ((= oper /)(/ A B))
     (else(display "mal inout"))
))

;otra version, puedes enviar un strign en oper o comparar directamente
(define (procesa_eleccion_3 A B oper)
     (case oper
     ((1)(+ A B))
     ((2)(- A B))
     ((3)(* A B))
     ((4)(/ A B))
     (else ("mal input"))
))

;permite trabajar cosas similares al trabajar con variables
;raket tiene la version general de los inperativos qeu es general indicadores
;busca que es variable, un indicador es solo un registro en un estado
;binding entre los indicadores y los valores???? "el amarre"

(define cinco 5)  ;la mas cercana a usar varibles globales

(define (sueldo_neto S)
     (local 
          (
               (define afp (* S 0.0725))
               (define iss (* S 0.03))
               (define renta (* S 0.1))
          )
          (- S afp iss renta);este es el cuerpo, auqi van las operaciones
     )
)

(define (sueldo_neto_2 S)
  (local
    (
     (define afp (* S 0.0725))
     (define iss (* S 0.03))
     (define renta (* S 0.1))
     )
     (set! renta ( * S 0.12) )   ;utilizas para que quedee xoplicito que es una operacion de cuidado !
    (- S afp iss renta);este es el cuerpo, auqi van las operaciones
    )
  )
 



