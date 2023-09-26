% Предикат для замены положительных значений на первый элемент списка
replace_positive_with_first([H | T], Result) :-
    replace_positive_with_first([H | T], H, Result).

replace_positive_with_first([H | T], First, [First | Rest]) :-
    H >= 0, % Если текущий элемент положителен, заменяем его на первый элемент
    replace_positive_with_first(T, First, Rest).

replace_positive_with_first([H | T], First, [H | Rest]) :-
    H < 0, % Если текущий элемент отрицателен, оставляем его без изменений
    replace_positive_with_first(T, First, Rest).

replace_positive_with_first([], _, []). % Базовый случай: пустой список

% replace_positive_with_first([5, -2, 3, 7, -1, 8], Result).