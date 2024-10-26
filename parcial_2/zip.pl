%Estructura: longitud(la lista, para la variable de respuesta)
longitud([],0):-!.
%caso recursivo, vamos desglosando hasta llegar al ultimo elemento de la lista
%pasamos la cola, cuando la recursion termina , comenzamos a contar con el contador
longitud([H|T],Longi):-
    longitud(T,L1),
    is(Longi,+(L1,1)).

invertir(Lista,LInvertida):-
    reverse(Lista,[],LInvertida).
%Estructura, invertir(lista, variable para el resultado)
%en este caso usamos enmascarar porque hacemos uso de tres lista, la intemedia es la tercera
reverse([],LInvertida,LInvertida):-!.
reverse([H1|T1],L2,LInvertida):-
    reverse(T1,[H1|L2],LInvertida).
%zip exije que ambas listas sean del mismo tamaño, misma cantidad  de elementos.
%ejemplo: zip([1,2,3],[4,5,6],Z) Z=[(1,4),(2,5),(3,6)]
zip(L1,L2,R):-
    longitud(L1,Longitud1),
    longitud(L2,Longitud2),
    =:= (Longitud1,Longitud2),
    zipAux(L1,L2,[],ZR),
    invertir(ZR,Z).

zipAux([],[],Acumulador,Acumulador):-!.
zipAux([H1|T1],[H2|T2],Acumulador,R):-
    = (H3, [ H1, H2| [] ]) 
    zipAux(T1,T2,[H3|Acum0ulador],R).