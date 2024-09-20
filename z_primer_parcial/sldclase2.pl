%arboles sld
%analisis de la ejecucion de un programa en prolog

futbol(alberto).
futbol(boris).
titular(boris).

equipo_futbol(X,Y) :-futbol(Y) , equipo(X,Y).

equipo(X,Y) :- !,futbol(X), futbol(Y).
equipo(X,boris) :- futbol(X), titular(X).

% este se pone justo despues de dondoe prolog encuentra otro camino, dos opciones !
