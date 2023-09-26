% Cписки названий фильмов, жанров и дат
films(['Redemption', 'Canned', 'Paragraph 78', 'Children of Spies', 'The Hidden Menace', 'My Boss Daughter']).
genres(['Melodrama', 'Thriller', 'Action', 'Comedy', 'Thriller', 'Comedy']).
dates([date(2008, 2, 19), date(2007, 2, 22), date(2007, 2, 22), date(2001, 3, 30), date(2001, 11, 2), date(2003, 8, 22)]).

% Вывод названий фильмов и соответствующих жанров
print_films_with_genres :-
    films(FilmList),
    genres(GenreList),
    writeln('Films and Their Genres:'),
    print_films_and_genres(FilmList, GenreList).

% Вывод списка фильмов и жанров
print_films_and_genres([], []).
print_films_and_genres([Film|RestFilms], [Genre|RestGenres]) :-
    format('~w - ~w', [Film, Genre]),
    nl,
    print_films_and_genres(RestFilms, RestGenres).

main :-
    print_films_with_genres.
