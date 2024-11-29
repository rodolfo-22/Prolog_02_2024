#lang racket

(define (contar-negativos lst)
  (cond
    [(empty? lst) 0]  ;; Si la lista está vacía, retornamos 0
    [(< (first lst) 0) (+ 1 (contar-negativos (rest lst)))] ;; Si el primer elemento es negativo, sumamos 1
    [else (contar-negativos (rest lst))]))  ;; Si no es negativo, continuamos con el resto de la lista
;(displayln (contar-negativos '(1 -2 3 -4 5 -6)))

(define (ultimo-elemento lst)
  (cond
    [(empty? lst) (error "La lista está vacía, no tiene un último elemento")] ;; Caso: lista vacía
    [(empty? (rest lst)) (first lst)]  ;; Caso base: si el resto está vacío, el primero es el último
    [else (ultimo-elemento (rest lst))]))  ;; Caso recursivo: continuar con el resto de la lista
;(displayln (ultimo-elemento '(1 2 3 4 5)))

(define (eliminar-elementos n lst)
  (cond
    [(empty? lst) '()]  ;; Si la lista está vacía, retornamos una lista vacía
    [(= n (first lst)) (eliminar-elementos n (rest lst))]  ;; Si el primer elemento es igual a n, lo omitimos
    [else (cons (first lst) (eliminar-elementos n (rest lst)))]))  ;; Si no es igual a n, lo conservamos y seguimos recursivamente
;(displayln (eliminar-elementos 3 '(1 2 3 3 4 5 3)))

(define (numero-de-sublistas lst)
  (cond
    [(empty? lst) 0]  ;; Si la lista está vacía, no hay sublistas
    [(list? (first lst)) (+ 1 (numero-de-sublistas (rest lst)))] ;; Si el primer elemento es una sublista, contamos 1
    [else (numero-de-sublistas (rest lst))])) ;; Si no es una sublista, seguimos con el resto
;(displayln (numero-de-sublistas '(1 2 (3 4) 5 (6 (7 8)))))

(define (reemplazar-ceros-con-unos lst)
  (cond
    [(empty? lst) '()]  ;; Caso base: si la lista está vacía, devolvemos una lista vacía
    [(= (first lst) 0) (cons 1 (reemplazar-ceros-con-unos (rest lst)))] ;; Reemplazamos 0 con 1
    [else (cons (first lst) (reemplazar-ceros-con-unos (rest lst)))]))  ;; Conservamos el elemento y seguimos
;(displayln (reemplazar-ceros-con-unos '(0 1 2 0 3 0 4)))

(define (fibonacci n)
  (cond
    [(= n 0) 0]  ;; Caso base: Fibonacci(0) = 0
    [(= n 1) 1]  ;; Caso base: Fibonacci(1) = 1
    [else (+ (fibonacci (- n 1)) (fibonacci (- n 2)))]))  ;; Fórmula recursiva: F(n) = F(n-1) + F(n-2)
;(displayln (fibonacci 10))

(define (suma-digitos n)
  (cond
    [(= n 0) 0]  ;; Caso base: si el número es 0, la suma de los dígitos es 0
    [else (+ (modulo n 10)  ;; Último dígito del número
             (suma-digitos (quotient n 10)))]))  ;; Llamada recursiva al resto del número
;(displayln (suma-digitos 1234))

(define (decimal-a-binario n)
  (cond
    [(= n 0) '()]  ;; Caso base: el número es 0, devolvemos una lista vacía
    [else (append (decimal-a-binario (quotient n 2))  ;; Llamada recursiva al cociente
                  (list (modulo n 2)))]))  ;; Agregamos el residuo como el bit menos significativo
;(displayln (decimal-a-binario 10))
;---------------------------------------------------------------------------------------------------
;; Función recursiva para calcular el MCD usando el algoritmo de Euclides
(define (mcd a b)
  (if (= b 0)
      a  ;; Caso base: si b es 0, el MCD es a
      (mcd b (modulo a b))))  ;; Llamada recursiva con (b, a mod b)

;; Función para calcular el MCM usando el MCD
(define (mcm a b)
  (if (or (= a 0) (= b 0))
      0  ;; Si alguno de los números es 0, el MCM es 0
      (/ (abs (* a b)) (mcd a b))))  ;; Fórmula: |a * b| / MCD(a, b)

;; Ejemplo de uso
;(displayln (mcm 12 15))

(define (subconjuntos lst)
  (if (empty? lst)
      '(())  ;; Caso base: el único subconjunto de una lista vacía es la lista vacía
      (let* ([rest-subsets (subconjuntos (rest lst))]  ;; Subconjuntos del resto de la lista
             [new-subsets (map (lambda (subset) (cons (first lst) subset)) rest-subsets)])  ;; Agregamos el elemento actual
        (append rest-subsets new-subsets))))  ;; Combinamos ambos subconjuntos
;(displayln (subconjuntos '(1 2 3)))

(define (potencia a b)
  (cond
    [(= b 0) 1]  ;; Caso base: cualquier número elevado a 0 es 1
    [(> b 0) (* a (potencia a (- b 1)))]  ;; Recursión: a^b = a * a^(b-1)
    [else (/ 1 (potencia a (- b)))]))  ;; Caso b < 0: a^b = 1 / a^(-b)
;(displayln (potencia 2 3))

;(define (contar-caracteres str)
;  (if (string-empty? str)  ;; Caso base: si la cadena está vacía, retornamos 0
;      0
;      (+ 1 (contar-caracteres (substring str 1)))))  ;; Recursión con el resto de la cadena
;(displayln (contar-caracteres "Hola"))

(define (caracteres-unicos? str)
  (cond
    [(<= (string-length str) 1) #t]  ;; Caso base: cadenas vacías o de un solo carácter son únicas
    [(string-contains? (substring str 1) (string-ref str 0)) #f]  ;; Si el primer carácter se repite, no es único
    [else (caracteres-unicos? (substring str 1))]))  ;; Verificamos el resto de la cadena recursivamente
;(displayln (caracteres-unicos? "Hola"))

;(define (revertir-cadena str)
;  (if (or (string-empty? str) (= (string-length str) 1))  ;; Caso base: cadena vacía o de un carácter
;      str
;      (string-append (revertir-cadena (substring str 1))  ;; Recursión con el resto de la cadena
;                     (substring str 0 1))))              ;; Agregar el primer carácter al final
;(displayln (revertir-cadena "Hola"))

(filter even? '(1 2 3 4 5 6))  ;; Resultado: '(2 4 6)
(filter odd? '(1 2 3 4 5 6))  ;; Resultado: '(2 4 6)



















