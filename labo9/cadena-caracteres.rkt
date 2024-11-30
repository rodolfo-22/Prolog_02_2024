#lang racket

;; Función para contar cuántas vocales tiene una cadena
(define (contar-vocales cadena)
  (let ([vocales '("a" "e" "i" "o" "u")])  ;; Lista de vocales
    (length
     (filter (lambda (caracter)
               (member (string-downcase caracter) vocales))  ;; Verifica si es vocal
             (string->list cadena))
             )))  ;; Convertimos la cadena en lista de caracteres
;(displayln (contar-vocales "Hola Mundo"))

;; Función para convertir vocales a mayúsculas
(define (convertir-vocales-a-mayusculas cadena)
  (let ([vocales '("a" "e" "i" "o" "u")])  ;; Lista de vocales
    (list->string
     (map (lambda (caracter)
            (if (member (string-downcase (string caracter)) vocales)  ;; Verifica si es vocal
                (string-upcase (string caracter))  ;; Convierte a mayúsculas
                (string caracter)))  ;; Deja los demás caracteres sin cambios
          (string->list cadena)))))  ;; Convierte la cadena a lista de caracteres
;(displayln (convertir-vocales-a-mayusculas "Hola Mundo"))

(define (procesar-lista numeros)
  (let ([operacion (lambda (x)
                     (if (even? x)  ;; Si el número es par
                         (/ x 2)    ;; Dividir entre 2
                         (* x 3)))])  ;; Si no, multiplicar por 3
    (map operacion numeros)))  ;; Aplicar la operación a cada número
;(displayln (procesar-lista '(1 2 3 4 5)))

;; Función para contar cuántas veces aparece una palabra en una cadena
(define (contar-palabra cadena palabra)
  (let ([palabras (string-split cadena)])  ;; Dividir la cadena en palabras
    (length (filter (lambda (x) (string=? x palabra)) palabras))))  ;; Contar coincidencias
;(displayln (contar-palabra "hola mundo hola Racket hola" "hola"))

;; Función para dividir una cadena y ordenar las palabras alfabéticamente
(define (ordenar-palabras cadena)
  (sort (string-split cadena) string<?))  ;; Dividir la cadena y ordenar alfabéticamente
;(displayln (ordenar-palabras "hola mundo hola Racket hola"))

;; Función para reemplazar todas las apariciones de una palabra en una cadena
(define (reemplazar-palabra cadena palabra-a palabra-b)
  (string-join
   (map (lambda (palabra)
          (if (string=? palabra palabra-a)  ;; Si la palabra coincide con palabra-a
              palabra-b                     ;; Reemplazar por palabra-b
              palabra))                     ;; Dejar la palabra sin cambios
        (string-split cadena))             ;; Dividir la cadena en palabras
   " "))                                   ;; Unir las palabras con espacios
;(displayln (reemplazar-palabra "hola mundo hola Racket hola" "hola" "hello"))

;; Función para determinar si una cadena es un palíndromo
(define (es-palindromo? cadena)
  (let ([limpia (string-replace (string-downcase cadena) " " "")])  ;; Convertir a minúsculas y quitar espacios
    (string=? limpia (list->string (reverse (string->list limpia))))))  ;; Comparar con su reverso
;(displayln (es-palindromo? "Anita lava la tina"))

;; Función para contar el número de palabras en una cadena
(define (contar-palabras cadena)
  (length (string-split cadena)))  ;; Dividir la cadena en palabras y contar
;(displayln (contar-palabras "Hola mundo Racket"))

;; Función para obtener palabras que comienzan con un carácter dado
(define (palabras-que-comienzan cadena caracter)
  (filter (lambda (palabra)
            (string=? (string (string-ref palabra 0)) (string caracter))) ;; Comparar el primer carácter
          (string-split cadena)))  ;; Dividir la cadena en palabras
;(displayln (palabras-que-comienzan "Hola mundo hermoso hogar" #\h))

;; Función para determinar si dos cadenas son anagramas
(define (son-anagramas? cadena1 cadena2)
  (let ([normalizar (lambda (cadena)
                      (sort (filter (lambda (c) (char-alphabetic? c))
                                    (string->list (string-downcase cadena)))
                            char<?))])  ;; Ordenar alfabéticamente
    (equal? (normalizar cadena1) (normalizar cadena2))))  ;; Comparar las listas normalizadas
;(displayln (son-anagramas? "amor" "roma"))

