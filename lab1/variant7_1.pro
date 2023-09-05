% Ввод чисел
main :-
    write('Input X: '),
    read(X),
    write('Input Y: '),
    read(Y),
    calculate_result(X, Y, Result),
    write('Result: '), write(Result), nl.

% Значение выражения
calculate_result(X, Y, Result) :-
    Result is ((X + 6) ** 2) + Y / log10(3.56).