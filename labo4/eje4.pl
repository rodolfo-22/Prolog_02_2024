%encontrar la longitud de la lista mas larga
longitud([],0):-!.
longitud([SubLista|Resto],LMaxima):-
    longitud_lista(SubLista,LongitudPrimera),
    longitud(Resto,LMResto),
    maximo_numero(LongitudPrimera, LMResto,LMaxima).

%para calcular longitud de una lista
longitud_lista([],0):-!.
longitud_lista([_|Resto],Longitud):-
    longitud_lista(Resto,SubLongitud),
    is(Longitud, +(SubLongitud, 1)).

%para comparar cual lista es mas larga
maximo_numero(A,B,A):-
    A >= B, !.
maximo_numero(A,B,B):-
    A < B, !.



