%Categorias
categoria(fantasia).
categoria(novela).
categoria(ciencia_ficcion).
categoria(misterio).
categoria(poemas).
categoria(historia).
categoria(autoayuda).
categoria(romance).
categoria(aventura).
categoria(poesia).

%Autores
autor(antoine_de_saint_exupery).
autor(gabriel_garcia_marquez).
autor(jrr_tolkien).
autor(isaac_asimov).
autor(jane_austen).
autor(jk_rowling).
autor(stephen_king).
autor(pablo_neruda).
autor(ernest_hemingway).
autor(george_orwell).

%Usuarios
usuario(juan, 25, masculino, estudiante).
usuario(maria, 30, femenino, ingeniera).
usuario(pedro, 35, masculino, médico).
usuario(ana, 28, femenino, abogada).
usuario(luis, 40, masculino, arquitecto).

%Libros
%libro(titulo, autor, categoria, disponible, veces_prestado)
libro(el_principito, autor(antoine_de_saint_exupery), fantasia, false, 10).
libro(cien_anos_de_soledad, autor(gabriel_garcia_marquez), novela, true, 25).
libro(el_hobbit, autor(jrr_tolkien), fantasia, true, 25).
libro(fundacion, autor(isaac_asimov), ciencia_ficcion, true, 1).
libro(orgullo_y_prejuicio, autor(jane_austen), novela, true, 2).
libro(harry_potter_y_la_piedra_filosofal, autor(jk_rowling), fantasia, false, 11).
libro(it, autor(stephen_king), misterio, true, 13).
libro(veinte_poemas_de_amor_y_una_cancion_desesperada, autor(pablo_neruda), poemas, true, 2).
libro(adios_a_los_arboles, autor(ernest_hemingway), historia, true, 3).
libro(1984, autor(george_orwell), ciencia_ficcion, false, 15).
libro(alicia_en_el_pais_de_las_maravillas, autor(lewis_carroll), fantasia, false, 12).
libro(cronica_de_una_muerte_anunciada, autor(gabriel_garcia_marquez), novela, true, 10).
libro(el_senor_de_los_anillos, autor(jrr_tolkien), fantasia, true, 25).
libro(fahrenheit_451, autor(ray_bradbury), ciencia_ficcion, true, 7).
libro(orgullo_y_prejuicio, autor(jane_austen), novela, true, 9).
libro(harry_potter_y_la_camara_secreta, autor(jk_rowling), fantasia, true, 8).
libro(el_resplandor, autor(stephen_king), misterio, true, 7).
libro(veinte_poemas_de_amor_y_una_cancion_desesperada, autor(pablo_neruda), poemas, false, 5).
libro(adios_a_los_arboles, autor(ernest_hemingway), historia, true, 7).
libro(rebelion_en_la_granja, autor(george_orwell), novela, true, 11).

%Prestamos
%prestamo(libro, fecha, usuario)
prestamo(el_principito, date(2024, 4, 1), juan).
prestamo(cien_anos_de_soledad, date(2024, 3, 15), maria).
prestamo(el_hobbit, date(2024, 4, 10), pedro).
prestamo(fundacion, date(2024, 3, 25), luis).
prestamo(orgullo_y_prejuicio, date(2024, 4, 5), pedro).
prestamo(harry_potter_y_la_piedra_filosofal, date(2024, 3, 20), maria).
prestamo(it, date(2024, 4, 3), luis).
prestamo(veinte_poemas_de_amor_y_una_cancion_desesperada, date(2024, 3, 28), juan).
prestamo(adios_a_los_arboles, date(2024, 4, 7), juan).
prestamo(1984, date(2024, 3, 22), maria).

%Devoluciones
%devolucion(libro, fecha)
devolucion(el_principito, date(2024, 4, 10)).
devolucion(cien_anos_de_soledad, date(2024, 4, 5)).
devolucion(el_hobbit, date(2024, 4, 15)).
devolucion(fundacion, date(2024, 4, 1)).
devolucion(orgullo_y_prejuicio, date(2024, 4, 10)).
devolucion(harry_potter_y_la_piedra_filosofal, date(2024, 4, 5)).
devolucion(it, date(2024, 4, 10)).
devolucion(veinte_poemas_de_amor_y_una_cancion_desesperada, date(2024, 4, 10)).
devolucion(adios_a_los_arboles, date(2024, 4, 10)).
devolucion(1984, date(2024, 4, 10)).

%Reglas de Horn

%regla para ver los libros que mas han sido prestados
libro_mas_prestado(Libro) :-
        libro(Libro,_,_,_,Veces),
        Veces >= 10.

best_seller(Libro) :-
        libro(Libro,_,_,_,Veces),
        Veces == 25,
        %para que te imprima toddos y no vayas dando ;
        write(Libro), nl,
        fail.

%Regla para ver si un libro esta disponible
disponible(Libro) :-
        libro(Libro,_,_,true,_).

%Regla para saber que libro fue prestado en  un rango de fechas
libro_prestado_entre(Libro, FechaInicio, FechaFin) :-
        prestamo(Libro, Fecha, _),
        Fecha @>= FechaInicio,
        Fecha @=< FechaFin.
        
libro_prestado(Libro, Fecha) :-
        prestamo(Libro, Fecha, _).

%Regla pasar saber ls libros prestados por un usuario
libros_prestados_por(Usuario) :-
    %para extraer el libro que haga macht con el usuario que ingrese
        prestamo(Libro, _, Usuario),
    %para imprimir el libro que se presto, salto de linea
        write(Libro), nl,
    %al final que finalice la busqueda
        fail.

%Regla par alistar los usuarios que han prestado un libro
usuarios_que_han_prestado(Libro) :-
        prestamo(Libro, _, Usuario),
        write(Usuario), nl,
        fail.

%Cuantos libros ha prestado un usuario
libros_prestados_por(Usuario, Cantidad) :-
        findall(Libro, prestamo(Libro, _, Usuario), Lista),
        length(Lista, Cantidad).

%Regla para saber si un libro ha sido prestado
libro_prestado(Libro) :-
        prestamo(Libro, _, _).

%Regla para saber si un libro ha sido devuelto
libro_devuelto(Libro) :-
        devolucion(Libro, _).

%Regla para saber si un libro ha sido devuelto en un rango de fechas
libro_devuelto_entre(Libro, FechaInicio, FechaFin) :-
        devolucion(Libro, Fecha),
        Fecha @>= FechaInicio,
        Fecha @=< FechaFin.

