% Lab 9 - IO Stream and Database Manipulation
:- dynamic letter/1.

letter(a).
letter(b).
letter(c).

name_game :-
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu.

menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(Choice),
    option(Choice).

option(1) :-
    findall(Letter, letter(Letter), Letters),
    write(Letters), nl,
    menu.
option(2) :-
    write('Enter a letter: '),
    read(Letter),
    assert(letter(Letter)),
    menu.
option(3) :-
    write('Enter a letter: '),
    read(Letter),
    asserta(letter(Letter)),
    menu.
option(4) :-
    write('Enter a letter: '),
    read(Letter),
    assertz(letter(Letter)),
    menu.
option(5) :-
    write('Enter a letter to delete: '),
    read(Letter),
    retract(letter(Letter)),
    menu.
option(6) :-
    retractall(letter(_)),
    menu.
option(7).
