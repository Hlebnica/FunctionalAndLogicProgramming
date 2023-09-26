% Предикат для разделения списка на два подсписка
% split_list(List, List1, List2)
split_list([], [], []). % Базовый случай: если список пустой, оба подсписка также пусты
split_list([X], [X], []). % Базовый случай: если в списке один элемент, первый подсписок содержит этот элемент, а второй - пустой
split_list([X,Y|Rest], [X|List1], [Y|List2]) :-
    writeln('Splitting elements: '), writeln(X), writeln(Y), % Разделение текущих двух элементов
    split_list(Rest, List1, List2). % Рекурсивный вызов для остальных элементов

% Основной предикат для выполнения программы
main :-
    List = [23, 1, 34, 2, 45, 5, 4],
    split_list(List, List1, List2),
    writeln('First sublist: '), writeln(List1),
    writeln('Second sublist: '), writeln(List2).