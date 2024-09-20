%restaurante
%hechos
calorias(paella,200).
calorias(gaspacho,300).
calorias(filete_,400).
calorias(pollo,380).
calorias(trucha,100).
calorias(vacalao,300).
calorias(flan,200).
calorias(nueces,500).
calorias(naranja,50).

%regla
valor_calorico(X,Y,Z,V, V) :-
    calorias(X,A),
    calorias(Y,B),
    calorias(Z,C),
    is(V, +(A,+(B,C))).

comida_equilibrada(X,Y,Z) :-
    valor_calorico(X,Y,Z,V),
    V =< 800,
    write("Comida equilibrada con "),
    write(V),
    write(" calorias"),
    !.

comida_equilibrada(X,Y,Z) :-
        valor_calorico(X,Y,Z,V),
        V > 800,
        write("Comida no equilibrada con "),
        write(V),
        write(" calorias"),
        comida_equilibrada(X, Y, Z),
        fail.

    
