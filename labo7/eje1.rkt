#lang racket
; vamos a usar abierto a extension cerrado a modificacion
;ajuste de tarifa

(define (calcular-tarifa base ajuste)
  (ajuste base ))

(define (menu-tarifa)
  (display "Seleccione el tipo de tarifa:\n")
  (display "1. Tarifa por bajo uso\n")
  (display "2. Tarifa por alta demanda\n")
  (display "3. Tarifa sin modificaciones\n")
  (display "Opcion: ")
  (let [(seleccion (read)) (base 1.25)]
    (cond
      [(= seleccion 1)
       (let [(resultado (calcular-tarifa base (lambda (tarifa) (* tarifa 0.75))))]
         (display "Tarifa con descuento por bajo uso: ")
         (display resultado)
         )
       ]
      [(= seleccion 2)
       (let [(resultado (calcular-tarifa base (lambda (tarifa) (* tarifa 1.25))))]
         (display "Tarifa con aumento por alto uso: ")
         (display resultado)
         )
       ]
      [(= seleccion 3)
       (let [(resultado (calcular-tarifa base (lambda (tarifa) tarifa)))]
         (display "Tarifa sin modificaciones: ")
         (display resultado)
         )
       ]
      [else (display "Selección es inválida.")]
      )
    )
  )