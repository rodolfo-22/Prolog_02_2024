%lista de enteros y una lista de operadores aritméticos
%se generaría una ecuación válida [2,3,5,7,11] y [‘-’,’+’,’+’,’=’] es 2-3+5+7=11
%caso recursivo
%ecu([2,3,5,7,11],['-','+','+','='],Res).
%caso base, cuando las listas ya se recorrieron
ecu([X|Xs], L2,Res):-
    ecuacion(Xs, L2, X, Res).
%Caso base: cuando ambas listas están vacías, la ecuación se ha procesado correctamente
ecuacion([], [], Res, Res):-!.
% Caso recursivo: aplica los operadores aritméticos
% Caso para el operador '=': Verifica si el resultado acumulado es igual al número siguiente
ecuacion([X], ['='], Acum, Res) :-
    Res is Acum,
    Res = X,!.
ecuacion([X|Xs], [O|Os], Acum, Res) :-
    operar(Acum, X, O, Acum1),  % Realiza la operación
    write(Acum), write(' '), write(X), write(' '), write(Acum1), nl,
    ecuacion(Xs, Os, Acum1, Res).
% Operaciones aritméticas básicas
operar(Acum, X, '+', Res) :- Res is Acum + X.
operar(Acum, X, '-', Res) :- Res is Acum - X.
operar(Acum, X, '*', Res) :- Res is Acum * X.
operar(Acum, X, '/', Res) :- Res is Acum / X.





