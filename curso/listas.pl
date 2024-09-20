%listas
impares([1,3,5,7,9]).
pares([2,4,6,8,10]).
primos([13,1,7,11,41,3]).

colores([rojo,verde,azul,amarillo,blanco,negro]).

%Regla para unir
concatenar(ListaConcatenada) :-
        impares(Impares),
        pares(Pares),
        append(Impares, Pares, ListaConcatenada).


%para ordenar la lista
ordenar(ListaSinOrdenar, ListaOrdenada) :-
        sort(ListaSinOrdenar, ListaOrdenada).

%invertir una lista
invertir(Lista,ListaInvertida) :-
        reverse(Lista, ListaInvertida).







