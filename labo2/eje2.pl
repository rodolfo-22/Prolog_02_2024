%utilizanod flujo

%caso base
suma_digito(N, R) :-
    N<10,
    ==(R,N),!.

%caso recursivo
suma_digito(N,R):-
    N >= 10,
    is(Ultimo,mod(N,10)),
    is(RestoNumero, div(N,10)),
    suma_digito(RestoNumero, SumaParcial),
    is(R,+(SumaParcial,Ultimo)).