%Escribe un predicado llamado invertir_lista(L, R) que invierta los elementos de una lista L 
%y devuelva la lista invertida en R.

invertir_lista([],[]).
invertir_lista([H|T], R):-
    invertir_lista(T,TInvertida),
    %unir o agregar los elementos a la lista
    concatenar(TInvertida, [H], R).

%concatenar
concatenar([], L, L).
concatenar([H|T], L, [H|R]):-
    concatenar(T,L,R).

%Escribe un predicado llamado eliminar_elemento(X, L, R) que elimine todas las ocurrencias del 
%elemento X en la lista L y devuelva la lista resultante R.

eliminar_elemento(_,[],[]).
eliminar_elemento(X,[X,T],T).
eliminar_elemento(X,[H|T],[H,R]):-
    eliminar_elemento(X,T,R).

%quitar los primeros dos elementos de la lista
quitar([_,_ | L], L).


progenitor(pedro, [ana, ramon, pedro, javier, josh, vilma, nicolas]).
progenitor(juan, [ben, pepe, josue, jesica, pavel, keith, kyle]).

padre_de(P,Hijo):-
    progenitor(P,Hijos),
    member(Hijo,Hijos).

buscar(_,[]):- !,fail.
buscar(Hijo,[Hijo|L]):-!, true.
buscar(Hijo,[H|T]):-
    buscar(Hijo,T).



