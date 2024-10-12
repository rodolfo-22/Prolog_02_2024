% Hacer un predicado que evalúe si dos números N y M son coprimos.
% Dos números son coprimos si su MCD es 1.
% Definimos el MCD utilizando el algoritmo de Euclides de forma recursiva
mcd(X, 0, X) :- !.
mcd(X, Y, MCD) :-
    R is X mod Y,
    mcd(Y, R, MCD).
coprimo(X,Y):-
    mcd(X,Y,MCD),
    %comprarmos si el mcd es 1, si es 1 entonces son coprimos
    MCD = 1.
%ejemplo coprimo(12,15).