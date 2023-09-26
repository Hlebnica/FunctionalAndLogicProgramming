% Слияние двух списков
% merge_lists(List1, List2, Merged)
merge_lists([], List2, List2). % Шаг 1: Если первый список пуст, результат - второй список
merge_lists([Head|Tail], List2, [Head|MergedTail]) :-
    writeln('Merging element: '), writeln(Head), % Шаг 1: Объединение текущего элемента из первого списка
    merge_lists(Tail, List2, MergedTail). % Шаг 2: Рекурсивный вызов для остальных элементов первого списка


main :-
    List1 = [5, 4],
    List2 = [3, 2, 1],
    merge_lists(List1, List2, Merged),
    writeln('Merged list: '), writeln(Merged).