%Hacer un predicado que establezca la relación entre una lista, un número
%entero N, una segunda lista que tiene los primeros N elementos de la primera
%lista, y una tercera lista que tiene el resto de elementos de la primera lista.

dividir_lista(Lista, N, PrimeraN, Resto) :- 
    dividir_lista_aux(Lista, N, PrimeraN, Resto).

% Caso base: si N es 0, los primeros N elementos son una lista vacía, y el resto es la lista completa.
dividir_lista_aux(Resto, 0, [], Resto).

% Si todavía quedan elementos por tomar (N > 0), tomamos el primer elemento de la lista.
dividir_lista_aux([X|T], N, [X|PrimeraN], Resto) :- 
    N > 0, 
    N1 is N - 1,                 % Reducimos el valor de N.
    dividir_lista_aux(T, N1, PrimeraN, Resto). % Continuamos dividiendo el resto de la lista.

%dividir_lista([a, b, c, d, e, f], 3, PrimeraN, Resto).