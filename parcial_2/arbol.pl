%mostrar los elementos de un arbol
%ejemplo: show([ [ 5, [ 3, [ 1, [], [] ], [ 4, [], [] ] ], [ 9, [], [ 11, [], [] ] ] ] ])

show(nil):-!.
show(Left, Nodo ,Right):-
    \==(Left,nil),
    write(Nodo),write(" "),
    show(Left),
    show(Right).

%arbol binario 
%0 1 o 2 hijos
%todo nodo tiene un subarbol a cada lado
%padre, sub izquierdo y subderecho

%mostrar en preorder: muestra el nodo antes de mostrar los nodos de los subarboles
% show_p(envias la lista)
%ejemplo:
show_pre([]):-!.
show_pre([P,L,R]):-
    write(P),
    write(','),
    show_pre(L),
    show_pre(R).
%mostrar in_order:este muestra en orden los elementos, de menor a mayor
show_order([]):-!.
show_order([P,L,R]):-
    write(L),
    show_order(P),
    write(','),
    show_order(R).
%mostrar post_order: muestra los elementos de los nodos de los subarboles antes de mostrar el nodo
show_post([]):-!.
show_post([P,L,R]):-
    show_post(R),
    write(','),
    show_post(P),
    write(L).

%todo)-----buscar un elemento dentro de un arbol
%search_bst(elemento a buscar,lista (recuerda va padre, izquierdo, derecho))
%caso base, si el arbol esta vacio
search_bst(_,[]):-!,fail.
%caso base, si el elemento es la raiz
search_bst(V,[V|_]):-!.
%caso recursivo, si el elementos es mas pequeño que la raiz
search_bst(V,[P,L,_]):-
    =<(V,P),
    search_bst(V,L),!.
%caso recursivo, si el elemento es mas grande que la raiz
search_bst(V,[P,_,R]):-
    >(V,P),
    search_bst(V,R).

%todo)-----insertar un elemento en un arbol
%insert_v_bst(elemento a insertar, lista (recuerda va padre, izquierdo, derecho), arbol resultante)
%caso base,si la lista a la que queres insertar es lista vacia,
%entonces creas una nueva lista donde el V sea el primer elemento.
insert_v_bst(V,[],[V,[],[]]):-!.
%caso recursivo, si el elemento es mas pequeño que la raiz
insert_v_bst(V,[P,L,R],T):-
    =<(V,P),
    insert_v_bst(V,L,L1),
    =(T,[P,L1,R]),
    !.
%caso recursivo, si el elemento es mas grande que la raiz
insert_v_bst(V,[P,L,R],_):-
    >(V,P),
    insert_v_bst(V,R,R1),
    =(R,[P,L,R1]).

%todo)-----borrar un elemento de un arbol
%Estructura: delete_value(elemento a borrar, lista (recuerda va padre, izquierdo, derecho), arbol resultante)
%el mas facil, quiero borrar un dato, una hoja
delete_value(V,[V,[],[]],[]):-!.
%cuando tiene un solo hijo, evaluar si es el izquierdo o el derecho
delete_value(V,[V,L,[]],L):-!.
delete_value(V,[V,[],R],R):-!.
%cuando tiene dos hijos
delete_value(V,[V,L,R],T):-
    jjj(R,Min),
    delete_value(Min,R,R1),
    =(T,[Min,L,R1]),
    !.
%caso recursivo, si el elemento es mas pequeño que la raiz
delete_value(V,[P,L,R],T):-
    <(V,P),
    delete_value(V,L,L1),
    =(T,[P,L1,R]),
    !.
%caso recursivo, si el elemento es mas grande que la raiz
delete_value(V,[P,L,R],T):-
    >(V,P),
    delete_value(V,R,R1),
    =(T,[P,L,R1]).
%la ocupamos para cuando tiene dos hijos, para encontrar el valor mas chico
jjj([N,[],_],N):-!.
jjj([_,L,_],N):-
    jjj(L,N).

%todo)-------cuantos nodos tiene un arbol
%cEstructura: contar(lista, variable del resultado)
%caso base,la lista esta vacia
contar([],0):-!.
%caso recursivo, iteramos hasta llevar al ultimo elemento del subarbol
contar([_,L,R],N):-
    contar(L,N1),
    contar(R,N2),
    is(N,+(N1,+(N2,1))).

%todo)---------Para calcular el dato o numero mas grande dentro de el arbol
%Estrucutra: max_value(lista,Variable para el resultado)
%recordemos que un bst por definicion tiene el valor mas grande a la derecha de el 
%caso base, albol vacio
max_value([N,_,[]],N):-!.
%caso recursivo, enviamos el subarbol derecho
max_value([_,_,R],N):-
    max_value(R,N).

%todo)------ Calcular el elemento mas pequenio dentro del arbol
%caso base, arbol vacio
min_value([N,[],_],N):-!.
%caso recursivo, mandamos el subarbol izquierdo
min_value([_,L,_],N):-
    min_value(L,N).

%todo)-----------Para verificar si dos arboles son exatamente iguales
%Estructura:(lista1 y lista2), vas a comparalas
%caso base, listas vacias
%ejemplo: equal_trees([a, [b, [], []], [c, [], []]], [a, [b, [], []], [c, [], []]]).
equal_trees([],[]):-!.
%vas comparando la raiz del uno con la raiz del otro
equal_trees([P1,L1,R1],[P2,L2,R2]):-
    =(P1,P2),
    equal_trees(L1,L2),
    equal_trees(R1,R2).
%la magia de prolog
igualdad(T1,T1):-!.

%tarea: que hara equal_trees si los arboles no son iguales


