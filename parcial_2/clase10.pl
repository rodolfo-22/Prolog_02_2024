%longitud de la lista
%Estructura: longitud(la lista, para la variable de respuesta)
longitud([],0):-!.
%caso recursivo, vamos desglosando hasta llegar al ultimo elemento de la lista
%pasamos la cola, cuando la recursion termina , comenzamos a contar con el contador
longitud([H|T],Longi):-
    longitud(T,L1),
    is(Longi,+(L1,1)).

%sumatoria
%Estructura, sumatoria(lista, varible para el resultado)
sumatoria([],0):-!.
%similar, iteramos hasta el ultimo elemento de la lista, llegamos lista vacia
%entonces sumamos cero, acaba la recursion, luego sumamos el anterior temrino
%que es la cabeza y asi sucevamente
sumatoria([H|T], S):-
    sumatoria(T, S1),
    is(S, +(H, S1)).

%todo invertir
%enmascarar la funcion
invertir(Lista,LInvertida):-
    reverse(Lista,[],LInvertida).
%Estructura, invertir(lista, variable para el resultado)
%en este caso usamos enmascarar porque hacemos uso de tres lista, la intemedia es la tercera
reverse([],LInvertida,LInvertida):-!.
reverse([H1|T1],L2,LInvertida):-
    reverse(T1,[H1|L2],LInvertida).

%notar si son por posposicion o por cola, recordemos que por posposicion es menos eficiente, ya que queda 
%trabajo por hacer luego de la llamada recursiva.

unir([],L2,L2):-!.
unir([|],L2,R):-
    unir(T1,[H1|L2],R).

%concatenar-tenes dos listas y la queres hacer una sola
concatenar(L1,L2,R):-
    reverse(L1,[],L1Invertida),
    unir(L1Invertida,L2,R). 

%es por cola, entonces utiliza un contador o un acumulador o ambos al mismo tiempo.
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

%tarea, hacer lo inverso, tener una lista de tuplas y devolver dos listas.
%unzip([(1,2),(3,4),(5,6)],L1,L2) L1=[1,3,5], L2=[2,4,6]


%coso([[H|T]|[H|T]])