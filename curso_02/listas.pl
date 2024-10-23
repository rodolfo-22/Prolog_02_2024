%listas
% Es una secuencia ordenada de elementos que puede tener cualquier longitud

hombre(juan).
hombre(pablo).
hombre(jorge).
hombre([]).
hombre([X | Xs]):- hombre(X), hombre(Xs).

%la lista vacia
%predicado([]):-procesar([]).
%predicado([cabeza|cola]):-predicado(cola),procesar(cabeza).

%cuantos elementos tiene la lista
cuenta_elementos([],0).
cuenta_elementos([_|Cola],N):-
    cuenta_elementos(Cola,Tamano),
    N is Tamano+1.

%sumar elementos de una lista
suma_lista([],0).
suma_lista([Cabeza|Cola],Suma):-
    suma_lista(Cola,SumaCola),
    Suma is SumaCola+Cabeza.


% Definir una lista
mi_lista([1, 2, 3, 4]).

% Acceder a la cabeza y la cola de una lista
cabeza_y_cola([H|T]) :-
    write('Cabeza: '), write(H), nl,
    write('Cola: '), write(T).

% Consultar si un elemento pertenece a una lista
miembro(X, [X|_]). % El elemento es la cabeza
miembro(X, [_|T]) :- miembro(X, T). % El elemento está en la cola

% Agregar un elemento al inicio de una lista
agregar_inicio(X, L, [X|L]).

% Concatenar dos listas
concatenar([], L, L).
concatenar([H|T], L, [H|R]) :- concatenar(T, L, R).

invertir([], []).  % La lista vacía es su propio inverso.
invertir([H|T], R) :- invertir(T, TInvertida), concatenar(TInvertida, [H], R).  % Coloca la cabeza al final.

eliminar(_, [], []).  % Si la lista está vacía, no hay nada que eliminar.
eliminar(X, [X|T], T).  % Si la cabeza es el elemento a eliminar, devuelve la cola.
eliminar(X, [H|T], [H|R]) :- eliminar(X, T, R).  % Si no es la cabeza, sigue buscando en la cola.

agregar_final(X, [], [X]).  % Si la lista está vacía, el resultado es una lista con solo el elemento.
agregar_final(X, [H|T], [H|R]) :- agregar_final(X, T, R).  % Recurre hasta llegar al final y agrega el elemento.


ultimo([X], X).  % Si queda un solo elemento, ese es el último.
ultimo([_|T], X) :- ultimo(T, X).  % Recurre hasta el final de la lista.

%Descomponer una lista en su primer elemento (cabeza) y el resto (cola).
dividir([H|T], H, T).  % H es la cabeza, T es la cola.

%Encuentra el valor máximo en una lista de números.
maximo([X], X).  % Si la lista tiene un solo elemento, ese es el máximo.
maximo([H|T], Max) :- maximo(T, MaxTail), Max is max(H, MaxTail).  % Compara la cabeza con el máximo de la cola.

%
