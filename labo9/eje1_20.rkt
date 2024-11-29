#lang racket

(define (unir-cadenas lista)
  (apply string-append (map (lambda (x) (string-append x " ")) lista)))
;(display (unir-cadenas '("Hola" "mundo" "en" "Racket")))

(define (longitud lista)
  (if (null? lista)
      0
      (+ 1 (longitud (rest lista)))))
;(display (longitud '(1 2 3 4 5))) ; Resultado: 5

(define (indice elemento lista)
  (define (aux lista idx)
    (cond
      [(null? lista) -1]
      [(equal? elemento (first lista)) idx]
      [else (aux (rest lista) (+ idx 1))]))
  (aux lista 0))
;(display (indice 3 '(1 2 4 5 3))) ; Resultado: 2

(define (numero-a-texto num texto)
  (string-append (number->string num) texto))

;(display (numero-a-texto 123 " es un número")) 

(define (eliminar elemento lista)
  (cond
    [(null? lista) '()]
    [(equal? elemento (car lista)) (cdr lista)]
    [else (cons (car lista) (eliminar elemento (cdr lista)))]))

;(display (eliminar 3 '(1 2 3 4 5))) ; 

(define (primeros-pares n)
  (map (lambda (x) (* 2 x)) (range 0 n)))

;(display (primeros-pares 5)) 

(define (primeros-5 lista)
     (take lista 6)
)
;(display (primeros-5 '(uno uno unn 4 quint 6 7))) 

(define (extraer-parte cadena inicio fin)
  (list->string (take (drop (string->list cadena) inicio) (- fin inicio))))
;(display (extraer-parte "Hola Mundo" 5 10)) ; Resultado: "Mundo"

(define (crear-matriz filas columnas)
  (map (lambda (_) (make-list columnas 0)) (range filas)))
;(display (crear-matriz 3 4)) 

(define (numeros-aleatorios n cantidad)
  (map (lambda (_) (+ 1 (random n))) (range cantidad)))
;(display (numeros-aleatorios 10 5)) 

(define (promedio lista)
  (/ (apply + lista) (length lista)))
;(display (promedio '(4 6 8))) ; Resultado: 6

(define (es-primo? n)
  (define (divisible? x) (= (modulo n x) 0))
  (not (ormap divisible? (range 2 n))))
;(display (es-primo? 7)) ; Resultado: #t

;ejericio 15
(define (potencias numero n)
  (map (lambda (x) (expt numero x)) (range 0 n)))
;(display (potencias 2 5)) ; Resultado: '(1 2 4 8 16)

(define (inician-con-vocal lista)
  (filter (lambda (cadena) (member (string-ref cadena 0) '(#\a #\e #\i #\o #\u))) lista))
;(display (inician-con-vocal '("hola" "amor" "casa" "uva"))) ; Resultado: '("amor" "uva")


(define (transpuesta matriz)
  (apply map list matriz))
;(display (transpuesta '((1 2 3) (4 5 6) (7 8 9)))) ; Resultado: '((1 4 7) (2 5 8) (3 6 9))


;------------------tabla de multiplicar eje19
(define (tabla-multiplicar n)
  (map (lambda (x) (* n x)) (range 1 11)))
;(display (tabla-multiplicar 5)) ; Resultado: '(5 10 15 20 25 30 35 40 45 50)

;ejercico 20
(define (suma-listas lista1 lista2)
  (map + lista1 lista2))
;(display (suma-listas '(1 2 3) '(4 5 6))) ; Resultado: '(5 7 9)


