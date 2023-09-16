% Предикат для подсчета количества цифр в числе
count_digits(0, 0).  % Базовый случай: у числа 0 нет цифр

count_digits(N, Count) :-
    N > 0,
    N1 is N // 10,  % Убираем последнюю цифру
    count_digits(N1, PartialCount),
    Count is PartialCount + 1.

% Предикат для определения, в каком из чисел больше цифр
compare_digits_count :-
    write('Input first number: '), read(Number1),
    write('Input second number: '), read(Number2),
    
    count_digits(Number1, Count1),
    count_digits(Number2, Count2),
    
    (Count1 > Count2 ->
        write('The first number has more digits.')
    ;
        Count1 < Count2 ->
        write('The second number has more digits.')
    ;
        write('Both numbers have the same number of digits.')
    ).

% Запуск программы
:- compare_digits_count.
