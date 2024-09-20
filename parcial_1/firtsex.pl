%%% declaraciones
%%hechos
padrede('Juan', 'María'). % Juan es padre de María
padrede('Pablo', 'Juan'). % Pablo es padre de Juan
padrede('Pablo', 'Marcela'). % Pablo es padre de Marcela
padrede('Carlos', 'Débora'). % Carlos es padre de Débora

% A es hijo de B si B es padre de A
hijode(A,B) :- padrede(B,A).
% A es abuelo de B si A es padre de C y C es padre B
abuelode(A,B) :- 
   padrede(A,C), 
   padrede(C,B).
% A y B son hermanos si el padre de A es también el padre de B y si A y B no son lo mismo
hermanode(A,B) :- 
   padrede(C,A) , 
   padrede(C,B), 
   A \== B.        

% A y B son familiares si A es padre de B o A es hijo de B o A es hermano de B
familiarde(A,B) :- 
   padrede(A,B).
familiarde(A,B) :-
   hijode(A,B). 
familiarde(A,B) :- 
   hermanode(A,B).
%%