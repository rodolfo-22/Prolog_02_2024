%Hacer un predicado que establezca la relación entre una lista de listas, y una
%lista simple que contenga todos los datos y subdatos de la primera.

aplanar([], []):-!. % Caso base: una lista vacía se convierte en una lista vacía.
aplanar([X|Xs], L) :- 
    is_list(X),        % Verifica si el primer elemento es una lista.
    aplanar(X, X1),    % Aplana ese primer elemento recursivamente.
    aplanar(Xs, X2),   % Aplana el resto de la lista.
    append(X1, X2, L). % Une la lista aplanada del primer elemento con el resto.

aplanar([X|Xs], [X|L]) :- 
    \+ is_list(X),     % Si X no es una lista, simplemente lo añadimos al resultado.
    aplanar(Xs, L).    % Aplana el resto de la lista.

%aplanar([[1, 2], [3, [4, 5]], [6]], L).


