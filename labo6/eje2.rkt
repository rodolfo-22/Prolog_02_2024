#lang racket
;solicite un numero del 1 al7 utilice cond para mostrar el dia de la semana correspondiente
;cond es una estructura de control que permite evaluar multiples condiciones
;case es un swith de toda la vida en otros lenguajes, como se comporta la varaible en uin caso especifico
; condicion que quiero que ese cumpla y lo que hara si eso se cumple "estructura del 
;cond ((condicion)(lo que se hara si se cumple la condicion))"
;para recibir un numero se usa read ((dia (read))
;aqui estudiamos el uso de cond
(define ( dia_semana)
    (display "Ingrese un numero del 1 al 7: ")
    (let ((dia (read)))
        (cond
            ((= dia 1) (display "Lunes"))
            ((= dia 2) (display "Martes"))
            ((= dia 3) (display "Miercoles"))
            ((= dia 4) (display "Jueves"))
            ((= dia 5) (display "Viernes"))
            ((= dia 6) (display "Sabado"))
            ((= dia 7) (display "Domingo"))
            (else (display "Numero invalido"))
        )
    )
)