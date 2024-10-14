%una lista y su reverso
%reverso([1, 2, 3, 4], X).
reverso(Lista, Resultado) :- 
     reverso_acum(Lista, [], Resultado).

reverso_acum([], Acumulador, Acumulador).  % Caso base: cuando llegamos al final, el acumulador contiene la lista invertida.
reverso_acum([H|T], Acumulador, Resultado) :-
    reverso_acum(T, [H|Acumulador], Resultado).  % En cada paso, agrega H al frente del acumulador.


