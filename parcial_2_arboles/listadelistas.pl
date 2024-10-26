% predicado niveles_arbol/2 que recibe un árbol binario de búsqueda y devuelve una lista de listas donde cada sublista representa un nivel del árbol.

% caso base: si el árbol está vacío, la lista es vacía.
niveles_arbol([], []):-!.

% caso recursivo: comenzamos el recorrido por niveles utilizando una cola.
niveles_arbol(Arbol, ListaDeNiveles) :-
    recorrido_por_niveles([Arbol], ListaDeNiveles).

% predicado auxiliar recorrido_por_niveles/2 que usa una cola y va generando la lista de listas.
recorrido_por_niveles([], []):-!.

recorrido_por_niveles(Cola, [NivelActual|ListaDeNiveles]) :-
    extraer_nivel(Cola, NivelActual, ColaRestante),
    agregar_hijos(Cola, ColaRestante, NuevaCola),
    recorrido_por_niveles(NuevaCola, ListaDeNiveles).

% predicado auxiliar extraer_nivel/3 que extrae los valores de un nivel y deja la cola restante.
extraer_nivel([], [], []):-!.

extraer_nivel([[Valor, _, _]|Resto], [Valor|Nivel], ColaRestante) :-
    extraer_nivel(Resto, Nivel, ColaRestante).

% predicado auxiliar agregar_hijos/3 que agrega los hijos de los nodos a la cola de los próximos niveles.
agregar_hijos([], ColaRestante, ColaRestante).

agregar_hijos([[_, SubIzq, SubDer]|Resto], ColaRestante, NuevaCola) :-
    agregar_si_no_vacio(SubIzq, ColaRestante, ColaTemp),
    agregar_si_no_vacio(SubDer, ColaTemp, ColaFinal),
    agregar_hijos(Resto, ColaFinal, NuevaCola).

% predicado auxiliar agregar_si_no_vacio/3 que agrega un subárbol a la cola si no está vacío.
agregar_si_no_vacio([], Cola, Cola).
agregar_si_no_vacio(SubArbol, Cola, [SubArbol|Cola]).

% Ejemplo de un árbol binario de búsqueda.
% niveles_arbol([5, [3, [2, [], []], [4, [], []]], [7, [6, [], []], [8, [], []]]], ListaDeNiveles).

% Resultado esperado:
% ListaDeNiveles = [[5], [3, 7], [2, 4, 6, 8]].
