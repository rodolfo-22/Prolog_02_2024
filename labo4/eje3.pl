%contar elementos pares
%listadelista y un contador
%enmascarar, cuando usas un contador 
contar_pares(Lista,ConteoTotal):-
    contar(Lista, 0, ConteoTotal).

%caso base - si no hay mas sublistas en mi lista
contar([],ContTemporal,ContTemporal):-!.
%caso - todos los elementos de la lista son pares
contar([Sublista|Resto],ContTemporal,ConteoTotal):-
    todos_pares(Sublista),
    is(NContador,+(ContTemporal,1)),
    contar(Resto,NContador,ConteoTotal),
    !.
%exista almenos uno que no es par en la lista
contar([_|Resto],ContTemporal,ConteoTotal):-
    contar(Resto,ContTemporal,ConteoTotal).

%para verificar si todos los elementos no es par
%se llego al final porque se recibe una lista vacia
todos_pares([]):-!.
todos_pares([Elemento|Resto]):-
    is(Modulo, Elemento mod 2),
    =:=(Modulo,0),
    todos_pares(Resto).





