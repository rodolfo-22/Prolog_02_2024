% predicado nivel_por_nivel/2 que recibe un árbol binario de búsqueda y devuelve una lista de los valores en recorrido por niveles.

% caso base: si el árbol está vacío, la lista es vacía.
nivel_por_nivel([], []).

% caso recursivo: comenzamos el recorrido por niveles utilizando una cola.
nivel_por_nivel(Arbol, Lista) :-
    recorrido_por_niveles([Arbol], Lista).

% predicado auxiliar recorrido_por_niveles/2 que utiliza una cola para recorrer los niveles.
recorrido_por_niveles([], []).

% caso recursivo: procesar el primer nodo de la cola, agregar sus hijos a la cola y continuar.
recorrido_por_niveles([[Valor, SubIzq, SubDer]|Cola], [Valor|Lista]) :-
    agregar_hijos_a_cola(SubIzq, SubDer, Cola, NuevaCola),
    recorrido_por_niveles(NuevaCola, Lista).

% predicado auxiliar agregar_hijos_a_cola/4 que agrega los hijos del nodo actual a la cola si no están vacíos.
agregar_hijos_a_cola([], [], Cola, Cola).  % Si no hay subárboles, la cola no cambia.
agregar_hijos_a_cola(SubIzq, [], Cola, [SubIzq|Cola]).  % Si solo hay subárbol izquierdo.
agregar_hijos_a_cola([], SubDer, Cola, [SubDer|Cola]).  % Si solo hay subárbol derecho.
agregar_hijos_a_cola(SubIzq, SubDer, Cola, [SubIzq, SubDer|Cola]).  % Si hay ambos subárboles.
