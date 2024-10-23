%eliminar un elemento en una posicion especifica
%del_element(Lista,Posicion,Contador,NuevaLista)
%Caso Base: Si la lista es vacía
del_element([],_,_,[]):-!.
%cuando encuentro la posicion que quiero eliminar
del_element([_|T],Posicion,Posicion,NuevaLista):-
    is(Contador2,+(Posicion,1)),
    del_element(T,Posicion,Contador2,NuevaLista),
    !.
%caso recursivo
del_element([H|T],Posicion,Contador,[H|NuevaCola]):-
    is(Contador1,+(Contador,1)),
    del_element(T,Posicion,Contador1,NuevaCola).

%enmascarar
eliminar_elemento_en_posicion(Lista,Posicion,NuevaLista):-
    del_element(Lista,Posicion,1,NuevaLista).

%Ejemplo
%eliminar_elemento_en_posicion([1,2,3,4,5,5,5,5,6],6,R).
%R = [1, 2, 3, 4, 5, 5, 5, 6].

%eliminar_elemento_en_posicion([1,2,3,4,5,5,5,5,6],1,R).
%R = [2, 3, 4, 5, 5, 5, 5, 6]

%eliminar_elemento_en_posicion([1,2,3,4,5,5,5,5,6],9,R).
%R = [1, 2, 3, 4, 5, 5, 5, 5].