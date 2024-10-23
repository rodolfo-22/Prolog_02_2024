%recursion por posposcicion: cuando llego al caso base no tegno la respuesta global, sino que se vva resolviendo mientras la llamda va regresando
%la recursion por cola no toca los casos base, sino que se va resolviendo mientras la llamada va 
%recursion por cola: al legar al caso base tengo la respuesta global

%factorial por cola
fact_cola(0,1):-!.
fact_cola(1,1):-!.
fact_cola(N,F):-
    fact_aux(N,1,1,F).
%segun este es el main
fact_aux(N,Acum,N,F):-
    is(F,*(Acum,N)),
    !.
fact_aux(N,Acum,Cont,F):-
    is(Acum1,*(Acum,Cont)),
    is(Cont1,+(Cont,1)),
    fact_aux(N,Acum1,Cont1,F).
%la recursion es lo ultimo, osea, no esatamos posponiendo nada




%fibonacci por cola
fib_cola(0,1):-!.
fib_cola(1,1):-!.

%el supuesto main
fib_cola(N,F):-
    fib_aux(N,2,1,1,F).

%el main llama a la funcion auxiliar
%el caso base
fib_aux(N,N,N1,N2,F):-
    is(F,+(N1,N2)),
    !.
%la recursion
fib_aux(N,Cont,N1,N2,F):-
    is(N3,+(N1,N2)),
    is(Cont1,+(Cont,1)),
    fib_aux(N,Cont1,N2,N3,F).



