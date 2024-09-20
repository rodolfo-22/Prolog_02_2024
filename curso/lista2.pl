%artistas
artista(ed_sheeran, [albums(7), singles(33), premios(14), seguidores(110000000)]).
artista(beyonce, [albums(6), singles(70), premios(23), seguidores(170000000)]).
artista(bruno_mars, [albums(3), singles(27), premios(11), seguidores(90000000)]).
artista(adele, [albums(3), singles(20), premios(15), seguidores(150000000)]).
artista(shakira, [albums(11), singles(56), premios(26), seguidores(120000000)]).
artista(eminem, [albums(11), singles(88), premios(15), seguidores(130000000)]).
artista(taylor_swift, [albums(9), singles(61), premios(32), seguidores(160000000)]).
artista(drake, [albums(6), singles(120), premios(10), seguidores(190000000)]).
artista(lady_gaga, [albums(6), singles(42), premios(22), seguidores(140000000)]).
artista(rihanna, [albums(8), singles(64), premios(21), seguidores(260000000)]).
artista(katy_perry, [albums(5), singles(63), premios(14), seguidores(120000000)]).
artista(justin_bieber, [albums(7), singles(51), premios(22), seguidores(240000000)]).
artista(ariana_grande, [albums(6), singles(55), premios(20), seguidores(230000000)]).
artista(kanye_west, [albums(10), singles(58), premios(21), seguidores(190000000)]).
artista(taylor_swift, [albums(9), singles(61), premios(32), seguidores(160000000)]).
artista(drake, [albums(6), singles(120), premios(10), seguidores(190000000)]).
artista(billie_eilish, [albums(1), singles(12), premios(10), seguidores(65000000)]).
artista(travis_scott, [albums(4), singles(34), premios(9), seguidores(43000000)]).
artista(lil_nas_x, [albums(1), singles(8), premios(7), seguidores(37000000)]).
artista(cardi_b, [albums(1), singles(17), premios(15), seguidores(85000000)]).

%premios
premio(ed_sheeran, [grammy, brit_award, billboard_music_award]).
premio(beyonce, [grammy, mtv_video_music_award, billboard_music_award]).
premio(bruno_mars, [grammy, mtv_video_music_award, american_music_award]).
premio(adele, [grammy, brit_award, billboard_music_award]).
premio(shakira, [grammy_latino, mtv_video_music_award, billboard_music_award]).
premio(eminem, [grammy, mtv_video_music_award, billboard_music_award]).
premio(taylor_swift, [grammy, mtv_video_music_award, american_music_award]).
premio(drake, [grammy, mtv_video_music_award, billboard_music_award]).
premio(lady_gaga, [grammy, mtv_video_music_award, billboard_music_award, grammy2024]).
premio(rihanna, [grammy, mtv_video_music_award]).

%canciones
cancion(shape_of_you, [pop, dance, rb], ed_sheeran).
cancion(halo, [pop, rb], beyonce).
cancion(uptown_funk, [pop, funk, rb], bruno_mars).
cancion(hello, [pop, soul], adele).
cancion(waka_waka, [pop, latin, dance], shakira).
cancion(lose_yourself, [hip_hop, rap], eminem).
cancion(blank_space, [pop, electropop], taylor_swift).
cancion(one_dance, [pop, dancehall, rb], drake).
cancion(bad_romance, [pop, dance, electropop], lady_gaga).
cancion(umbrella, [pop, rb], rihanna).
cancion(sorry, [pop, dance], justin_bieber).
cancion(roar, [pop, rock], katy_perry).
cancion(no_tears_left_to_cry, [pop, dance], ariana_grande).
cancion(fade, [hip_hop, rap], kanye_west).
cancion(the_1, [pop, indie], taylor_swift).
cancion(in_my_feelings, [pop, rb], drake).
cancion(bad_guy, [pop, electropop], billie_eilish).
cancion(sicko_mode, [hip_hop, trap], travis_scott).
cancion(old_town_road, [country_rap], lil_nas_x).
cancion(wap, [hip_hop, rb], cardi_b).

%listas de reproduccion
lista_reproduccion(favoritas_1, [shape_of_you, hello, waka_waka]).
lista_reproduccion(energia_positiva, [uptown_funk, roar, happy, hello]).
lista_reproduccion(relajante, [halo, one_dance, umbrella]).
lista_reproduccion(clasicos, [lose_yourself, bad_romance, sorry]).
lista_reproduccion(verano, [despacito, calma, summer, waka_waka]).


%regla para determinar si una cancion esta en una lista de reproduccion
cancion_en_lista(Cancion, Lista) :-
        lista_reproduccion(Lista, Canciones),
        member(Cancion, Canciones).
        
%el artista de una cancion
artista_cancion(Cancion, Artista) :-
        cancion(Cancion,_,Artista).

%Que me liste todos los premios de un cantante
premios_cantante(Cantante, Premio) :-
        premio(Cantante, Premios),
        member(Premio, Premios),
        write(Premio), nl,
        fail.
        
%me diga cantidad de premios que tiene un cantante
cantidad_premios(Cantante, Cantidad) :-
        premio(Cantante, Premios),
        length(Premios, Cantidad).

%me verifique si un artista tiene mas de 1000000 de seguidores
%como accedo a un dato de una lista
muchos_seguidores(Cantante) :-
        artista(Cantante,[_,_,_,seguidores(Cantidad)]),
        Cantidad > 100000000.

%encuentra todas las cacniones que estan en ,as de una lista de reproduccion
canciones_en_mas_de_una_lista(Cancion) :-
        