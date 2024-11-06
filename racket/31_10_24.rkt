#lang racket
;hueva
(define (sueldo_neto_4 S)
(let
     ( 
          ( afp (* S 0.0725))
          ( isss (* S 0.03) )
          ( renta (* S 0.1))
     )
     (- S afp isss renta )
)
)


(define (sueldo_neto_5 S)
  (let-values
      (
       ( (afp isss renta) (values (* S 0.0725) (* S 0.03) (* S 0.1)))
       )
    (- S afp isss renta )
    )
  )

#| aqui sucede la interdependencia de indicadores
let ejecuta todo hasta el final del parentesis, es decir, dentro del parentesis nada tiene valor hasta
que llegue el final de ), portanto m no tiene valor
(define (f x y)(
     let( 
     (m 3)
     (b -7)
     (y (+ (* m x)b))
     )
     (display "el valor de f(x) es ")
     (display y)
))
|#
(define (f x y)(
     let*(
                    (m 3)
                    (b -7)
                    (y (+ (* m x)b))
                    )
               (display "el valor de f(x) es ")
               (display y)
               ))

;programa para calcular el cum
(define (cum nota uv)
     (let*
     (
          (y (/ (+ (* nota uv)) 2))
     )
          (display "el valor de tu cum es ")
          (display y)
     )
)

