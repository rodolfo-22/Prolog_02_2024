%contar nodos hojas y nodos internos
%caso base
contar_nodos([],0,0):-!.
contar_nodos([_,[],[]],1,0):-!.
%caso recursivo
contar_nodos([_,SubArbolIzquierdo,SubArbolDerecho],NodosHojas,NodosInternos):-
    contar_nodos(SubArbolIzquierdo,NodosHojasIzquierda,NodosInternosIzquierda),
    contar_nodos(SubArbolDerecho,NodosHojasDerecha,NodosInternosDerecha),
    is(NodosHojas,NodosHojasIzquierda+NodosHojasDerecha),
    is(NodosInternos,NodosInternosIzquierda+NodosInternosDerecha+1).

%ejemplo: contar_nodos([8,[3,[1,[],[]],[6,[4,[],[]],[7,[],[]]]],[10,[],[14,[13,[],[]],[]]]],NodosHojas,NodosInternos).

