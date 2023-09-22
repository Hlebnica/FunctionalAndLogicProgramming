% Факты о фильмах: номер, название, страна, продолжительность, жанр, дата
film(1, 'Redemption', 'United Kingdom', 130, 'melodrama', date(2008, 2, 19)).
film(2, 'Canned', 'Russia', 115, 'thriller', date(2007, 2, 22)).
film(3, 'Paragraph 78', 'Russia', 90, 'action', date(2007, 2, 22)).
film(4, 'Children of Spies', 'USA', 90, 'comedy', date(2001, 3, 30)).
film(5, 'The Hidden Menace', 'USA', 90, 'thriller', date(2001, 11, 2)).
film(6, 'My Boss Daughter', 'USA', 90, 'comedy', date(2003, 8, 22)).

% Создаем список названий фильмов
create_movie_names_list(MovieNames) :-
    findall(Name, film(_, Name, _, _, _, _), MovieNames).

% Создаем список жанров
create_genre_list(Genres) :-
    findall(Genre, film(_, _, _, _, Genre, _), Genres).

% Создаем список дат в виде структур
create_date_list(Dates) :-
    findall(Date, film(_, _, _, _, _, Date), Dates).

% Предикат для вывода названий фильмов и соответствующих жанров
print_movies_with_genres :-
    create_movie_names_list(MovieNames),
    create_genre_list(Genres),
    print_movies_with_genres_helper(MovieNames, Genres).

% Вспомогательный предикат для вывода названий фильмов и соответствующих жанров
print_movies_with_genres_helper([], []).
print_movies_with_genres_helper([Movie | RestMovies], [Genre | RestGenres]) :-
    format('Movie: ~w, Genre: ~w', [Movie, Genre]),
    nl,
    print_movies_with_genres_helper(RestMovies, RestGenres).

% Основной предикат для выполнения всей программы
main :-
    writeln('Movies and Their Genres:'),
    print_movies_with_genres.
