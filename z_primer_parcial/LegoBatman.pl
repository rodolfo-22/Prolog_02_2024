%Base de conocimiento de lego la pelicula
heroe(batman).
heroe(barbara_gordon).
heroe(robin).
heroe(alfred).

villano(guason).
villano(harley).
villano(sauron).
villano(woldemort).
villano(kong).

identidad_secreta(batman,bruce_wayne).
identidad_secreta(robin,damian_wayne).
identidad_secreta(batman_reto,alfred).

enemigo(batman,guason).
enemigo(guason,batman).
enemigo(batman,sauron).
enemigo(sauron,batman).
enemigo(batman,woldemort).
enemigo(woldemort,batman).
enemigo(batman,kong).
enemigo(kong,batman).
enemigo(barbara_gordon,guason).
enemigo(guason,barbara_gordon).
enemigo(robin,guason).
enemigo(guason,robin).
enemigo(alfred,guason).
enemigo(guason,alfred).

arma_mas_usada(guason,bomba).
arma_mas_usada(batman,batimovil).

poder(batman,rico).
poder(superman,volador).
poder(guason,ninguno).
poder(asertijo,inteligente).
poder(catubela,ninguno).
poder(dos_caras,ninguno).
poder(harley,ninguno).
poder(frio,congelar).
poder(sauron,vision).
poder(woldemort,magia).

equipo(batman, liga_de_la_justicia).
equipo(superman, liga_de_la_justicia).
equipo(barbara_gordon, policia_de_gotham).
equipo(robin, liga_de_la_justicia).
equipo(alfred, liga_de_la_justicia).
equipo(guason, legion_del_mal).
equipo(harley, legion_del_mal).
equipo(sauron, legion_del_mal).
equipo(woldemort, legion_del_mal).
equipo(kong, legion_del_mal).

padre(thomas_wayne,bruce_wayne).
padre(jim_gordon,barbara_gordon).
padre(bruce_wayne,damian_wayne).

madre(martha_wayne,bruce_wayne).

le_gusta(barbara_gordon,estadisticas).

pareja(guason,harley).
pareja(harley,guason).
pareja(asertijo,catubela).
pareja(catubela,asertijo).

mayordomo(alfred).

estado_personaje(guason, prisionero).
estado_personaje(harley, libre).
estado_personaje(sauron, prisionero).
estado_personaje(woldemort, prisionero).
estado_personaje(kong, libre).

habilidad(batman, (detective,peleador,armas)).
habilidad(guason, estratega).
habilidad(robin, acrobata).
habilidad(barbara_gordon, luchadora).
habilidad(alfred, consejero).

combate(batman,guason,victoria).
combate(guason,batman,derrota).
combate(batman,sauron,victoria).
combate(sauron,batman,derrota).
combate(batman,woldemort,derrota).
combate(woldemort,batman,victoria).
combate(batman,kong,derrota).
combate(kong,batman,victoria).
combate(robin,guason,derrota).
combate(guason,robin,victoria).
combate(barbara_gordon,guason,derrota).
combate(guason,barbara_gordon,victoria).
combate(barbara_gordon,guason,victoria).
combate(guason,barbara_gordon,derrota).
combate(alfred,guason,derrota).
combate(guason,alfred,victoria).

localizacion(batman,victoria,fiesta).
localizacion(batman,victoria,mansion).
localizacion(guason,derrota,fiesta).
localizacion(guason,victoria,prision).
localizacion(batman,derrota,mordor).
localizacion(sauron,victoria,mordor).
localizacion(robin,derrota,prision).
localizacion(barbara_gordon,victoria,mansion).
localizacion(alfred,derrota,mansion).



%Reglas
%ingresos dos nombres, determinar si son enemigos
son_enemigos(X,Y) :- 
    enemigo(X,Y).
%ingreso 3, buscar posible aliado
posible_aliado(Atacante,Enemigo,Aliado) :-
    enemigo(Atacante,Enemigo),
    enemigo(Enemigo,Atacante),
    enemigo(Aliado,Enemigo),
    \==(Atacante,Aliado),
    \==(Aliado,Enemigo),
    \==(Atacante,Enemigo).
%buscar identidad secreta
identidad_secreta_de(X) :- 
    identidad_secreta(X,Y),
    write(Y).
%hija
nombre_hijos_de(X) :- 
    padre(X,Y),
    write(Y).
%para conocer el poder del personaje
poder_magico_de(X) :- 
    poder(X,Y),
    write(Y).
%para conocer el arma mas usada
arma_mas_usada_de(X) :- 
    arma_mas_usada(X,Y),
    write(Y).
%para saber si el nombre ingresado es un heroe o un villano
es_heroe_o_villano(X) :- 
    heroe(X),
    write('Es un heroe');
    villano(X),
    write('Es un villano').
%te liste los miembros de un equipo
miembros_de(X) :- 
    equipo(Y,X),
    write(Y), nl,
    fail.
%que te diga a que equipo pertenece un personaje
nombre_equipo_de(X):-
    equipo(X,Y),
    write(Y).
%para saber si un personaje esta en prision o libre
estado_del_personaje(X):-
    estado_personaje(X,Y),
    write(Y).
%que te liste todos los personajes libre o todos los detenidos
lista_personajes_estado(Estado) :-
    estado_personaje(X,Estado),
    write(X), nl,
    fail.
%determinar parejas romanticas
pareja_de(X) :- 
    pareja(X,Y),
    write(Y).
%te liste las habilidades de un personaje
habilidades_de(X) :- 
    habilidad(X,Y),
    write(Y), nl,
    fail.
%resultado de enfrentamiento entre dos personajes
resultado_enfrentamiento_entre(Atacante,Enemigo) :- 
    combate(Atacante,Enemigo,Resultado),
    write(Resultado).
%que liste contra quienes a combatido un personaje
contra_quienes_a_combatido(Atacante) :- 
    combate(Atacante, Enemigo, Resultado),
    write(Enemigo), write(',  resultado:   '), write(Resultado), nl,
    fail.
contra_quienes_a_combatido(_).
%liste las victorias de un personaje
victorias_de(Atacante) :- 
    combate(Atacante,Enemigo,victoria),
    write('victoria'),write(' contra '), write(Enemigo), nl,
    fail.
%lista las derrotas de un personaje
derrotas_de(Atacante) :- 
    combate(Atacante,Enemigo,derrota),
    write('derrota'),write(' contra '), write(Enemigo), nl,
    fail.
%lugar donde un personaje gano obtuvo una victoria
lugar_de_victoria_de(Atacante) :- 
    localizacion(Atacante,victoria,Lugar),
    write(Lugar).
%lugar donde un personaje obtuvo una derrota
lugar_de_derrota_de(Atacante) :- 
    localizacion(Atacante,derrota,Lugar),
    write(Lugar).
%lista los personajes que han estado en un lugar
personajes_en(Lugar) :- 
    localizacion(Personaje,_,Lugar),
    write(Personaje), nl,
    fail.
%lugar de batalla de dos personajes
lugar_de_batalla_entre(Atacante,Enemigo) :- 
    combate(Atacante,Enemigo,Resultado),
    localizacion(Atacante,Resultado,Lugar),
    write(Lugar), nl,
    fail.
%posibles

