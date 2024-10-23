%predicado buscar_rango/4 que reciba algor binario de busqueda un 
%valor minimo un valor maximo y devuelva una lista co los nodos en ese rango

%caso base
buscar_rango([],_,_,[]):-!.
%caso recursivo valor esta entre minimo y maximo
buscar_rango([Valor,SubArbolIzquierdo,SubArbolDerecho],Minimo,Maximo,[Valor|Lista]):-
    >=(Valor,Minimo),
    =<(Valor,Maximo),
    buscar_rango(SubArbolIzquierdo,Minimo,Maximo,ListaIzquierda),
    buscar_rango(SubArbolDerecho,Minimo,Maximo,ListaDerecha),
    append(ListaIzquierda,ListaDerecha,Lista).
%caso recursivo valor es menor que minimo
buscar_rango([Valor,_,SubArbolDerecho],Minimo,Maximo,Lista):-
    <(Valor,Minimo),
    buscar_rango(SubArbolDerecho,Minimo,Maximo,Lista).
%caso recursivo valor es mayor que maximo
buscar_rango([Valor,SubArbolIzquierdo,_],Minimo,Maximo,Lista):-
    >(Valor,Maximo),
    buscar_rango(SubArbolIzquierdo,Minimo,Maximo,Lista).

%ejemplo: 
%buscar_rango([8, [3, [1, [], []], [6, [4, [], []], [7, [], []]]], [10, [], [14, [13, [], []], []]]], 4, 10, R).





