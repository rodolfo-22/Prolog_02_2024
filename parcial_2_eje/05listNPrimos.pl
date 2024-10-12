%Hacer un predicado que establezca la relación entre un entero N una lista que
%contiene los factores primos de N.
%Un factor primo de un número N es un número primo que divide a N sin dejar residuo
% Caso base: si N es 1, los factores primos están completos.
factores_primos(1, []) :- !.
% Caso recursivo: buscar el primer divisor primo y continuar factorizando.
factores_primos(N, [H|T]) :-
    N > 1,
    divisor_menor(N, H),  % Encuentra el menor divisor de N (el primer factor primo)
    N1 is N // H,         % Divide N por el menor divisor H
    factores_primos(N1, T).  % Recursivamente factoriza el cociente
% Encuentra el menor divisor de N comenzando desde 2.
divisor_menor(N, D) :-
    divisor_menor(N, 2, D).

% Si el divisor prueba dividir a N, lo encontramos.
divisor_menor(N, D, D) :-
    0 is N mod D, !.   % Si N es divisible por D, es el menor divisor

% Si no es divisible, prueba con el siguiente número.
divisor_menor(N, D, R) :-
    D1 is D + 1,       % Incrementa el divisor
    divisor_menor(N, D1, R).  % Prueba con el siguiente divisor
