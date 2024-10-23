%ahorcado
% Hangman.pl

:- use_module(library(random)).

% List of possible words
word_list(['prolog', 'hangman', 'random', 'words', 'game', 'programming']).

% Start the game
start :-
    word_list(Words),
    random_member(Word, Words),
    atom_chars(Word, Chars),
    length(Chars, Length),
    format('Welcome to Hangman! The word has ~w letters.~n', [Length]),
    play(Chars, [], 10).  % Start with 10 attempts.

% Play the game
play(Word, Guessed, 0) :-
    format('Game over! The word was: ~s~n', [Word]),
    display_word(Word, Guessed).
play(Word, Guessed, AttemptsLeft) :-
    display_word(Word, Guessed),
    (   check_win(Word, Guessed)
    ->  format('Congratulations! You guessed the word: ~s~n', [Word])
    ;   format('Attempts left: ~w~n', [AttemptsLeft]),
        format('Guess a letter: '),
        read(Letter),
        (   member(Letter, Guessed)
        ->  format('You already guessed that letter.~n'),
            play(Word, Guessed, AttemptsLeft)
        ;   (   member(Letter, Word)
            ->  format('Correct!~n'),
                play(Word, [Letter|Guessed], AttemptsLeft)
            ;   NewAttemptsLeft is AttemptsLeft - 1,
                format('Incorrect!~n'),
                draw_hangman(NewAttemptsLeft),
                play(Word, Guessed, NewAttemptsLeft)
            )
        )
    ).

% Check if the player has guessed all the letters
check_win([], _).
check_win([H|T], Guessed) :-
    member(H, Guessed),
    check_win(T, Guessed).

% Display the current state of the word
display_word([], _):- nl.
display_word([H|T], Guessed) :-
    (   member(H, Guessed)
    ->  format('~w ', [H])
    ;   format('_ ')
    ),
    display_word(T, Guessed).

% Draw the hangman depending on the number of attempts left (10 attempts total)
draw_hangman(10) :- format('No mistakes yet!~n').
draw_hangman(9)  :- format(' O~n').
draw_hangman(8)  :- format(' O~n |~n').
draw_hangman(7)  :- format(' O~n/|~n').
draw_hangman(6)  :- format(' O~n/|\\~n').
draw_hangman(5)  :- format(' O~n/|\\~n/ ~n').
draw_hangman(4)  :- format(' O~n/|\\~n/ \\~n').
draw_hangman(3)  :- format(' O~n/|\\~n/ \\~nLeft arm and leg hanging!~n').
draw_hangman(2)  :- format(' O~n/|\\~n/ \\~nOnly 2 attempts left!~n').
draw_hangman(1)  :- format(' O~n/|\\~n/ \\~nJust 1 attempt left!~n').
draw_hangman(0)  :- format(' O~n/|\\~n/ \\~nYou lost! Game Over!~n').
