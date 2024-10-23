%Hacer un predicado que establezca la relación entre una lista, y otra que tiene
%los datos de la primera, pero sin repetidos consecutivos.


sin_repetidos_consecutivos([], []). % Caso base: una lista vacía da como resultado una lista vacía.

sin_repetidos_consecutivos([X], [X]). % Si la lista tiene un solo elemento, el resultado es ese mismo elemento.

sin_repetidos_consecutivos([X,X|T], R) :- 
    sin_repetidos_consecutivos([X|T], R). % Si el primer y segundo elemento son iguales, ignoramos el primero y continuamos.

sin_repetidos_consecutivos([X,Y|T], [X|R]) :- 
    X \= Y, % Si el primer y segundo elemento son diferentes, conservamos el primero.
    sin_repetidos_consecutivos([Y|T], R). % Continuamos con el resto de la lista.


%sin_repetidos_consecutivos([1, 1, 2, 3, 3, 3, 4, 4, 5], R).


agrupar_repetidos_consecutivos([], []). % Caso base: una lista vacía se transforma en una lista vacía.

agrupar_repetidos_consecutivos([X], [[X]]). % Una lista con un solo elemento se convierte en una sublista con ese elemento.

agrupar_repetidos_consecutivos([X, X | T], [[X|R1]|R]) :- 
    agrupar_repetidos_consecutivos([X | T], [R1|R]). % Si los primeros dos elementos son iguales, se agrupan en la misma sublista.

agrupar_repetidos_consecutivos([X, Y | T], [[X] | R]) :- 
    X \= Y, % Si los primeros dos elementos son diferentes, se comienza una nueva sublista.
    agrupar_repetidos_consecutivos([Y | T], R). % Continuar agrupando el resto de la lista.

%agrupar_repetidos_consecutivos([1, 1, 2, 3, 3, 3, 4, 4, 5], R).