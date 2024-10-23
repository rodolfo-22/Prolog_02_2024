%Hacer un predicado que establezca la relación entre una lista, y otra que
%tiene los mismos elementos pero todos duplicados.

duplicar([], []). % Caso base: una lista vacía se convierte en una lista vacía.
duplicar([X|T], [X,X|R]) :- 
    duplicar(T, R). % Duplica el primer elemento y continúa con el resto de la lista.

%. Hacer un predicado que establezca la relación entre una lista, un número
%entero N, y otra lista que tiene los mismos elementos de la primera pero con
%cada dato repetido N veces.

repetir_elementos([], _, []). % Caso base: una lista vacía sigue siendo vacía sin importar el valor de N.

repetir_elementos([X|T], N, R) :-
    repetir(X, N, L),         % Repetir el primer elemento N veces.
    repetir_elementos(T, N, R1), % Procesar el resto de la lista.
    append(L, R1, R).         % Unir los resultados.
    
repetir(_, 0, []). % Caso base: cuando N es 0, no hay repeticiones.

repetir(X, N, [X|L]) :-
    N > 0, 
    N1 is N - 1,        % Reducir N en 1.
    repetir(X, N1, L).  % Repetir el elemento X N1 veces más.
