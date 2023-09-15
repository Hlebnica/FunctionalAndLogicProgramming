% Правило для порождения всех целых чисел в интервале от N1 до N2
for(N1, N2, N1) :-
    N1 =< N2.
for(N1, N2, X) :-
    N1 < N2,
    NextN1 is N1 + 1,
    for(NextN1, N2, X).

% Правило для вывода всех чисел в заданном интервале
print_numbers :-
    write('Input N1: '), read(N1),
    write('Input N2: '), read(N2),
    nl,
    for(N1, N2, X),
    writeln(X),
    fail.  % Принудительно искать следующее решение

% Запуск программы
:- print_numbers.
