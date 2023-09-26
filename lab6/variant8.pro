% Определение графа. Здесь представлен ориентированный граф в виде списков смежности.
% Каждый узел представлен фактом edge/2, где первый аргумент - исходный узел, а второй - узел, в который идет ребро.

edge(a, b).
edge(b, c).
edge(b, d).
edge(c, a).
edge(d, e).
edge(e, f).
edge(f, d).

% Предикат для поиска цикла заданной длины в графе
find_cycle(Graph, Length, Start, Path) :-
    dfs(Graph, Length, Start, [], Path).

% Главный предикат для поиска в глубину с ограничением длины
dfs(_, 0, Node, Path, [Node | Path]) :-
    reverse([Node | Path], PathReversed),
    cyclic(PathReversed). % Проверяем, является ли путь циклом.
dfs(Graph, Length, Node, Visited, Path) :-
    Length > 0,
    edge(Node, Next), % Выбираем следующий узел.
    \+ member(Next, Visited), % Проверяем, что узел не был посещен ранее.
    NewLength is Length - 1,
    dfs(Graph, NewLength, Next, [Node | Visited], Path).

% Предикат для проверки, является ли список циклом
cyclic(Path) :-
    append(Start, End, Path), % Разбиваем путь на начало и конец.
    append(End, Start, Path). % Обратно объединяем начало и конец, должно получиться исходный путь.

% Пример использования:
% find_cycle([a, b, c, d, e, f], 4, a, Cycle).
