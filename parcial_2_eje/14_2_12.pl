%Hacer un predicado que establezca la relación entre una lista, un número
%entero N, y otra lista que equivale a la primera pero con los datos que estaban
%en cada N posiciones eliminados.

eliminar_cada_n(Lista, N, Resultado) :- 
    eliminar_cada_n(Lista, N, 1, Resultado).

% Caso base: Si la lista está vacía, la lista resultante también es vacía.
eliminar_cada_n([], _, _, []).

% Si el índice actual es múltiplo de N, se elimina el elemento.
eliminar_cada_n([_|T], N, Index, R) :- 
    Index mod N =:= 0, % Comprobar si el índice es múltiplo de N.
    Index1 is Index + 1, % Incrementar el índice.
    eliminar_cada_n(T, N, Index1, R).

% Si el índice actual no es múltiplo de N, se conserva el elemento.
eliminar_cada_n([H|T], N, Index, [H|R]) :- 
    Index mod N =\= 0, % Comprobar que el índice no es múltiplo de N.
    Index1 is Index + 1, % Incrementar el índice.
    eliminar_cada_n(T, N, Index1, R).

% eliminar_cada_n([a, b, c, d, e, f, g], 3, R).