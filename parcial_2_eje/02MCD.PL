%calcule el mcd(máximo común divisor) de dos números
%es el entero mas grande que divide a ambos números
%fun del mcd
calcular_mcd(X,0,X):-
    X>0,!.  
calcular_mcd(X,Y,Z):-
    Y>0,
    is(Mod,mod(X,Y)),
    calcular_mcd(Y,Mod,Z).
%ejemplo mcd(12,18,K).
%mcd(12,18,6).
%agregando

