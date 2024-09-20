%hechos
%es una relacion explicita entre los objetos
%relaciona un objeto con otro

%tom es un gato
gato(tom).

%reglas
%es una relacion implicita entre los objetos
%lili es feliz si baila
feliz(lili):-baila(lili).

%base de conocimiento
sing_a_song(ananya).
listens_to_music(rohit).

listens_to_music(ananya) :- sing_a_song(ananya).
happy(ananya) :- sing_a_song(ananya).
happy(rohit) :- listens_to_music(rohit).
playes_guitar(rohit) :- listens_to_music(rohit).






