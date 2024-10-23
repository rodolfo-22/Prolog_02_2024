%verique para cada nodo si es un bst
%es_bst(ArbolBinario)
es_bst([]):-!.
%caso recursivo
es_bst([Valor,SubArbolIzquierdo,SubArbolDerecho]):-
     todos_menores(SubArbolIzquierdo,Valor),
     todos_mayores(SubArbolDerecho,Valor),
     es_bst(SubArbolIzquierdo),
     es_bst(SubArbolDerecho).
%verifica si todos los valores de un arbol son menores que un valor
% caso base
todos_menores([], _) :- !.
 
% caso recursivo
todos_menores([Valor, SubArbolIzquierdo, SubArbolDerecho], Limite) :-
  <(Valor, Limite),
  todos_menores(SubArbolIzquierdo, Limite),
  todos_menores(SubArbolDerecho, Limite).
 
% caso base
todos_mayores([], _) :- !.
 
% caso recursivo
todos_mayores([Valor, SubArbolIzquierdo, SubArbolDerecho], Limite) :-
  >(Valor, Limite),
  todos_mayores(SubArbolIzquierdo, Limite),
  todos_mayores(SubArbolDerecho, Limite).