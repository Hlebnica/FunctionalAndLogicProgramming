% Поиск элемента в списке с отслеживанием шагов
% search(Element, List)
search(Element, [Element|_]) :-
    writeln('Element found:'), writeln(Element), % Шаг 1: Элемент найден
    !. % Отсечение, чтобы предотвратить дальнейший поиск
search(Element, [Head|Rest]) :-
    writeln('Checking element: '), writeln(Head), % Шаг 1: Проверка текущего элемента
    search(Element, Rest). % Шаг 2: Рекурсивный вызов для остальных элементов


main :-
    writeln('Enter the element you want to search for: '),
    read(Element),
    writeln('Enter a list of integers: '),
    read(List),
    search(Element, List).