%filtar listas con cantidad de digitos impares, luego mostrar esas listas.
%caso base - si no hay mas sublistas en mi lista
filtrar_longitud_impar([],[]):-!.
%caso recursivo
filtrar_longitud_impar([Sublista|Resto], [Sublista|RestoFiltrado]):-
    longitud_lista(Sublista, Longitud),
    =(Modulo, Longitud mod 2),
    =\=(Modulo, 0),
    filtrar_longitud_impar(Resto, RestoFiltrado),!.
%caso recursivo 
filtrar_longitud_impar([_|Resto], RestoFiltrado):-
    filtrar_longitud_impar(Resto, RestoFiltrado).

%para calcular longitud de una lista
longitud_lista([],0):-!.
longitud_lista([_|Resto],Longitud):-
    longitud_lista(Resto,SubLongitud),
    is(Longitud, +(SubLongitud, 1)).

%-------------------------------------------------------------------------------------------
%caso de prueba: filtrar_longitud_impar([[1,2,3],[4,5],[6],[7,8,9,10]],R).
%R = [[1, 2, 3], [6]].
%filtrar_longitud_impar([[1,2,3],[4,5],[6],[7,8,9,10,5]],R).
%R = [[1, 2, 3], [6], [7, 8, 9, 10, 5]].
%filtrar_longitud_impar([[1,2,3],[4,5],[],[7,8,9,10,5]],R).
%[[1, 2, 3], [7, 8, 9, 10, 5]].





