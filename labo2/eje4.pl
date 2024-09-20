%algoritmo de busqueda binaria
number_to_guess(X):-
    random(N),
    is(X,floor(+(1,*(N,100)))).

play:-
    %calculas el numero
    number_to_guess(NumberToGuess),
    %empezar a adivinar
    guess_number(NumberToGuess,0).


guess_number(NumberToGuess,Attempts):-
    write("Adivina el numero entre 1 y 100: "),
    read(Guess),
    NewAttempts  is Attempts +1,
    %validamos si el numero es igual
    validate_number(NumberToGuess,Guess,NewAttempts).


validate_number(NumberToGuess,Guess,Attempts) :-
    =:=(NumberToGuess,Guess),
    write("Felicidades adivinaste el numero en "),
    write(Attempts),
    write(" intentos"),nl,
    !.

validate_number(NumberToGuess,Guess,Attempts) :-
    >(NumberToGuess,Guess),
    write("El numero es mayor"),nl,
    guess_number(NumberToGuess,Attempts).



