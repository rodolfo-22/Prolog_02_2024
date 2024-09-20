%sistema de pelicula

pelicula(rapunzel,animacion).
pelicula(frozen,ciencia_ficcion).
pelicula(romeoyjulieta,romantica).
pelicula(terminator,ciencia_ficcion).
pelicula(los_vengadores,accion).
pelicula(los_vengadores2,accion).
pelicula(alicia,fantasia).
pelicula(los_increibles,animacion).
pelicula(rocky, deportes).

gusta(juan,ciencia_ficcion).
gusta(oscar,accion).

visto(juan,frozen).
visto(oscar,terminator).

%relaciones, nombres de usuarion y genero que prefieren, dentor de la regla es como que estemos haciendo las consultas
r_peli(Usuario,Pelicula) :-
        gusta(Usuario,Genero),
        pelicula(Pelicula,Genero),
        not(visto(Usuario,Pelicula)).


%el not es para que no se repitan las peliculas que ya vio
