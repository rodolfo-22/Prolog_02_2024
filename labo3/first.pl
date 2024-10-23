%listas, pueden tener de cualquier tipo de datos 
%[]
%el ordende los elementos si importa. para accedera ello necestiamos un recorrido lineal
%is sirve para ligar a una variable el resultado de una operacion aritmetica
%= sirve para ligar una lista a una variable =(L,[1,2,5,4])
%listas vacias, casos base 
%[H|T] cabeza y cola

%agregar elementos a una lista (4,[1,2,3],R) sera [4123]
add_element(ElementAdd, Lista, NuevaLista):-
    =(NuevaLista,[ElementAdd|Lista]).

%eliminar elemento
%operador anonimo, _, si no utilizas la varible, no la pongas, pon guion bajo
delete_firts(Lista,NuevaLista):-
    =(Lista,[_|T]),
    =(NuevaLista,[T]).

%mostrar los elementos de una lista
show([]):-!.
show([H|T]):-
    write(H),
    write(' '),
    show(T).

%mostrar en orden inverso
inverso([]):-!.
inverso([H|T]):-
    inverso(T),
    write(H),|      
    write(' ').

%buscar un elemento y devuelva la posicion
buscar(_,[],_,-1):-!.
buscar(Elemento,[H|_],Contador,Posicion):-
    ==(Elemento,H),
    is(Posicion,Contador),
    !.
buscar(Elemento,[H|T],Contador,Posicion):-
    \==(Elemento,H),
    is(Contador1,+(Contador,1)),
    buscar(Elemento,T,Contador1,Posicion).

%no podes dejar que el usuario inicie el contador
realizar_busqueda(Elemento, Lista, Posicion):-
    buscar(Elemento,Lista,1,Posicion).

%contar recurrencias de un elemento en la lista
%contar_r(Elemento,Lista,contador, ocurrecias)
contar_r(_,[],Contador,Contador):-!.
contar_r(Elemento,[Elemento|T],Contador,Ocurrecias):-
    is(Contador1,+(Contador,1)),
    contar_r(Elemento,T,Contador1,Ocurrecias),
    !.
contar_r(Elemento,[_|T],Contador,Ocurrecias):-
    contar_r(Elemento,T,Contador,Ocurrecias).

%eliminar todas las ocurrencias
%del_ocurrencia(Elemento,Lista,Respuesta)
del_ocurrencia(_,[],[]):-!.
del_ocurrencia(Elemento,[Elemento|T],ListaModificada):-
    del_ocurrencia(Elemento,T,ListaModificada),
    !.
del_ocurrencia(Elemento,[H|T],ListaModificada):-
    del_ocurrencia(Elemento, T, ListaModificada1),
    =(ListaModificada, [H|ListaModificada1]).



