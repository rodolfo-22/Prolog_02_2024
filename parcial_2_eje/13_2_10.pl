%Hacer un predicado que establezca la relación entre una lista, y otra que
%tiene los mismos elementos pero todos duplicados.

duplicar([], []). % Caso base: una lista vacía se convierte en una lista vacía.
duplicar([X|T], [X,X|R]) :- 
    duplicar(T, R). % Duplica el primer elemento y continúa con el resto de la lista.
