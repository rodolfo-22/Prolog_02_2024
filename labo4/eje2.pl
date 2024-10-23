%reemplazar elemento
%caso base - lista original no tiene elementos. comienza anadiendo del ultimo al primero
reemplazar(_,_,[],[]):-!.
%reemplzar los elementos de cada sublista de manera recursiva
reemplazar(VAntiguo,VNuevo, [Sublista|Restolista], [SublistaReemplazada|Otrasubreemplazada]):-
    cambiar(VAntiguo,VNuevo,Sublista,SublistaReemplazada),
    reemplazar(VAntiguo,VNuevo,Restolista,Otrasubreemplazada).

%funcion auxiliar
cambiar(_,_,[],[]):-!.
%el elemento es el elemento a modificar
cambiar(VAntiguo,VNuevo, [VAntiguo|RestoElementos],[VNuevo|RestoElementosReemplazados]):-
    cambiar(VAntiguo,VNuevo,RestoElementos,RestoElementosReemplazados),
    !.
%el elemento no es el que queremos cambiar
cambiar(VAntiguo,VNuevo,[H|T],[H|RestoElementosReempla]):-
    cambiar(VAntiguo,VNuevo,T,RestoElementosReempla).


