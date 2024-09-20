%ejercicio de encomntrar si do snumero s son palindromos
es_palindromo(N):-
    invertir_numero(N,Invertido),
    ==(N,Invertido).


invertir_numero(Numero,Invertido) :-
    invertir_numero_aux(Numero,0,Invertido).

invertir_numero_aux(0,Acumulador,Acumulador):-
    !.

invertir_numero_aux(Numero,Acumulador,Invertido):-
    Numero > 0,
    is(Digito, mod(Numero,10)),
    is(NuevaCantidad, +(Digito, *(Acumulador,10))),
    is(RestoNumero, div(Numero,10)),
    invertir_numero_aux(RestoNumero,NuevaCantidad,Invertido).


