% Base de conocimiento
hombre(daniel).
hombre(sebastian).
hombre(rafael).
hombre(miguel). 
hombre(alfredo).
hombre(aaron).

mujer(lorna).
mujer(karina).
mujer(elena).
mujer(sofia).

papa(daniel,sebastian).
papa(daniel, karina).
papa(daniel, miguel).
papa(sebastian, sofia).
papa(sebastian, alfredo).
papa(rafael,aaron).

mama(lorna,sebastian).
mama(lorna,karina).
mama(lorna,miguel).
mama(elena,sofia).
mama(elena,alfredo).
mama(karina,aaron).

% Clausulas de Horn
abuelo(X,Y) :- papa(X,Z),papa(Z,Y).
abuelo(X,Y) :- papa(X,Z), mama(Z,Y).

hermano(X,Y) :- hombre(X), papa(F,X), papa(F,Y), mama(M,Y), mama(M,X), \==(X,Y).
hermana(X,Y) :- mujer(X) , papa(F,Y), papa(F,X), mama(M,Y), mama(M,X), \==(X,Y).

sibling(X,Y) :- papa(Z,X), papa(Z,Y), mama(M,X), mama(M,Y), X \== Y.

tio(X,Y) :- papa(F,Y) , hermano(X,F).
tio(X,Y) :- mama(M,Y), hermano(X,M).

tia(X,Y) :- papa(F,Y) , hermana(X,F).
tia(X,Y) :- mama(M,Y), hermana(X,M).

padres(X,Y) :- papa(X,Z), mama(Y,Z).
padres(X,Y) :- mama(X,Z), papa(Y,Z).

% Relación de cuñado (para hombres)
cunyado(X, Y) :- 
    hombre(X), 
    padres(X, Z), 
    padres(Y, Z), 
    sibling(Y, Z), 
    X \= Y.

% Relación de cuñada (para mujeres)
cunyada(X, Y) :- 
    mujer(X), 
    padres(X, Z), 
    padres(Y, Z), 
    sibling(Y, Z), 
    X \= Y.


sobrino(X,Y) :- hombre(X), tio(Y,X).
sobrino(X,Y) :- hombre(X), tia(Y,X).

sobrina(X,Y) :- mujer(X), tio(Y,X).
sobrina(X,Y) :- mujer(X), tia(Y,X).

suegro(X,Y) :- papa(X,Z), padres(Z,Y).
suegra(X,Y) :- mama(X,Z), padres(Z,Y).

bisabuelo(X,Y) :- abuelo(X,Z), papa(Z,Y).
bisabuelo(X,Y) :- abuelo(X,Z), mama(Z,Y).

bisabuela(X,Y) :- abuela(X,Z), papa(Z,Y).
bisabuela(X,Y) :- abuela(X,Z), mama(Z,Y).



%tatarabuelo
%hacer el de cunyada evidenciar porque sale doble
%aprende listas y recursiones
