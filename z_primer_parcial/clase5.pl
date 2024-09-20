%recursion
%dado el intervalo [A,b], escribir los datos uno por linea.

%caso base
colocar(A,B) :- =:= (A,B), write(A), !.

colocar(A,B) :- write(A),is(Siguiente,+(A,1)), colocar(Siguiente,B).

%dado el intervalo, hacer la sumatoria de todos los datos del intervalo
%caso base
sumar(A,B,Suma) :- =:= (A,B), is(Suma,A), write(Suma), !.

sumar(A,B,Suma) :- is(Suma,+(A,Suma)), is(Siguiente,+(A,1)), sumar(Siguiente,B,Suma).

%finonacci
%clausula que provea el n-esimo terminon de lasucesion de fibonacci

fibonacci(0,1) :- !.
finonacci(1,1) :- !.
fibonacci(N,V) :- 
    is(N1,-(N,1)),
    is(N2,-(N,2)),
    fibonacci(N1,V1),
    fibonacci(N2,V2),
    is(V,+(V1,V2)).

%contar cuanto datos hay en el intervalo
%contar(3,8,C).
contar(A,A,1) :- !.
contar(A,B,C) :- is(Siguiente,+(A,1)), contar(Siguiente,B,C1), is(C,+(C1,1)).

%pasar todos a cola, cuadno se ejecute la trivial alli ya este la respuesta.
%investigar posposicion y cola


