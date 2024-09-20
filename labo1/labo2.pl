%javito y los videojuegos

j_disponible(minecraft).
j_disponible(fifa).
j_disponible(solitario).
j_disponible(ajedrez).
j_disponible(need_for_speed).
j_disponible(gta).

%relaciones
tiene(javito,fifa).
tiene(rodri,solitario).
tiene(pepito,ajedrez).

%reglas
comprar_juego(NombreJuego) :- 
        j_disponible(NombreJuego),
        not(tiene(javito,NombreJuego)),
        not(tiene(rodri,NombreJuego)),
        not(tiene(pepito,NombreJuego)).
