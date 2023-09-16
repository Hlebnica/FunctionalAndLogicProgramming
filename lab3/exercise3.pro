% Предикат для вычисления суммы ряда нечетных чисел
sum_odd_series(1, 1).  % Базовый случай: сумма ряда S(1) = 1

sum_odd_series(N, Sum) :-
    N > 1,
    N1 is N - 2,  % Переходим к следующему нечетному числу
    sum_odd_series(N1, Partial_Sum),
    Sum is N + Partial_Sum.  % Сумма S(N) = N + S(N-2)

% Запуск программы для вычисления S(15)
:- sum_odd_series(15, Sum),
   write('Sum of a series of odd numbers:'), nl,
   write('S(15) = '), write(Sum), nl.
