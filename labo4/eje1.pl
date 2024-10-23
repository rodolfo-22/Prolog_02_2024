%recorrer lista de lista
%caso base - la lista no tiene elemetnos
recorrer([]):-!.
recorrer([SubLista|RestoElementos]):-
    recorrer_interna(SubLista),
    recorrer(RestoElementos).

%para recorrer la lista interna
recorrer_interna([]):-!.
recorrer_interna([H|T]):-
    write(H),write(' '),
    recorrer_interna(T).
    
%eje  recorrer([[1,2,3],[4,5],[6]]).