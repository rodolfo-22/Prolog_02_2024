%inserion sort
insertion_sort([], []).
insertion_sort([H|T], Sorted) :-
    insertion_sort(T, SortedTail),
    insertar_ordenado(H, SortedTail, Sorted).

% Inserta un elemento en su lugar correcto en una lista ordenada.
insertar_ordenado(X, [], [X]).
insertar_ordenado(X, [H|T], [X,H|T]) :- 
     X =< H.
insertar_ordenado(X, [H|T], [H|Sorted]) :- 
     X > H, 
     insertar_ordenado(X, T, Sorted).
%---------------------------------------------------------------------
selection_sort([], []).
selection_sort(Lista, [Min|SortedRest]) :-
    min_list(Lista, Min), % Encuentra el mínimo
    delete(Lista, Min, Rest), % Elimina el mínimo de la lista
    selection_sort(Rest, SortedRest).

% Encuentra el mínimo de una lista.
min_list([X], X).
min_list([X|T], Min) :-
    min_list(T, MinTail),
    Min is min(X, MinTail).

%--------------------------------------------------------
bubble_sort(Lista, Sorted) :-
    swap(Lista, ListaSwapped), !,
    bubble_sort(ListaSwapped, Sorted).
bubble_sort(Sorted, Sorted).

% Realiza un intercambio si los elementos no están en el orden correcto.
swap([X, Y | T], [Y, X | T]) :- X > Y.
swap([Z | T], [Z | TSwapped]) :-
    swap(T, TSwapped).


%--------------------------------------------------------
merge_sort([], []).
merge_sort([X], [X]).
merge_sort(Lista, Sorted) :-
    divide(Lista, L1, L2),  % Divide la lista en dos mitades
    merge_sort(L1, Sorted1), 
    merge_sort(L2, Sorted2), 
    merge(Sorted1, Sorted2, Sorted).

% Divide una lista en dos mitades.
divide(Lista, L1, L2) :- length(Lista, Len), Half is Len // 2, length(L1, Half), append(L1, L2, Lista).

% Mezcla dos listas ordenadas.
merge([], L, L).
merge(L, [], L).
merge([X|T1], [Y|T2], [X|Merged]) :- X =< Y, merge(T1, [Y|T2], Merged).
merge([X|T1], [Y|T2], [Y|Merged]) :- X > Y, merge([X|T1], T2, Merged).


%----------------------------------
binary_search(Lista, Elem) :- 
     binary_search_aux(Lista, Elem, 0).

% Caso base: si encontramos el elemento en la mitad.
binary_search_aux([Elem|_], Elem, _) :- !.
binary_search_aux(Lista, Elem, _) :- 
     Lista == [], fail. % Si no hay más elementos, fallar.

% Si el elemento está en la mitad izquierda.
binary_search_aux(Lista, Elem, _) :-
    length(Lista, Len), Half is Len // 2,
    nth0(Half, Lista, Mid),%Este predicado busca el elemento en la posición Half de la lista Lista y lo unifica con la variable Mid.
    Elem < Mid, 
    length(L1, Half), 
    append(L1, _, Lista),
    binary_search_aux(L1, Elem, 0).

% Si el elemento está en la mitad derecha.
binary_search_aux(Lista, Elem, _) :-
    length(Lista, Len), Half is Len // 2,
    nth0(Half, Lista, Mid),
    Elem > Mid, 
    append(_, [_|L2], Lista),
    binary_search_aux(L2, Elem, 0).
