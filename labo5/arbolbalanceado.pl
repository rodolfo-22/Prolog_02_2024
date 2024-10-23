altura([],0):-!.
altura([_, SubArbolIzquierdo, SubArbolDerecho], Altura) :-
  altura(SubArbolIzquierdo, AlturaIzquierda),
  altura(SubArbolDerecho, AlturaDerecha),
  is(AlturaMaxima, max(AlturaIzquierda, AlturaDerecha)),
  is(Altura, AlturaMaxima + 1).
%calcular si un arbol es balanceado
%es_balanceado(ArbolBinario)
es_balanceado([]):-!.
es_balanceado([_, SubArbolIzquierdo,SubArbolDerecho]):-
     altura(SubArbolIzquierdo,AlturaIzquierda),
     altura(SubArbolDerecho,AlturaDerecha),
     =<(abs(AlturaIzquierda-AlturaDerecha),1),
     es_balanceado(SubArbolIzquierdo),
     es_balanceado(SubArbolDerecho).
%ejemplo: es_balanceado([8,[3,[1,[],[]],[6,[4,[],[]],[7,[],[]]]],[10,[],[14,[13,[],[]],[]]]]).
%ejemplo con uno balanceado: es_balanceado([8,[3,[1,[],[]],[6,[4,[],[]],[7,[],[]]]],[10,[9],[14,[13,[],[]],[]]]]).