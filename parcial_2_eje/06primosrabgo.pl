% Hacer un predicado que establezca la relación entre dos enteros N y M, y una
%lista que contiene todos los números primos entre N y M.
%ejemplo: numeros_primos(1,10,L). L=[2,3,5,7]
%caso base
numeros_primos(N,M,[]):-
    N > M,
    !.
%caso recursivo, generar lista de primos hasta N
numeros_primos(N,M,[N|T]):-
    N =< M,
    es_primo(N),    %si n es primo, lo agregamos a la lista
    N1 is N + 1,
    numeros_primos(N1,M,T).
%caso recursivo, si n no es primo,
numeros_primos(N,M,L):-
    N =< M,
    \+ es_primo(N), %es para negar el resultado de la funcion es_primo
        % se evalúa como verdadero si no es cierto que N sea primo. es decir, se continua sin agregar ese numeor a la lista
    N1 is N + 1,
    numeros_primos(N1,M,L).
%func auxiliar
% Caso base: el número 2 es primo
es_primo(2) :- !.
% Verifica si X es primo llamando a recursivo/2
es_primo(X) :-
    X > 2,
    recursivo(X, 2).
% Caso base: si Y^2 > X, entonces X es primo
recursivo(X, Y) :-
    Y * Y > X, !.
% Caso recursivo: si X no es divisible por Y, prueba con el siguiente divisor
recursivo(X, Y) :-
    X mod Y =\= 0,
    Y1 is Y + 1,
    recursivo(X, Y1).
