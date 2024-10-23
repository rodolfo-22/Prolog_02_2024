%Hacer un predicado que establezca la relación entre una lista, un número
%entero N, y otra lista con los datos de la primera excepto el que está en la
%posición N

eliminar_en_posicion(Lista, N, Resultado) :- 
    eliminar_en_posicion_aux(Lista, N, 1, Resultado).

% Caso base: Si la lista está vacía, el resultado también es una lista vacía.
eliminar_en_posicion_aux([], _, _, []).

% Caso en el que estamos en la posición N, omitimos el elemento.
eliminar_en_posicion_aux([_|T], N, N, Resultado) :- 
    eliminar_en_posicion_aux(T, N, N1, Resultado).

% Caso en el que no estamos en la posición N, conservamos el elemento.
eliminar_en_posicion_aux([H|T], N, Index, [H|Resultado]) :- 
    Index \= N, 
    Index1 is Index + 1, 
    eliminar_en_posicion_aux(T, N, Index1, Resultado).



