film(1, 'Redemption', 'United Kingdom', 130, 'melodrama', '19.02.2008').
film(2, 'Canned', 'Russia', 115, 'thriller', '22.02.2007').
film(3, 'Paragraph 78', 'Russia', 90, 'action', '22.02.2007').
film(4, 'Children of Spies', 'USA', 90, 'comedy', '30.03.2001').
film(5, 'The Hidden Menace', 'USA', 90, 'thriller', '2.11.2001').
film(6, 'My Boss Daughter', 'USA', 90, 'comedy', '22.08.2003').

% Предикат для проверки, является ли фильм американским
is_american_film(Title) :-
    film(_, Title, 'USA', _, _, _).

% Предикат для проверки, был ли фильм выпущен после 2005 года
is_recent_film(Title) :-
    film(_, Title, _, _, _, Date),
    date_to_year(Date, Year),
    Year > 2005.

% Предикат для преобразования даты в год
date_to_year(Date, Year) :-
    atom_chars(Date, Chars),
    append(_, [YearChar1, YearChar2, YearChar3, YearChar4|_], Chars),
    atom_chars(YearAtom, [YearChar1, YearChar2, YearChar3, YearChar4]),
    atom_number(YearAtom, Year).

% Предикат для вывода списка американских фильмов
print_all_american_films :-
    findall(Title, is_american_film(Title), AmericanFilms),
    print_film_list(AmericanFilms).

% Предикат для вывода списка фильмов, выпущенных после 2005 года
print_all_recent_films :-
    findall(Title, is_recent_film(Title), RecentFilms),
    print_film_list(RecentFilms).

% Предикат для вывода списка фильмов
print_film_list([]).
print_film_list([Title|Residue]) :-
    writeln(Title),
    print_film_list(Residue).

% Основной предикат
main :-
    writeln('All American Films:'),
    print_all_american_films,
    nl,
    writeln('All Films released after 2005:'),
    print_all_recent_films.
