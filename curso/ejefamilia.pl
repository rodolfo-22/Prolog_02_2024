%este ejemplo contiene una familia pequenya, extraido de carpeta apuntes de prolog /document/BN.pdf

mujer(patricia).
mujer(luisa).
mujer(ana).
mujer(maria).

hombre(juan).
hombre(antonio).
hombre(alberto).

ascendente(patricia,alberto).
ascendente(antonio,alberto).
ascendente(antonio,luisa).
ascendente(alberto,ana).
ascendente(alberto,maria).
ascendente(maria,juan).

%clausulas
hijo(X,Y) :- hombre(X), ascendente(Y,X).
madre(X,Y) :- mujer(X), ascendente(X,Y).

hermana(X,Y) :- mujer(X), ascendente(Z,X), ascendente(Z,Y), X \== Y.    
abuela(X,Z) :- mujer(X), ascendente(X,Y), ascendente(Y,Z).

%clausulas de tarea
%definir tio,nieto,primo,bisabuelo
tio(X,Y) :- hijo(Z,Y), hermana(Z,X).