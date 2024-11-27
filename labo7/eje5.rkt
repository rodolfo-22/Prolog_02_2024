#lang racket

(define (clasificar-recursiva lista numeros cadenas simbolos caracteres)
  (if (empty? lista)
      (list numeros cadenas simbolos caracteres)
      (let [(elemento (first lista))]
        (cond
          [(number? elemento) (clasificar-recursiva (rest lista) (append numeros (list elemento)) cadenas simbolos caracteres)]
          [(string? elemento) (clasificar-recursiva (rest lista) numeros (append cadenas (list elemento)) simbolos caracteres)]
          [(symbol? elemento) (clasificar-recursiva (rest lista) numeros cadenas (append simbolos (list elemento)) caracteres)]
          [(char? elemento) (clasificar-recursiva (rest lista) numeros cadenas simbolos (append caracteres (list elemento)))]
          )
        )
      )
  )

(define (clasificar-tipo-elementos lista)
  (clasificar-recursiva lista '() '() '() '())
  )