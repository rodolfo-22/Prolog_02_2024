#lang racket
;
(define (cal_imc)
     (display "Ingrese su peso en kg: ")
     (let ((peso (read)))
       (display "Ingrese su altura en metros ")
          (let ((alura (read)))
               (let ((imc (/ peso (* alura alura))))
                    (cond
                         ((< imc 18.5) (display "Bajo peso"))
                         ((and (>= imc 18.5) (< imc 24.9)) (display "Normal"))
                         ((and (>= imc 25) (< imc 29.9)) (display "Sobrepeso"))
                         ((>= imc 30) (display "Obesidad"))
                    )
               )
          )
     )
)
