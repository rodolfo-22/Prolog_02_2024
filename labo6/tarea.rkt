#lang racket
;funcion que oslicite al usuario ingresar un mes y un dia. la funciond debe verificar si la fecha 
;corresponde al 1 de enero y mostrar un mensaje adecuado


(define (navidad)
  (display "Ingrese el mes (como numero): ")
  (let ((mes (read)))
    (display "Ingrese el dia: ")
    (let ((dia (read)))
      (cond
        ((and (= mes 1) (= dia 1)) (display "Feliz año nuevo"))
        (else (display "La fecha ingresada no es el 1 de enero"))
        )
    )
  )
)

;ejemplo:
;(navidad)
;Ingrese el mes (como numero): 1
;Ingrese el dia: 1
;respuesta: Feliz año nuevo

;ejemplo
;(navidad)
;Ingrese el mes (como numero): 2
;Ingrese el dia: 1
; respuesta: La fecha ingresada no es el 1 de enero