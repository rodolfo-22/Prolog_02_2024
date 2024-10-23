%obtener una lista de todos los nodos impares en un bst
%nodos_impares()
%ejemplo 
%nodos_impares([33, [19, [10, [9, [], []], [15, [], []]], [22, [], []]], [36, [34, [], []], [38, [], []]]], Res).
%nodos_impares([8, [3, [1, [], []], [6, [4, [], []], [7, [], []]]], [10, [], [14, [13, [], []], []]]], Res).
%ejemplo nodos impares [9,15,19,33]

% Verificar si es un BST
es_bst([]) :- !.
es_bst([Valor, SubArbolIzquierdo, SubArbolDerecho]) :-
    todos_menores(SubArbolIzquierdo, Valor),
    todos_mayores(SubArbolDerecho, Valor),
    es_bst(SubArbolIzquierdo),
    es_bst(SubArbolDerecho).

% Verifica si todos los valores del subárbol izquierdo son menores que el valor del nodo
todos_menores([], _).
todos_menores([Valor, SubArbolIzquierdo, SubArbolDerecho], Limite) :-
    <(Valor, Limite),
    todos_menores(SubArbolIzquierdo, Limite),
    todos_menores(SubArbolDerecho, Limite).

% Verifica si todos los valores del subárbol derecho son mayores que el valor del nodo
todos_mayores([], _).
todos_mayores([Valor, SubArbolIzquierdo, SubArbolDerecho], Limite) :-
    >(Valor, Limite),
    todos_mayores(SubArbolIzquierdo, Limite),
    todos_mayores(SubArbolDerecho, Limite).

% Obtener la lista de nodos impares del bst
nodos_impares([], []) :- !.
nodos_impares([Valor, SubArbolIzquierdo, SubArbolDerecho], [Valor|Lista]) :-
    =:=(Valor mod 2, 1),  
    nodos_impares(SubArbolIzquierdo, ListaIzquierda),
    nodos_impares(SubArbolDerecho, ListaDerecha),
    append(ListaIzquierda, ListaDerecha, Lista).
%cuando el valor es par, aqui no se agregan a la lista
nodos_impares([Valor, SubArbolIzquierdo, SubArbolDerecho], Lista) :-
    =:=(Valor mod 2, 0),
    nodos_impares(SubArbolIzquierdo, ListaIzquierda),
    nodos_impares(SubArbolDerecho, ListaDerecha),
    append(ListaIzquierda, ListaDerecha, Lista).


%mascara
nodos_impares(Arbol,Impares):-
     es_bst(Arbol),
     nodos_impares(Arbol, Impares).







