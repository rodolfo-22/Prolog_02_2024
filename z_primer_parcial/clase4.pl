%operaciones aritmeticas
oiral(N1,Y), is(X,*(N,Y)).

suma(X,Y,R) :- is(R,+(X,Y)).

comparar_igualdad(X,Y) :- is(X,=(X,Y)).
comparar(X,Y) :- is(X,=<(X,Y)).

dividir(X,Y,R) :- is(R,/(X,Y)).
%solo la parte entera
dividir2(X,Y,R) :- is(R,mod(X,Y)).

%clusula para que resolver ecuaciones lineales
%ecuacion_primer_grado(X,Y,R) :- =\=(X,0), is(R,/(-Y,X)).
%debe de encargarse solo de lo principal
ecuacion_primer_grado(0,_,_) :- !, fail.
%fail. es corte y fallo
ecuacion_primer_grado(X,Y,R) :- =\=(X,0), is(R,/(-Y,X)).
%ecuacion cuadratica
%hay dos casos de fallo
%si A es 0
ecuacion_segundo_grado(0,_,_,_,_) :- !, fail.
%si el discriminante es negativo
ecuacion_segundo_grado(A,B,C,_,_) :- is(D, -( *(B,B), *(4,*(A,C)))), <(D,0), !, fail.
ecuacion_segundo_grado(A,B,C,R1,R2) :- is(D, -( *(B,B), *(4,*(A,C)))), =:=(D,0), =(R1,R2), is(R1,/(-B,*(2,A))).
%si el discriminante es positivo
ecuacion_segundo_grado(A,B,C,R1,R2) :-
    is(R1,/(+(-B,sqrt(-(*(B,B), *(4,*(A,C))))), *(2,A))),
    is(R2,/(+(-B,sqrt(-(*(B,B), *(4,*(A,C))))), *(2,A))).

