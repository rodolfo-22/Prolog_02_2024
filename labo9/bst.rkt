#lang racket

;arbol binario en preorden
(define (preorden arbol)
    (if (empty? arbol)
        '()
        (append (list (first arbol)) 
                 (preorden (second arbol)) 
                 (preorden (third arbol)))
    )
)

;arbol binario en inorden
(define (inorden arbol)
    (if (empty? arbol)
        '()
        (append (inorden (second arbol))
                (list (first arbol))
                 (inorden (third arbol)))
    )
)

;arbol binario en postorden
(define (postorden arbol)
    (if (empty? arbol)
        '()
        (append (postorden (second arbol))
                 (postorden (third arbol))
                 (list (first arbol))
        )
    )
)

;; Función para calcular la profundidad de un árbol binario
(define (profundidad arbol)
  (if (empty? arbol)  ;; Si el árbol está vacío, la profundidad es 0
      0
      (+ 1 (max (profundidad (second arbol))  ;; Profundidad del subárbol izquierdo
                (profundidad (third arbol)))))) ;; Profundidad del subárbol derecho
;(define arbol '(1 (2 (4 () ()) ()) (3 () (5 () ()))))

;; Función para sumar los valores de todos los nodos en un árbol binario
(define (suma-nodos arbol)
  (if (empty? arbol)  ;; Si el árbol está vacío, la suma es 0
      0
      (+ (first arbol)                       ;; Valor del nodo actual
         (suma-nodos (second arbol))         ;; Suma de los nodos del subárbol izquierdo
         (suma-nodos (third arbol)))))       ;; Suma de los nodos del subárbol derecho
;(define arbol '(1 (2 (4 () ()) ()) (3 () (5 () ()))))

;; Función para encontrar el valor más grande en un árbol binario
(define (valor-mas-grande arbol)
  (if (empty? arbol)  ;; Si el árbol está vacío, devolvemos el valor más pequeño posible
      -inf.0          ;; -infinito (valor mínimo inicial)
      (max (first arbol)                     ;; Valor del nodo actual
           (valor-mas-grande (second arbol)) ;; Valor más grande en el subárbol izquierdo
           (valor-mas-grande (third arbol))))) ;; Valor más grande en el subárbol derecho
;(valor-mas-grande '(1 (2 (4 () ()) ()) (3 () (5 () ()))))

;; Función para determinar si un valor está presente en un árbol binario
(define (valor-presente? arbol valor)
  (if (empty? arbol)  ;; Si el árbol está vacío, el valor no está presente
      #f
      (or (= (first arbol) valor)            ;; Verificar si el nodo actual contiene el valor
          (valor-presente? (second arbol) valor) ;; Buscar en el subárbol izquierdo
          (valor-presente? (third arbol) valor)))) ;; Buscar en el subárbol derecho
;(define arbol '(1 (2 (4 () ()) ()) (3 () (5 () ()))))

;; Función para contar los nodos hoja de un árbol binario
(define (contar-hojas arbol)
  (if (empty? arbol)  ;; Si el árbol está vacío, no hay hojas
      0
      (if (and (empty? (second arbol)) (empty? (third arbol)))  ;; Si es un nodo hoja
          1  ;; Contar este nodo
          (+ (contar-hojas (second arbol))  ;; Contar las hojas del subárbol izquierdo
             (contar-hojas (third arbol))))))  ;; Contar las hojas del subárbol derecho
;(define arbol '(1 (2 (4 () ()) ()) (3 () (5 () ()))))

;; Función para invertir un árbol binario
(define (invertir-arbol arbol)
  (if (empty? arbol)  ;; Si el árbol está vacío, no hay nada que invertir
      '()
      (list (first arbol)               ;; La raíz permanece igual
            (invertir-arbol (third arbol))  ;; Invertir el subárbol derecho como izquierdo
            (invertir-arbol (second arbol))))) ;; Invertir el subárbol izquierdo como derecho
;(define arbol '(1 (2 (4 () ()) ()) (3 () (5 () ()))))

;; Función para verificar si dos árboles binarios son iguales
(define (arboles-iguales? arbol1 arbol2)
  (cond
    [(and (empty? arbol1) (empty? arbol2)) #t] ;; Ambos árboles están vacíos
    [(or (empty? arbol1) (empty? arbol2)) #f] ;; Uno está vacío y el otro no
    [else (and (= (first arbol1) (first arbol2)) ;; Las raíces son iguales
               (arboles-iguales? (second arbol1) (second arbol2)) ;; Subárbol izquierdo
               (arboles-iguales? (third arbol1) (third arbol2)))])) ;; Subárbol derecho

;; Ejemplo de árboles binarios
(define arbol1 '(1 (2 (4 () ()) ()) (3 () (5 () ()))))

;; Función para eliminar nodos con valor menor a un umbral
(define (eliminar-nodos-menores arbol umbral)
  (if (empty? arbol)  ;; Si el árbol está vacío, retornamos un árbol vacío
      '()
      (if (< (first arbol) umbral)  ;; Si el valor del nodo actual es menor al umbral
          '()  ;; Eliminamos este nodo (lo reemplazamos con un árbol vacío)
          (list (first arbol)  ;; Mantenemos este nodo
                (eliminar-nodos-menores (second arbol) umbral)  ;; Procesamos el subárbol izquierdo
                (eliminar-nodos-menores (third arbol) umbral))))) ;; Procesamos el subárbol derecho
;(define arbol '(5 (3 (1 () ()) (4 () ())) (7 () (6 () ()))))

;; Función para recorrer un árbol binario en postorden
(define (postorden2 arbol)
  (if (empty? arbol)  ;; Si el árbol está vacío, no hay nodos que recorrer
      '()
      (append (postorden2 (second arbol))  ;; Recorrer el subárbol izquierdo
              (postorden2 (third arbol))   ;; Recorrer el subárbol derecho
              (list (first arbol)))))     ;; Agregar la raíz al final
;(define arbol '(1 (2 (4 () ()) ()) (3 () (5 () ()))))

;; Función auxiliar: Verifica si todos los valores en el árbol están dentro de un rango dado
(define (es-abb-rango? arbol minimo maximo)
  (if (empty? arbol)
      #t  ;; Un árbol vacío siempre es un ABB
      (and (<= minimo (first arbol))  ;; El valor de la raíz debe estar dentro del rango
           (< (first arbol) maximo)   ;; El valor de la raíz debe ser menor que el máximo
           (es-abb-rango? (second arbol) minimo (first arbol))  ;; Subárbol izquierdo
           (es-abb-rango? (third arbol) (first arbol) maximo)))) ;; Subárbol derecho

;; Función principal: Verifica si un árbol binario es un ABB
(define (es-arbol-binario-busqueda? arbol)
  (es-abb-rango? arbol -inf.0 +inf.0))  ;; Rango inicial: desde -∞ hasta +∞

;; Ejemplo de árbol binario de búsqueda
(define abb '(8 (3 (1 () ()) (6 () ())) (10 () (14 () ()))))


























































