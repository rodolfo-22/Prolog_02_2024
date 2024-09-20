%almacen
%productos, categroia
disponible(cocina, electrodomesticos).
disponible(televisor, electrodomesticos).
disponible(compu,electrodomesticos).
disponible(pan, panaderia).
disponible(tarta, panaderia).
disponible(tresleche, panaderia).


interesa(juan, panaderia).
interesa(robles, electrodomesticos).

comprado(juan,pan).
comprado(robles,cocina).

%Regla
recomienda(Usuario, Producto) :-
        interesa(Usuario,Categoria),
        disponible(Producto,Categoria),
        not(comprado(Usuario,Producto)).
