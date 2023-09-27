% Граф
edge(a, b).
edge(b, c).
edge(c, d).
edge(d, a).
edge(b, e).
edge(e, f).
edge(f, g).
edge(g, h).
edge(h, e).
edge(i, j).
edge(j, k).
edge(k, i).

% Поиск цикла заданной длины
find_cycle(Length, Cycle) :-
    find_cycle([], Length, Start, Cycle, Start).

find_cycle(_, 0, Start, [Start], End) :- % Нашли цикл заданной длины, проверяем замыкание
    edge(Start, End).
find_cycle(_, 1, Start, [Start], Start). % Цикл длины 1, замыкается сам на себя
find_cycle(Visited, Length, Start, [Start | Rest], End) :-
    Length > 0,
    edge(Start, Next), % Переходим к следующей вершине
    \+ member(Next, Visited), % Проверяем, что не посещали эту вершину ранее
    NewLength is Length - 1,
    find_cycle([Start | Visited], NewLength, Next, Rest, End). % Рекурсивно ищем цикл

% Пример использования:
% find_cycle(2, Cycle).
% find_cycle(3, Cycle).

