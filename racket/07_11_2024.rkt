#lang racket
(define (calcular_area)
     (display "Seleccione la figura geometrica:\n1. Cuadrado\n2. Rectangulo\n3. Triangulo\n4. Circulo\n")
     (case (read)
          ((1) ((crear_funcion 1) (read)))
          ((2) ((crear_funcion 2) (read)))
          ((3) ((crear_funcion 3) (read)))
          ((4) ((crear_funcion 4) (read)))
          )
)

(define (crear_funcion modo)
     (case modo
          ((1) (lambda (x) (* x x)))
          ((2) (lambda (x y) (* x y)))
          ((3) (lambda (x y) (/ (* x y) 2)))
          ((4) (lambda (x) (* 3.1416 (* x x))))
          (else (display "Opcion invalida"))
          )
)

;-----------------------------------------------------------------------------------------
;funciones para manejo de listas
;list
(list 2 6 3 1)
;para raket internamente es '(2 6 3 1)

;para verificar si una lista es vacia, se usa null
(null? (list))
;true
;length para obtener la longitud de una lista
(length (list))

;const, para crear una lista constante
;(const 1 (list 2 6 3 1))
;(display (const 1 (list 2 6 3 1)))

;append, para concatenar listas
(display (append (list 1 2 3) (list 4 5 6)))

;funcion qu emuestre el contenido de una lista (asuminedo que no se puede colocar lista como argumento de display)
(define (mostrar_lista L)
     (cond
          ((null? L) )
          (else (begin
               (display (first L))
               (display " ")
               (mostrar_lista (rest L))
          ))
     )
)
;ejemplo de ejecucion (mostrar_lista (list 1 2 3 4 5 6 7 8 9 10))
(define (show_list L)
     (display "( ")
     (show_list_aux L)
)
(define (show_list_aux L)
     (cond
          ((null? L) (display ")"))
          (else (begin
               (display (first L))
               (display " ")
               (show_list_aux (rest L))
          ))
     )
)

;funcion para pedir una secuencia de datos al usuario y construir una lista con ellos
(define (pedir_lista)
     (display "Ingrese la cantidad de elementos de la lista: ")
     (let ((n (read)))
          (pedir_lista_aux n (list))
     )
)
(define (pedir_lista_aux n L)
     (cond
          ((= n 0) L)
          (else (pedir_lista_aux (- n 1) (append L (list (read))))
          )
     )
)

(define (pedir_lista2)
  (display "Ingrese la cantidad de elementos de la lista: ")
  (let* ((n (read)) ; Leer la cantidad de elementos
         (L (for/list ([i n]) ; Crear una lista de longitud n
              (display "Ingrese un elemento: ")
              (read)))) ; Leer cada elemento y añadirlo a la lista
    L)) ; Devolver la lista

;cons vs append
;cons agrega un elemento al inicio de la lista ejem (cons 1 (list 2 3 4 5)) => (1 2 3 4 5)
;append agrega un elemento al final de la lista ejem (append (list 1 2 3 4 5) (list 6 7 8 9 10)) => (1 2 3 4 5 6 7 8 9 10)

;hacer  una funcion que dada una lista la invierta sin usar reverse
(define (invertir_lista L)
     (invertir_lista_aux L (list))
)
(define (invertir_lista_aux L L2)
     (cond
          ((null? L) L2)
          (else (invertir_lista_aux (rest L) (cons (first L) L2)))
     )
)
