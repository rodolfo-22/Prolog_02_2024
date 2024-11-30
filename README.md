# Curso Intensivo de Prolog y Racket

## Tabla de Contenidos
1. [Sobre el Proyecto](#sobre-el-proyecto)
2. [Características Principales](#características-principales)
3. [Construido Con](#construido-con)
4. [Requisitos Previos](#requisitos-previos)
5. [Instalación](#instalación)
6. [Uso](#uso)
7. [Ejemplo](#ejemplo)
8. [Contribuciones](#contribuciones)
9. [Desarrolladores](#desarrolladores)
10. [Licencia](#licencia)
11. [Contacto](#contacto)

## Sobre el Proyecto
Este repositorio es un curso intensivo de Prolog y Racket, diseñado para llevarte desde las bases hasta un nivel avanzado. Su propósito es servir como una guía de repaso o un recurso para mejorar habilidades (upskilling) en estos lenguajes.

## Características Principales
- Incluye teoría y ejercicios prácticos.
- Ejercicios progresivos para dominar desde lo básico hasta lo avanzado.
- Ejemplos claros y bien documentados.

## Construido Con
- [Doctor Racket](https://racket-lang.org/): IDE para Racket.
- [Visual Studio Code](https://code.visualstudio.com/): Editor de texto para Prolog.

## Requisitos Previos
- Descargar e instalar los siguientes IDEs:
  - Doctor Racket
  - Visual Studio Code
- Familiaridad básica con lenguajes de programación (recomendado).

## Instalación
1. Clona este repositorio:
   ```bash
   git clone https://github.com/tu_usuario/curso-prolog-racket.git
   ```
2. Navega a la carpeta del proyecto:
   ```bash
   cd curso-prolog-racket
   ```
3. Abre los archivos con los IDEs correspondientes.

## Uso
1. Abre los ejemplos teóricos para entender las bases.
2. Practica con los ejercicios provistos.
3. Experimenta modificando el código para consolidar tu aprendizaje.

## Ejemplo
Un ejemplo de Prolog incluido en el repositorio:

```prolog
% Restaurante
% Hechos
calorias(paella,200).
calorias(gazpacho,300).
calorias(filete,400).
calorias(pollo,380).
calorias(trucha,100).
calorias(vacalao,300).
calorias(flan,200).
calorias(nueces,500).
calorias(naranja,50).

% Regla
valor_calorico(X,Y,Z,V) :-
    calorias(X,A),
    calorias(Y,B),
    calorias(Z,C),
    V is A + B + C.

comida_equilibrada(X,Y,Z) :-
    valor_calorico(X,Y,Z,V),
    V =< 800,
    write("Comida equilibrada con "),
    write(V),
    write(" calorías"),
    !.

comida_equilibrada(X,Y,Z) :-
    valor_calorico(X,Y,Z,V),
    V > 800,
    write("Comida no equilibrada con "),
    write(V),
    write(" calorías"),
    fail.
```

![Código de Ejemplo](ruta/a/imagen.png)

## Contribuciones
Este es un repositorio personal. No se aceptan contribuciones externas por el momento.

## Desarrolladores
Creado y mantenido por: **Rodolfo Garcia Castillo**

## Licencia
Actualmente no hay una licencia asignada.

## Contacto
Para dudas o sugerencias, por favor escribe a:
- **Correo:** 00082421@uca.edu.sv
