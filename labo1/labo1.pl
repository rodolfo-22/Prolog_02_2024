%objeto, hecho, relacion, reglas, objetivos, aridad
% objeto:es calgo del mundo real que se puede representar, ejemplos,
% carro botella arbol...
%hecho: algo que se dice del objeto, ejemplo el carro es grande
% relacion: manera en que se realcionan dos objetos como es en prolog,
% tiene(carro,llantas).
%reglas: lo que yo defino para qeu algo pase
%antecendete -> consecuente
% q :- p
%aridad: numero de argumentos que un predicadp recive

%hechos
tiene_pelo(perro).
tiene_pelo(gato).
tiene_pelo(leon).

da_leche(perro).
da_leche(gato).
da_leche(leon).

vuela(aguila).
vuela(perico).
vuela(torogoz).

pone_huevo(aguila).
pone_huevo(perico).
pone_huevo(torogoz).

t_escamas(tiburon).
t_escamas(salmon).
t_escamas(tilapia).
nada(tiburon).
nada(salmon).
nada(tilapia).

t_escamas(iguana).
t_escamas(serpiente).
pone_huevo(iguana).
pone_huevo(serpiente).

%regla
es_mamifero(X) :- tiene_pelo(X), da_leche(X).
es_ave(X) :- vuela(X), pone_huevo(X).
es_reptil(X) :- t_escamas(X), pone_huevo(X).