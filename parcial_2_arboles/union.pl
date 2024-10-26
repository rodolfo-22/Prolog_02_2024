% Caso base: cuando la lista está vacía.
separar_pares([], [], []).

% Caso recursivo: separamos el primer elemento y el segundo elemento de la sublista.
separar_pares([[X, Y] | Resto], [X | ListaPrimera], [Y | ListaSegunda]) :-
    separar_pares(Resto, ListaPrimera, ListaSegunda).

% Ejemplo de lista de sublistas.
% separar_pares([[1, 2], [3, 4], [4, 6]], ListaPrimera, ListaSegunda).

% Resultado esperado:
% ListaPrimera = [1, 3, 4],
% ListaSegunda = [2, 4, 6].

separar([], [], [], []).
% Caso recursivo: separamos el primer elemento y el segundo elemento de la sublista.
separar([[X, Y, Z] | Resto], [X | ListaPrimera], [Y | ListaSegunda],[Z | L3]) :-
    separar(Resto, ListaPrimera, ListaSegunda, L3).
%ejemplo de uso
% separar([[1, 2, 3], [4, 5, 6], [7, 8, 9]], L1, L2, L3).