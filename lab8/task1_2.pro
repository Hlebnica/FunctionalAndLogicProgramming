% Меню
menu :-
    writeln('Football Database Menu:'),
    writeln('1. Add a player'),
    writeln('2. Remove a player'),
    writeln('3. Search for a player'),
    writeln('4. List all players'),
    writeln('5. Quit the program'),
    read(Choice),
    process_choice(Choice).

% Пункты меню
process_choice(1) :- add_player.
process_choice(2) :- remove_player.
process_choice(3) :- search_player.
process_choice(4) :- list_players.
process_choice(5) :- abort.
process_choice(_) :- writeln('Invalid choice. Please try again.'), menu.

% Добавление игрока в БД
add_player :-
    writeln('Enter the player name:'),
    read(Name),
    writeln('Enter the player team:'),
    read(Team),
    writeln('Enter the player number:'),
    read(Number),
    writeln('Enter the player height:'),
    read(Height),
    writeln('Enter the player weight:'),
    read(Weight),
    writeln('Enter the player NFL seasons:'),
    read(Seasons),
    assertz(player(Name, Team, Number, Height, Weight, Seasons)),
    writeln('Player added to the database.'),
    menu.

% Удаление игрока из БД
remove_player :-
    writeln('Enter the name of the player to remove:'),
    read(Name),
    retract(player(Name, _, _, _, _, _)),
    writeln('Player removed from the database.'),
    menu.

% Поиск информации о игроке
search_player :-
    writeln('Enter the name of the player to search for:'),
    read(Name),
    player(Name, Team, Number, Height, Weight, Seasons),
    format('Name: ~w~nTeam: ~w~nNumber: ~w~nHeight: ~w cm~nWeight: ~w kg~nNFL seasons: ~w~n', [Name, Team, Number, Height, Weight, Seasons]),
    menu.
search_player :-
    writeln('Player not found.'),
    menu.

% Список всех игроков
list_players :-
    writeln('List of all players:'),
    player(Name, Team, Number, Height, Weight, Seasons),
    format('Name: ~w Team: ~w Number: ~w Height: ~w cm Weight: ~w kg NFL seasons: ~w~n', [Name, Team, Number, Height, Weight, Seasons]),
    fail.
list_players :-
    menu.


:- menu.
