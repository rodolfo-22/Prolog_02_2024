#lang racket
; funcion que pida edad del usuario y clasifique su grupo de edad usando case
;simbolos se usan para poder identificar,, sirve de auxiliar para decir que alli abra algo
(define (grupo)
  (display "Ingrese su edad: ")
  (let ((edad (read)))
     (case
          ;(la varible o el identificador) 
          ;casos ((1) ())
          (cond
               ((< edad 13) `nino)
               ((< edad 18) `adolescente)
               ((< edad 65) `adulto)
               (else `viejo)
          )
          ((nino) display("grupo etario: nino"))
          ((adolescente) display("grupo etario: adolescente"))
          ((adulto) display("grupo etario: adulto"))
          ((viejo) display("gurpo etario: viejo"))
     )
  )
)