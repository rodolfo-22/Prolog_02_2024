%aplique la formula de combinatoria, traduscala a a forma declarativa.
%primero efectue la formula de factorial
factorial(0,1):- !.
factorial(1,1):- !.
factorial(N, Result) :- 
    N > 0,
    is(N1,-(N,1)), 
    factorial(N1, TempResult), 
    is(Result,*(N,TempResult)).

%formula de combinatoria
%cuando r es cero
combinatoria(_,0,1):- !.
%para caundo es negativo
combinatoria(_,R,0):- 
    R<0,
    write("R no puede ser negativo"),fail.
%n!/(n-r)!*r!
combinatoria(N,R,Resultado) :-
    %primero validamos que n sea mayor que r
    N >= R,
    %calculamos el factorail de n
    factorial(N,FactN),
    %calculamos n-r
    is(NR, -(N,R)),
    %calculamos el factorial del resultado de n-r
    factorial(NR,FactNR),
    %calculamos el factorial de r
    factorial(R,FactR),
    %calculamos la multiplicacion del denominador
    is(Denominador, *(FactNR,FactR)),
    %aplicamos la formula principal
    is(Resultado, /(FactN,Denominador)).