films(['Redemption', 'Canned', 'Paragraph 78', 'Children of Spies', 'The Hidden Menace', 'My Boss Daughter']).
genres(['Melodrama', 'Thriller', 'Action', 'Comedy', 'Thriller', 'Comedy']).
dates([date(2008, 2, 19), date(2009, 2, 22), date(2007, 2, 22), date(2001, 3, 30), date(2001, 11, 2), date(2003, 8, 22)]).
durations([130, 115, 120, 90, 80, 95]).
countries(['United Kingdom', 'Russia', 'Russia', 'USA', 'USA', 'USA']).

% Разделение списка длительностей и названий фильмов на два списка
split_films_by_duration(Duration) :-
    durations(Durations),
    films(Films),
    split_films_by_duration_aux(Duration, Durations, Films).

split_films_by_duration_aux(_, [], []). % Базовый случай: оба списка пустые
split_films_by_duration_aux(Duration, [Dur|RestDurs], [Film|RestFilms]) :-
    Dur < Duration, % Фильм короткий
    write(Film), write(' - Shorter Film'), nl,
    split_films_by_duration_aux(Duration, RestDurs, RestFilms).
split_films_by_duration_aux(Duration, [Dur|RestDurs], [Film|RestFilms]) :-
    Dur >= Duration, % Фильм длинный
    write(Film), write(' - Longer Film'), nl,
    split_films_by_duration_aux(Duration, RestDurs, RestFilms).

% ------------------------------------------------------------

% Создание списка годов дат
years(Years) :-
    dates(Dates),
    findall(Year, (member(date(Year, _, _), Dates)), Years).

% Поиск максимального года
find_max_year :-
    years(Years),
    max_list(Years, MaxYear),
    write(MaxYear), nl.

% ------------------------------------------------------------

% Удаление повторяющихся элементов из списка
remove_duplicates :-
    countries(Countries),
    remove_duplicates(Countries, UniqueCountries),
    write(UniqueCountries), nl.

% Определение предиката для удаления повторяющихся элементов
remove_duplicates([], []).
remove_duplicates([H | T], Result) :-
    member(H, T),
    remove_duplicates(T, Result).
remove_duplicates([H | T], [H | Result]) :-
    \+ member(H, T),
    remove_duplicates(T, Result).
