/*Hacer un predicado que establezca la relación entre una lista, dos números
enteros N y M, y una segunda lista que tiene los datos de la primera desde la
posición N y hasta la posición M.
*/

sublista(Lista, N, M, Sublista) :- 
    sublista_aux(Lista, N, M, 1, Sublista).

% Caso base: Si la lista está vacía, la sublista también lo estará.
sublista_aux([], _, _, _, []).

% Caso donde estamos antes de la posición N, simplemente avanzamos.
sublista_aux([_|T], N, M, Index, Sublista) :-
    Index < N, 
    Index1 is Index + 1,
    sublista_aux(T, N, M, Index1, Sublista).

% Caso donde estamos entre la posición N y M, añadimos el elemento a la sublista.
sublista_aux([X|T], N, M, Index, [X|Sublista]) :-
    Index >= N, 
    Index =< M, 
    Index1 is Index + 1,
    sublista_aux(T, N, M, Index1, Sublista).

% Caso donde hemos pasado la posición M, terminamos.
sublista_aux(_, _, M, Index, []) :-
    Index > M.
