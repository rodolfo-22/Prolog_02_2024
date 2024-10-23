%Hacer un predicado que establezca la relación entre una lista, un dato D, un
%entero N, y otra lista que tiene los datos de la primera pero adicionalmente
%tiene D en la posición N.

insertar_en_posicion(Lista, D, N, Resultado) :- 
    insertar_en_posicion_aux(Lista, D, N, 1, Resultado).

% Caso base: Si estamos en la posición N, insertamos D antes de continuar con el resto de la lista.
insertar_en_posicion_aux(Lista, D, N, N, [D|Lista]).

% Mientras no lleguemos a la posición N, conservamos el elemento actual.
insertar_en_posicion_aux([H|T], D, N, Index, [H|Resultado]) :- 
    Index \= N, 
    Index1 is Index + 1, 
    insertar_en_posicion_aux(T, D, N, Index1, Resultado).

% Caso base: Si la lista está vacía, insertamos D si la posición N es válida.
insertar_en_posicion_aux([], D, N, N, [D]).





