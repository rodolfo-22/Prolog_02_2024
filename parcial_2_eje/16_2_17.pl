/*Hacer un predicado que establezca la relación entre dos enteros N y M, y una
lista que tiene todos los enteros desde N hasta M.
*/

rango(N, M, []) :- 
    N > M. % Caso base: si N es mayor que M, la lista es vacía.
    
rango(N, M, [N|Resto]) :- 
    N =< M, % Mientras N sea menor o igual a M, añadimos N a la lista.
    N1 is N + 1, % Incrementamos N.
    rango(N1, M, Resto). % Llamamos recursivamente para el siguiente número.

%rango(3, 7, R).