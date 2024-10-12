%MCM es el minimo comun multiplo de dos numeros
%es el entero mas pequeño que es multiplo de ambos numeros
% Definimos el MCD utilizando el algoritmo de Euclides de forma recursiva
mcd(X, 0, X) :- !.
mcd(X, Y, MCD) :-
    R is X mod Y,
    mcd(Y, R, MCD).

% Definimos el MCM utilizando el MCD recursivo
mcm(X, Y, MCM) :-
    mcd(X, Y, MCD),
    is(MCM,//(X*Y,MCD)).
% el operador // se usa para la division entera, una div que descarta los decimales
% ejemplo mcm(12, 15, Resultado).