films(['Redemption', 'Canned', 'Paragraph 78', 'Children of Spies', 'The Hidden Menace', 'My Boss Daughter']).
genres(['Melodrama', 'Thriller', 'Action', 'Comedy', 'Thriller', 'Comedy']).
dates([date(2008, 2, 19), date(2007, 2, 22), date(2007, 2, 22), date(2001, 3, 30), date(2001, 11, 2), date(2003, 8, 22)]).
durations([130, 115, 90, 90, 90, 90]).
countries(['United Kingdom', 'Russia', 'Russia', 'USA', 'USA', 'USA']).

% Разделение списка длительностей и названий фильмов на два списка
split_films_by_duration(Duration, ShorterFilms, LongerFilms) :-
    durations(Durations),
    films(Films),
    split_films_by_duration_aux(Duration, Durations, Films, ShorterFilms, LongerFilms).

split_films_by_duration_aux(_, [], [], [], []). % Базовый случай: оба списка пустые
split_films_by_duration_aux(Duration, [Dur|RestDurs], [Film|RestFilms], [Film|ShorterFilms], LongerFilms) :-
    Dur < Duration, % Фильм короткий
    split_films_by_duration_aux(Duration, RestDurs, RestFilms, ShorterFilms, LongerFilms).
split_films_by_duration_aux(Duration, [Dur|RestDurs], [Film|RestFilms], ShorterFilms, [Film|LongerFilms]) :-
    Dur >= Duration, % Фильм длинный
    split_films_by_duration_aux(Duration, RestDurs, RestFilms, ShorterFilms, LongerFilms).

% Пример использования:
% split_films_by_duration(120, Shorter, Longer).
% Shorter - список фильмов с длительностью менее 120 минут
% Longer - список фильмов с длительностью 120 минут и более

% ------------------------------------------------------------

% Создание списка годов дат
years(Years) :-
    dates(Dates),
    findall(Year, (member(date(Year, _, _), Dates)), Years).

% Поиск максимального года
find_max_year(MaxYear) :-
    years(Years),
    max_list(Years, MaxYear).

% Пример использования:
% find_max_year(MaxYear).
% MaxYear - самый поздний год премьеры

% ------------------------------------------------------------

% Удаление повторяющихся элементов из списка
remove_duplicates([], []).
remove_duplicates([H | T], Result) :-
    member(H, T), % Если текущий элемент уже есть в хвосте списка,
    remove_duplicates(T, Result). % то пропускаем его.
remove_duplicates([H | T], [H | Result]) :-
    \+ member(H, T), % Если текущего элемента нет в хвосте списка,
    remove_duplicates(T, Result). % то добавляем его в результат.

% Пример использования:
% countries(Countries),
% remove_duplicates(Countries, UniqueCountries).
% UniqueCountries - список стран без повторений
