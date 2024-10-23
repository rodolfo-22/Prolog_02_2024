%palindromo
% reverse, es un predicado predefinido en Prolog que invierte una lista.
es_palindromo(L, true) :- 
     reverse(L, L). % Si la lista es igual a su reversa, es un palíndromo.
es_palindromo(_, false). % Si no es igual, no es un palíndromo.

% ?- es_palindromo([r,a,d,a,r], R).
% Resultado:
% R = true.