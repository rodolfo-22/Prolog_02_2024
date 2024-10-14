%obtener el ultimo elemento de lalista
%ultimo([1, 2, 3, 4], X).
ultimo([X],X):-!.
ultimo([_|T],Res):-
    ultimo(T,Res).


%obtener el penultimo elemento de la lista
%penultimo([1, 2, 3, 4], X).
penultimo([X,_],X):-!.
penultimo([_|T],Res):-
    penultimo(T,Res).

%obtener el n-esimo elemento de la lista
%elemento_n([1, 2, 3, 4], 2, X).
elemento_n([X|_],1,X):-!.
elemento_n([_|T],N,Res):-
    N1 is N-1,
    elemento_n(T,N1,Res). 

%obtener la longitud de la lista
longitud([],0):-!.
longitud([_|T],Res):-
    longitud(T,Res1),
    Res is Res1+1.

%suma los elememntos de la lista
%suma([1, 2, 3, 4], X).
suma([],0):-!.
suma([H|T],Res):-
    suma(T,Res1),
    Res is Res1+H.



