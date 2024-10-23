%listas
%condicino de para, la lista vacia

%contar elementos de un lista 
%caso base
contar([],0):-!.
contar([_|T],N):-
    contar(T,N1),
    is(N,+(N1,1)).

%multilistas
%son listas de listas
%elaborar un programa que dada unalistade listas, despliegue todos sus elementos
%en orden de aparicion
%ejempo: show([[1,2,3],[4,5,6],[7,8,9]])
show([]):-!.
%para cuando el primer elemento es un unico valor
show([H|T]):-
    atomic(H),
    write(H),nl,
    show(T).
%para cuando el primer elemento es una lista
%\+ no es
show([H|T]):-
    \+atomic(H),
    show(H),
    show(T).   
    

%var()
?- var(X).
true.

?- var(5).
false.

%Verifica si un término es una estructura compuesta, como una lista o un 
%término con aridad mayor a cero.
?- compound(f(a, b)).
true.

?- compound(hello).
false.

%Este operador niega el resultado de un predicado. Si el predicado es verdadero, 
%\+/1 lo hará falso, y viceversa.
?- \+ atomic([1, 2, 3]).
true.

?- \+ integer(5).
false.

% Evalúa una expresión aritmética a su valor numérico. Se utiliza cuando 
%necesitas calcular algo en Prolog.
?- X is 3 + 4.
X = 7.

?- X = 3 + 4.
X = 3+4.  % No se evalúa, solo se unifica.

%compare
?- compare(Comp, 2, 3).
Comp = <.

?- compare(Comp, 4, 4).
Comp = =.

%igualdad estrucutral
?- f(a) == f(a).
true.

?- f(a) == f(b).
false.

?- f(a) \== f(b).
true.

%igualdad numerica
?- 5 =:= 5.
true.

?- 5 =:= 2 + 3.
true.

?- 5 =\= 2 + 3.
false.



