% Caso base: cuando queda solo un número y no más operadores.
crear_ecuacion([N], [], [N]) :- !.

% Caso recursivo: intercalamos los números y operadores.
crear_ecuacion([N1 | RestoNumeros], [Op | RestoOperadores], [N1, Op | EcuacionResto]) :-
    crear_ecuacion( RestoNumeros, RestoOperadores, EcuacionResto).

% Ejemplo de uso:
% crear_ecuacion([1, 2, 3, 4, 4], ['+', '-', '+', '='], Ecuacion).
