% Предикат для вывода чисел от 7 до 1
write_numbers :-
    write('Digits:'), nl, nl,
    write_numbers_from(7),  % Начинаем с 7
    nl, nl,
    write('Bye!').

% Предикат для вывода чисел, начиная с указанного числа и убывая до 1
write_numbers_from(N) :-
    N >= 1,  % Базовый случай: остановка при N <= 1
    write(' '), write(N), nl,
    Next_N is N - 1,  % Убываем на 1
    write_numbers_from(Next_N).  % Рекурсивный вызов с убыванием N

