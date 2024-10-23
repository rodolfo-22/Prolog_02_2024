%[Valor,subIzq,subDer]
%[8,[3,[1,[],[]],[6,[4,[],[]],[7,[],[]]]],[10,[],[14,[13,[],[]],[]]]
%altura(Arbol, Altura)
%caso base
altura([],0):-!.
altura([_, SubArbolIzquierdo, SubArbolDerecho], Altura) :-
  altura(SubArbolIzquierdo, AlturaIzquierda),
  altura(SubArbolDerecho, AlturaDerecha),
  is(AlturaMaxima, max(AlturaIzquierda, AlturaDerecha)),
  is(Altura, AlturaMaxima + 1).
