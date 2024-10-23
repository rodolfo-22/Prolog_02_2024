%tarea, hacer lo inverso, tener una lista de tuplas y devolver dos listas.
%unzip([(1,a),(3,b),(5,c)],L1,L2) L1=[1,3,5], L2=[2,4,6]

separar([],[],[]):-!.
separar([(H1,H2)|T],L1,L2):-
    write(H1),write(H2),nl,
    separar(T,L1Aux,L2Aux),
    =(L1,[H1|L1Aux]),
    =(L2,[H2|L2Aux]).   
    
%por cola
separar2([],[],[]):-!.
separar2([(H1,H2)|T],L1,L2):-
    =(L1,[H1|L1Aux]),
    write(L1),nl,
    =(L2,[H2|L2Aux]),
    write(L2),nl,
    separar2(T,L1Aux,L2Aux).

%por cola 2
separar3([], [], []).
% Caso recursivo
separar3([(X,Y)|T], [X|L1], [Y|L2]) :-
    separar3(T, L1, L2).


% Definir la lista
%lista([(a, s), (b, f), (c, t)]).
% Imprimir cada par en la lista
imprimir_lista([]).
imprimir_lista([(X, Y) | Resto]) :-
    write(X), write(','), write(Y), nl,
    imprimir_lista(Resto).

%invertir
%enmascarar la funcion
%ejemplo: invertir([1,2,3],L) L=[3,2,1]
invertir(Lista,LInvertida):-
    reverse(Lista,[],LInvertida).

reverse([],LInvertida,LInvertida):-!.
reverse([H1|T1],L2,LInvertida):-
    reverse(T1,[H1|L2],LInvertida).

%pares e impares
%ejemplo: pares([1,2,3,4,5,6],P) P=[2,4,6]
%ejemplo: impares([1,2,3,4,5,6],I) I=[1,3,5]
pares([], []).
pares([H|T], [H|P]) :- 
    H mod 2 =:= 0, 
    pares(T, P).
pares([_|T], I) :- 
    pares(T, I).

impares([], []).
impares([H|T], [H|I]) :- 
    H mod 2 =\= 0, 
    impares(T, I).
impares([_|T], P) :- 
    impares(T, P).