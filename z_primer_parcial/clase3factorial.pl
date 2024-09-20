%factorial

factorial(0,1):- !.
factorial(1,1):- !.
%factorial(2,2).
%factorial(3,6).
%factorial(4,24).


%no funciona porque -(n,1) no es una proposicion
%factorial(N,X) :- *(N,factorial(-(N,1),Y))
%las clausulas funcionan con proporcisiones.
%las clasusulas no le podes dar operaciones aritmeticas de una vez.
%trabaja con proposiciones
%establecer la proposicion de n1 is n-1
%el siguiente no funciona porque no es forma imperativa
%factorial(N, Result) :- N > 0, N1 is N - 1, factorial(N1, TempResult), Result is N * TempResult.

factorial(N, Result) :-
     N > 0, 
     is(N1,-(N,1)), 
     factorial(N1, TempResult), 
     is(Result,*(N,TempResult)).