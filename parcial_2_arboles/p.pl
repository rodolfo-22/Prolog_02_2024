%predicado nodos_nivel/3 que recibe un árbol binario de búsqueda, un nivel N, y devuelve una lista con los valores en ese nivel.

%caso base: si el árbol está vacío, la lista es vacía.
nodos_nivel([], _, []):-!.

%caso base: si N es 0, estamos en el nivel buscado, devolvemos una lista con el valor del nodo actual.
nodos_nivel([Valor, _, _], 0, [Valor]):-!.

%caso recursivo: si N es mayor que 0, seguimos buscando en los subárboles.
nodos_nivel([_, SubIzq, SubDer], N, Lista) :-
    N > 0,
    N1 is N - 1,
    nodos_nivel(SubIzq, N1, ListaIzquierda),
    nodos_nivel(SubDer, N1, ListaDerecha),
    append( ListaDerecha, ListaIzquierda, Lista).
