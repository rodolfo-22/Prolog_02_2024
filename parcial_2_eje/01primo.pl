%Hacer un predicado que evalúe si un número N es primo
%ejemplo:es_primo(11). esto da true
%caso base
es_primo(2). %recordemos que el 2 es el primer numero primo
%caso recursivo
es_primo(X):-
    X > 2,
    recursivo(X,2).
%func auxiliar
recursivo(X,Y):-
    Y * Y > X,!.  % Caso base: si D^2 > N, entonces N es primo
recursivo(X,Y):-
    =\=(0,mod(X,Y)), %si el modulo de X con Y es distinto de 0,sig que no es divisor de X
    Y1 is Y + 1, %incrementamos Y en 1
    recursivo(X,Y1). %llamamos recursivamente a la funcion